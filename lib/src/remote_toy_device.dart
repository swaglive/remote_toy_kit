/// A connected remote-toy device that exposes control, sensor, and
/// connection-state APIs.
///
/// Constructed via [RemoteToyDevice.build], which wires up [Hardware],
/// [ProtocolHandler], and [ProtocolAttributes]. Client code sends
/// commands through [executeCommand] and observes connection state
/// via [connected$].
library remote_toy_device;

import 'dart:async';
import 'dart:collection';

import '../remote_toy_kit.dart';
import 'core/hardware/hardware.dart';
import 'core/protocol/actuator_command_manager.dart';
import 'core/protocol/protocol.dart';
import 'util/logger.dart';

/// A connected remote-toy device that provides control and read capabilities.
class RemoteToyDevice {
  /// Builds a [RemoteToyDevice] instance.
  ///
  /// [hardware] is the low-level interface for communicating with the
  /// physical device. [protocolHandler] implements vendor-specific command
  /// logic and packet encoding. [protocolAttributes] describes the device's
  /// supported features.
  factory RemoteToyDevice.build({
    required Hardware hardware,
    required ProtocolHandler protocolHandler,
    required ProtocolAttributes protocolAttributes,
  }) =>
      RemoteToyDevice._(
        hardware: hardware,
        protocolHandler: protocolHandler,
        protocolAttributes: protocolAttributes,
      )
        .._prepareFeatures()
        .._listen();

  RemoteToyDevice._({
    required Hardware hardware,
    required ProtocolHandler protocolHandler,
    required ProtocolAttributes protocolAttributes,
  })  : _protocolAttributes = protocolAttributes,
        _hardware = hardware,
        _protocolHandler = protocolHandler,
        _actuatorCommandManager = ActuatorCommandManager(
            features: protocolAttributes.features ?? []) {
    logger.d('RemoteToyDevice connected (${name()})');
  }

  final Hardware _hardware;
  final ProtocolHandler _protocolHandler;
  final ProtocolAttributes _protocolAttributes;

  final List<RemoteToyDeviceFeature> _features = [];

  List<RemoteToyDeviceFeature> get features => UnmodifiableListView(_features);

  /// Manages actuator command state and value conversions.
  final ActuatorCommandManager _actuatorCommandManager;

  final StreamController<RemoteToyServerMessage> _events$ =
      StreamController.broadcast();

  StreamSubscription<HardwareEvent>? _hardwareEventSubscription;
  StreamSubscription<RemoteToyServerMessage>? _protocolHandlerEventSubscription;

  /// Observable stream of the device's connection state.
  Stream<bool> get connected$ => _hardware.connected$;

  /// Whether the device is currently connected.
  bool get connected => _hardware.connected;

  /// The device name from protocol attributes.
  String name() => _protocolAttributes.name;

  /// The unique hardware identifier for this device.
  String get id => _hardware.id;

  void _prepareFeatures() {
    _features.clear();
    for (final (index, element)
        in (_protocolAttributes.features ?? []).indexed) {
      _features
          .add(RemoteToyDeviceFeature.fromConfig(element, featureIndex: index));
    }
    logger.d('RemoteToyDevice find features (${name()})', context: {
      'features': _features,
    });
  }

  void _listen() {
    // Forward events emitted by the protocol handler
    _protocolHandlerEventSubscription =
        _protocolHandler.events$.listen((event) {
      _events$.add(event);
    });
  }

  /// Disconnects from the device and cancels all event subscriptions.
  Future<void> disconnect() async {
    logger.d('RemoteToyDevice disconnected (${name()})');
    await Future.wait([
      _hardwareEventSubscription?.cancel(),
      _protocolHandlerEventSubscription?.cancel()
    ].nonNulls);
    await _hardware.disconnect();
  }

  /// Checks whether the given message is supported by the device's feature set.
  bool _supportsMessage(RemoteToyClientMessage message) {
    bool checkMessage(RemoteToyClientMessageType type) =>
        _protocolAttributes.isAllowedMessage(messageType: message.type);
    return switch (message) {
      // Universal commands — always allowed regardless of the feature set
      StopDeviceCmdClientMessage() => true,
      StopAllDevicesClientMessage() => true,
      OutputCmdClientMessage() => true,
      InputCmdClientMessage() => true,
      ScalarCmdClientMessage() ||
      LinearCmdClientMessage() ||
      RotateCmdClientMessage() ||
      SensorReadCmdClientMessage() ||
      SensorSubscribeCmdClientMessage() ||
      SensorUnsubscribeCmdClientMessage() =>
        checkMessage(message.type),
    };
  }

  /// Executes a device command described by [message].
  ///
  /// Throws [RemoteToyDeviceException] if the message is unsupported, fails
  /// validation, or encounters a hardware error.
  Future<RemoteToyServerMessage> executeCommand({
    required RemoteToyClientMessage message,
  }) async {
    if (!_supportsMessage(message)) {
      throw RemoteToyDeviceException(
        code: RemoteToyDeviceException.codeCommandNotSupported,
        message:
            'Command message (${message.type.name}) not allowed by this protocol(${_protocolHandler.runtimeType})',
      );
    }

    // Let the protocol handler intercept all commands if it declares support
    if (_protocolHandler.hasHandleMessage) {
      final List<HardwareCmd> hardwareCmds =
          _protocolHandler.handleMessage(message: message);
      return _handleHardwareCommands(commands: hardwareCmds);
    }

    switch (message) {
      case StopDeviceCmdClientMessage():
        return _handleStopDeviceCmd(message: message);
      case StopAllDevicesClientMessage():
        return _handleStopAllDevicesCmd(message: message);
      case SensorReadCmdClientMessage():
        return _handleSensorReadCmd(message: message);
      case SensorSubscribeCmdClientMessage():
        return _handleSensorSubscribeCmd(message: message);
      case SensorUnsubscribeCmdClientMessage():
        return _handleSensorUnsubscribeCmd(message: message);
      case ScalarCmdClientMessage():
        return _handleScalarCmd(message: message);
      case RotateCmdClientMessage():
        return _handleRotateCmd(message: message);
      case LinearCmdClientMessage():
        return _handleHardwareCommands(
          commands: _protocolHandler.handleLinearCmd(message: message),
        );
      case OutputCmdClientMessage():
        return _handleOutputCmd(message: message);
      case InputCmdClientMessage():
        return _handleInputCmd(message: message);
    }
  }

  Future<RemoteToyServerMessage> _handleStopDeviceCmd({
    required StopDeviceCmdClientMessage message,
  }) async {
    final List<RemoteToyClientMessage> commands =
        _actuatorCommandManager.stopCommands;
    for (final RemoteToyClientMessage command in commands) {
      await executeCommand(message: command);
    }
    return const RemoteToyServerMessage.empty();
  }

  Future<RemoteToyServerMessage> _handleStopAllDevicesCmd({
    required StopAllDevicesClientMessage message,
  }) async {
    throw UnimplementedError('StopAllDevicesCmd is not implemented yet');
  }

  Future<RemoteToyServerMessage> _handleScalarCmd({
    required ScalarCmdClientMessage message,
  }) async {
    if (message.scalars.isEmpty) {
      throw RemoteToyDeviceException(
        code: RemoteToyDeviceException.codeCommandPayloadInvalid,
        message: 'ScalarCmd with no subcommands is not valid.',
        details: message.toJson(),
      );
    }
    for (final command in message.scalars) {
      final List<DeviceFeature> features = _protocolAttributes.features ?? [];
      final int featureCount = features.length;
      final int featureIndex = command.featureIndex;
      if (featureIndex > featureCount) {
        throw RemoteToyDeviceException(
          code: RemoteToyDeviceException.codeCommandFeatureIndexError,
          message: RemoteToyDeviceException.getFeatureIndexErrorMessage(
            count: featureCount,
            index: featureIndex,
          ),
          details: message.toJson(),
        );
      }
      final FeatureType featureType = features[featureIndex].featureType;
      if (OutputType.tryFrom(value: featureType) != command.outputType) {
        throw RemoteToyDeviceException(
          code: RemoteToyDeviceException.codeCommandFeatureTypeMismatch,
          message: RemoteToyDeviceException.getFeatureMismatchErrorMessage(
            index: featureIndex,
            actualType: featureType,
            expectType: command.outputType,
          ),
          details: message.toJson(),
        );
      }
    }

    // Convert command message into actuator values: (OutputType, value)
    final List<(OutputType, int)?> commands =
        _actuatorCommandManager.updateScalar(
      msg: message,
      matchAll: _protocolHandler.needsFullCommandSet,
    );

    if (commands.isEmpty || commands.whereType<(OutputType, int)>().isEmpty) {
      logger.d(
          'No commands generated for incoming device packet, skipping and returning success.');
      return const RemoteToyServerMessage.empty();
    }
    return _handleHardwareCommands(
      commands: _protocolHandler.handleScalarCmd(cmds: commands),
    );
  }

  Future<RemoteToyServerMessage> _handleRotateCmd({
    required RotateCmdClientMessage message,
  }) async {
    // Convert command message into rotation values: (speed, clockwise)
    final List<(int, bool)?> commands = _actuatorCommandManager.updateRotation(
      msg: message,
      matchAll: _protocolHandler.needsFullCommandSet,
    );
    return _handleHardwareCommands(
        commands: _protocolHandler.handleRotateCmd(cmds: commands));
  }

  void _checkSensorCommand({
    required int featureIndex,
    required InputType inputType,
  }) {
    final List<DeviceFeature> features = _protocolAttributes.features ?? [];
    final int featureCount = features.length;
    if (featureIndex > featureCount) {
      throw RemoteToyDeviceException(
        code: RemoteToyDeviceException.codeCommandFeatureIndexError,
        message: RemoteToyDeviceException.getFeatureIndexErrorMessage(
          count: featureCount,
          index: featureIndex,
        ),
        details: {
          'inputType': inputType,
        },
      );
    }
    final FeatureType featureType = features[featureIndex].featureType;
    if (featureType != FeatureType.fromInputType(inputType)) {
      throw RemoteToyDeviceException(
        code: RemoteToyDeviceException.getFeatureMismatchErrorMessage(
          index: featureIndex,
          actualType: featureType,
          expectType: inputType,
        ),
      );
    }
  }

  Future<RemoteToyServerMessage> _handleSensorReadCmd({
    required SensorReadCmdClientMessage message,
  }) async {
    _checkSensorCommand(
      featureIndex: message.featureIndex,
      inputType: message.inputType,
    );
    return _protocolHandler.handleSensorReadCmd(
      hardware: _hardware,
      message: message,
    );
  }

  Future<RemoteToyServerMessage> _handleSensorSubscribeCmd({
    required SensorSubscribeCmdClientMessage message,
  }) async {
    _checkSensorCommand(
      featureIndex: message.featureIndex,
      inputType: message.inputType,
    );
    await _protocolHandler.handleSensorSubscribeCmd(
      hardware: _hardware,
      message: message,
    );
    return const RemoteToyServerMessage.empty();
  }

  Future<RemoteToyServerMessage> _handleSensorUnsubscribeCmd({
    required SensorUnsubscribeCmdClientMessage message,
  }) async {
    _checkSensorCommand(
      featureIndex: message.featureIndex,
      inputType: message.inputType,
    );
    await _protocolHandler.handleSensorUnsubscribeCmd(
      hardware: _hardware,
      message: message,
    );
    return const RemoteToyServerMessage.empty();
  }

  Future<RemoteToyServerMessage> _handleHardwareCommands({
    required List<HardwareCmd> commands,
  }) async {
    for (final HardwareCmd command in commands) {
      switch (command) {
        case HardwareReadCmd():
          break;
        case HardwareWriteCmd():
          await _hardware.writeValue(cmd: command);
          break;
        case HardwareSubscribeCmd():
          await _hardware.subscribe(cmd: command);
          break;
        case HardwareUnsubscribeCmd():
          await _hardware.unsubscribe(cmd: command);
          break;
      }
    }
    return const RemoteToyServerMessage.empty();
  }

  Future<RemoteToyServerMessage> _handleOutputCmd({
    required OutputCmdClientMessage message,
  }) async {
    final OutputCmd outputCmd = message.command;

    // Convert to CheckedOutputCmd
    final checkedCommand = CheckedOutputCmd.tryFromDeviceAttributes(
      outputCmd,
      _protocolAttributes,
    );

    // Execute command
    return _handleHardwareCommands(
        commands: _protocolHandler.handleOutputCmd(command: checkedCommand));
  }

  Future<RemoteToyServerMessage> _handleInputCmd({
    required InputCmdClientMessage message,
  }) async {
    final inputCmd = message.command;

    // Convert to CheckedInputCmd
    final checkedCommand = CheckedInputCmd.tryFromDeviceAttributes(
      inputCmd,
      _protocolAttributes,
    );

    // Execute command
    return _protocolHandler.handleInputCmd(
        hardware: _hardware, command: checkedCommand);
  }
}
