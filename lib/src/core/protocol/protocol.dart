/// Core protocol abstraction layer.
///
/// Defines the interfaces ([ProtocolIdentifierFactory], [ProtocolIdentifier],
/// [ProtocolInitializer], [ProtocolHandler]) that vendor-specific
/// implementations (Lovense, MonsterPub, etc.) must provide.
library core.protocol.protocol;

import 'dart:typed_data';

import '../../configuration/configuration.dart';
import '../../remote_toy_device.dart';
import '../../util/logger.dart';
import '../hardware/hardware.dart';
import '../message/message.dart';
import 'lovense/lovense.dart';
import 'monsterpub.dart';
import 'svakom_v5.dart';
import 'svakom_pulse.dart';

abstract interface class ProtocolIdentifierFactory {
  /// The identifier of the protocol.
  String identifier();

  /// Create a new instance of the protocol.
  ProtocolIdentifier create();
}

/// Device identifier for a specific protocol.
abstract interface class ProtocolIdentifier {
  /// Identifies the device model.
  ///
  /// Returns the protocol name, an optional model identifier, and a
  /// [ProtocolInitializer] that can create the corresponding [ProtocolHandler].
  Future<
      ({
        ProtocolName protocolName,
        String? modelIdentifier,
        ProtocolInitializer initializer,
      })> identify({
    required Hardware hardware,
  });
}

/// Initializer that creates a [ProtocolHandler].
abstract interface class ProtocolInitializer {
  /// Creates a [ProtocolHandler]. [hardware] is passed because some
  /// handlers need direct device communication; [protocolAttributes]
  /// contains the device's feature definitions.
  ProtocolHandler initialize({
    required Hardware hardware,
    required ProtocolAttributes protocolAttributes,
    required bool isSpecV4,
  });
}

abstract class ProtocolHandler {
  /// Whether all actuator commands must be sent together, even if only
  /// some values changed (true), or only changed values are needed (false).
  bool get needsFullCommandSet => false;

  /// Whether this handler intercepts all messages directly, bypassing
  /// [RemoteToyDevice]'s default command dispatch.
  bool get hasHandleMessage => false;

  /// Event stream from remote toy device.
  Stream<RemoteToyServerMessage> get events$;

  List<HardwareCmd> handleMessage({
    required RemoteToyClientMessage message,
  }) =>
      throw UnimplementedError(
          'Command not implmented for this protocol: ${message.runtimeType}');

  List<HardwareCmd> _commandUnimplemented({required String command}) =>
      throw UnimplementedError(
          'Command not implemented for this protocol: $command');

  List<HardwareCmd> handleScalarCmd({
    required List<(OutputType, int)?> cmds,
  }) {
    final List<HardwareCmd> hardwareCmds = [];
    for (final (index, cmd) in cmds.indexed) {
      if (cmd == null) continue;
      final (output, scalar) = cmd;
      hardwareCmds.addAll(switch (output) {
        OutputType.constrict =>
          handleScalarConstrictCmd(index: index, scalar: scalar),
        OutputType.oscillate =>
          handleScalarOscillateCmd(index: index, scalar: scalar),
        OutputType.rotate =>
          handleScalarRotateCmd(index: index, scalar: scalar),
        OutputType.vibrate =>
          handleScalarVibrateCmd(index: index, scalar: scalar),
        OutputType.position =>
          handleScalarPositionCmd(index: index, scalar: scalar),
        OutputType.unknown => throw UnimplementedError(
            'Unknown actuator types are not controllable.'),
        _ => throw UnsupportedError(
            'Unsupported output type: $output for scalar cmd'),
      });
    }
    return hardwareCmds;
  }

  List<HardwareCmd> handleScalarVibrateCmd({
    required int index,
    required int scalar,
  }) =>
      _commandUnimplemented(command: 'ScalarCmd (Vibrate Actuator)');

  List<HardwareCmd> handleScalarRotateCmd({
    required int index,
    required int scalar,
  }) =>
      _commandUnimplemented(command: 'ScalarCmd (Rotate Actuator)');

  List<HardwareCmd> handleScalarOscillateCmd({
    required int index,
    required int scalar,
  }) =>
      _commandUnimplemented(command: 'ScalarCmd (Oscillate Actuator)');

  List<HardwareCmd> handleScalarConstrictCmd({
    required int index,
    required int scalar,
  }) =>
      _commandUnimplemented(command: 'ScalarCmd (Constrict Actuator)');

  List<HardwareCmd> handleScalarPositionCmd({
    required int index,
    required int scalar,
  }) =>
      _commandUnimplemented(command: 'ScalarCmd (Position Actuator)');

  List<HardwareCmd> handleRotateCmd({
    required List<(int, bool)?> cmds,
  }) =>
      _commandUnimplemented(command: 'RotateCmd');

  List<HardwareCmd> handleLinearCmd({
    required LinearCmdClientMessage message,
  }) =>
      _commandUnimplemented(command: message.runtimeType.toString());

  Future<void> handleSensorSubscribeCmd({
    required Hardware hardware,
    required SensorSubscribeCmdClientMessage message,
  }) =>
      throw UnimplementedError();

  Future<void> handleSensorUnsubscribeCmd({
    required Hardware hardware,
    required SensorUnsubscribeCmdClientMessage message,
  }) =>
      throw UnimplementedError();

  Future<RemoteToyServerMessage> handleSensorReadCmd({
    required Hardware hardware,
    required SensorReadCmdClientMessage message,
  }) {
    switch (message.inputType) {
      case InputType.battery:
        return handleBatteryLevelCmd(hardware: hardware, message: message);
      default:
        throw UnimplementedError(
            'Sensor type not implemented: ${message.inputType}');
    }
  }

  Future<RemoteToyServerMessage> handleBatteryLevelCmd({
    required Hardware hardware,
    required SensorReadCmdClientMessage message,
  }) async {
    if (hardware.endpoints.contains(Endpoint.rxBleBattery)) {
      const cmd = HardwareReadCmd(endpoint: Endpoint.rxBleBattery);
      final (:data, :endpoint) = await hardware.readValue(cmd: cmd);
      final int batteryLevel = data[0].toSigned(8);
      final batteryReading = RemoteToyServerReadingMessage(
        featureIndex: message.featureIndex,
        inputType: message.inputType,
        data: Uint8List.fromList([batteryLevel]),
      );
      logger.d('Got battery reading: $batteryLevel');
      return batteryReading;
    } else {
      throw UnimplementedError('Battery level not supported');
    }
  }

  /// Returns the hardware commands to execute the output command.
  /// Buttplug Spec: 4.0
  ///
  /// - [command] The checked output command [CheckedOutputCmdV4] to execute.
  ///
  /// - Returns the hardware commands to execute the output command.
  List<HardwareCmd> handleOutputCmd({
    required CheckedOutputCmd command,
  }) {
    switch (command.command) {
      case OutputCommandVibrate():
        return handleOutputVibrateCmd(
            featureIndex: command.featureIndex,
            featureId: command.featureId,
            speed: command.command.value);
      case OutputCommandRotate():
        return handleOutputRotateCmd(
            featureIndex: command.featureIndex,
            featureId: command.featureId,
            speed: command.command.value);
      case OutputCommandOscillate():
        return handleOutputOscillateCmd(
            featureIndex: command.featureIndex,
            featureId: command.featureId,
            speed: command.command.value);
      case OutputCommandSpray():
        return handleOutputSprayCmd(
            featureIndex: command.featureIndex,
            featureId: command.featureId,
            level: command.command.value);
      case OutputCommandConstrict():
        return handleOutputConstrictCmd(
            featureIndex: command.featureIndex,
            featureId: command.featureId,
            level: command.command.value);
      case OutputCommandTemperature():
        return handleOutputTemperatureCmd(
            featureIndex: command.featureIndex,
            featureId: command.featureId,
            level: command.command.value);
      case OutputCommandLed():
        return handleOutputLedCmd(
            featureIndex: command.featureIndex,
            featureId: command.featureId,
            level: command.command.value);
      case OutputCommandPosition():
        return handleOutputPositionCmd(
            featureIndex: command.featureIndex,
            featureId: command.featureId,
            position: command.command.value);
      case OutputCommandPositionWithDuration():
        final outputValue =
            command.command.outputValue as OutputPositionWithDuration;
        return handleOutputPositionWithDurationCmd(
            featureIndex: command.featureIndex,
            featureId: command.featureId,
            position: command.command.value,
            duration: outputValue.duration);
    }
  }

  /// Returns the hardware commands to execute the vibrate command.
  ///
  /// - [featureIndex] The index of the feature to execute the command on.
  /// - [featureId] The id of the feature to execute the command on.
  /// - [speed] The speed of the vibrate command.
  ///
  /// - Returns the hardware commands to execute the vibrate command.
  List<HardwareCmd> handleOutputVibrateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) =>
      _commandUnimplemented(command: 'OutputCmd (Vibrate Actuator)');

  /// Returns the hardware commands to execute the rotate command.
  ///
  /// - [featureIndex] The index of the feature to execute the command on.
  /// - [featureId] The id of the feature to execute the command on.
  /// - [speed] The speed of the rotate command.
  ///
  /// - Returns the hardware commands to execute the rotate command.
  List<HardwareCmd> handleOutputRotateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) =>
      _commandUnimplemented(command: 'OutputCmd (Rotate Actuator)');

  /// Returns the hardware commands to execute the oscillate command.
  ///
  /// - [featureIndex] The index of the feature to execute the command on.
  /// - [featureId] The id of the feature to execute the command on.
  /// - [speed] The speed of the oscillate command.
  ///
  /// - Returns the hardware commands to execute the oscillate command.
  List<HardwareCmd> handleOutputOscillateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) =>
      _commandUnimplemented(command: 'OutputCmd (Oscillate Actuator)');

  /// Returns the hardware commands to execute the spray command.
  ///
  /// - [featureIndex] The index of the feature to execute the command on.
  /// - [featureId] The id of the feature to execute the command on.
  /// - [level] The level of the spray command.
  ///
  /// - Returns the hardware commands to execute the spray command.
  List<HardwareCmd> handleOutputSprayCmd({
    required int featureIndex,
    required String featureId,
    required int level,
  }) =>
      _commandUnimplemented(command: 'OutputCmd (Spray Actuator)');

  /// Returns the hardware commands to execute the constrict command.
  ///
  /// - [featureIndex] The index of the feature to execute the command on.
  /// - [featureId] The id of the feature to execute the command on.
  /// - [level] The level of the constrict command.
  ///
  /// - Returns the hardware commands to execute the constrict command.
  List<HardwareCmd> handleOutputConstrictCmd({
    required int featureIndex,
    required String featureId,
    required int level,
  }) =>
      _commandUnimplemented(command: 'OutputCmd (Constrict Actuator)');

  /// Returns the hardware commands to execute the temperature command.
  ///
  /// - [featureIndex] The index of the feature to execute the command on.
  /// - [featureId] The id of the feature to execute the command on.
  /// - [level] The level of the temperature command.
  ///
  /// - Returns the hardware commands to execute the temperature command.
  List<HardwareCmd> handleOutputTemperatureCmd({
    required int featureIndex,
    required String featureId,
    required int level,
  }) =>
      _commandUnimplemented(command: 'OutputCmd (Temperature Actuator)');

  /// Returns the hardware commands to execute the led command.
  ///
  /// - [featureIndex] The index of the feature to execute the command on.
  /// - [featureId] The id of the feature to execute the command on.
  /// - [level] The level of the led command.
  ///
  /// - Returns the hardware commands to execute the led command.
  List<HardwareCmd> handleOutputLedCmd({
    required int featureIndex,
    required String featureId,
    required int level,
  }) =>
      _commandUnimplemented(command: 'OutputCmd (Led Actuator)');

  /// Returns the hardware commands to execute the position command.
  ///
  /// - [featureIndex] The index of the feature to execute the command on.
  /// - [featureId] The id of the feature to execute the command on.
  /// - [position] The position of the position command.
  ///
  /// - Returns the hardware commands to execute the position command.
  List<HardwareCmd> handleOutputPositionCmd({
    required int featureIndex,
    required String featureId,
    required int position,
  }) =>
      _commandUnimplemented(command: 'OutputCmd (Position Actuator)');

  /// Returns the hardware commands to execute the position with duration command.
  ///
  /// - [featureIndex] The index of the feature to execute the command on.
  /// - [featureId] The id of the feature to execute the command on.
  /// - [position] The position of the position command.
  /// - [duration] The duration of the position command.
  ///
  /// - Returns the hardware commands to execute the position with duration command.
  List<HardwareCmd> handleOutputPositionWithDurationCmd({
    required int featureIndex,
    required String featureId,
    required int position,
    required int duration,
  }) =>
      _commandUnimplemented(
          command: 'OutputCmd (Position w/ Duration Actuator)');

  /// Returns the server message for the input response.
  /// Buttplug Spec: 4.0
  ///
  /// - [hardware] The hardware to execute the command on.
  /// - [command] The checked input command [CheckedInputCmdV4] to execute.
  ///
  /// - Returns the server message for the input response.
  Future<RemoteToyServerMessage> handleInputCmd({
    required Hardware hardware,
    required CheckedInputCmd command,
  }) {
    switch (command.inputCommandType) {
      case InputCommandType.read:
        return handleInputReadCmd(
            featureIndex: command.featureIndex,
            featureId: command.featureId,
            inputType: command.inputType,
            hardware: hardware);
      case InputCommandType.subscribe:
        return handleInputSubscribeCmd(
            featureIndex: command.featureIndex,
            featureId: command.featureId,
            inputType: command.inputType,
            hardware: hardware);
      case InputCommandType.unsubscribe:
        return handleInputUnsubscribeCmd(
            featureIndex: command.featureIndex,
            featureId: command.featureId,
            inputType: command.inputType,
            hardware: hardware);
    }
  }

  /// Returns the server message for the input read response.
  ///
  /// - [featureIndex] The index of the feature to read.
  /// - [featureId] The id of the feature to read.
  /// - [inputType] The type of the input to read.
  /// - [hardware] The hardware to read the input from.
  ///
  /// - Returns the server message for the input read response.
  ///
  /// - Throws [UnimplementedError] if the input type is not supported.
  Future<RemoteToyServerMessage> handleInputReadCmd({
    required int featureIndex,
    required String featureId,
    required InputType inputType,
    required Hardware hardware,
  }) async {
    switch (inputType) {
      case InputType.battery:
        return handleInputBatteryLevelCmd(
            featureIndex: featureIndex,
            featureId: featureId,
            inputType: inputType,
            hardware: hardware);
      case InputType.rssi:
        return handleInputRssiCmd(
            featureIndex: featureIndex,
            featureId: featureId,
            inputType: inputType,
            hardware: hardware);
      case InputType.button:
        return handleInputButtonCmd(
            featureIndex: featureIndex,
            featureId: featureId,
            inputType: inputType,
            hardware: hardware);
      case InputType.pressure:
        return handleInputPressureCmd(
            featureIndex: featureIndex,
            featureId: featureId,
            inputType: inputType,
            hardware: hardware);
      default:
        throw UnimplementedError('Input type not implemented: $inputType');
    }
  }

  /// Returns the server message for the input subscribe response.
  ///
  /// - [featureIndex] The index of the feature to subscribe.
  /// - [featureId] The id of the feature to subscribe.
  /// - [inputType] The type of the input to subscribe.
  /// - [hardware] The hardware to subscribe to the input.
  ///
  /// - Returns the server message for the input subscribe response.
  ///
  /// - Throws [UnimplementedError] if the input type is not supported.
  Future<RemoteToyServerMessage> handleInputSubscribeCmd({
    required int featureIndex,
    required String featureId,
    required InputType inputType,
    required Hardware hardware,
  }) async =>
      throw UnimplementedError('Subscribe not supported');

  /// Returns the server message for the input unsubscribe response.
  ///
  /// - [featureIndex] The index of the feature to unsubscribe.
  /// - [featureId] The id of the feature to unsubscribe.
  /// - [inputType] The type of the input to unsubscribe.
  /// - [hardware] The hardware to unsubscribe from the input.
  ///
  /// - Returns the server message for the input unsubscribe response.
  ///
  /// - Throws [UnimplementedError] if the input type is not supported.
  Future<RemoteToyServerMessage> handleInputUnsubscribeCmd({
    required int featureIndex,
    required String featureId,
    required InputType inputType,
    required Hardware hardware,
  }) async =>
      throw UnimplementedError('Unsubscribe not supported');

  /// Returns the server message for the input battery level response.
  ///
  /// - [featureIndex] The index of the feature to get the battery level.
  /// - [featureId] The id of the feature to get the battery level.
  /// - [inputType] The type of the input to get the battery level.
  /// - [hardware] The hardware to get the battery level from.
  ///
  /// - Returns the server message for the input battery level response.
  ///
  /// - Throws [UnimplementedError] if the input type is not supported.
  Future<RemoteToyServerMessage> handleInputBatteryLevelCmd({
    required int featureIndex,
    required String featureId,
    required InputType inputType,
    required Hardware hardware,
  }) async =>
      throw UnimplementedError('Battery level not supported');

  /// Returns the server message for the input rssi response.
  ///
  /// - [featureIndex] The index of the feature to get the rssi.
  /// - [featureId] The id of the feature to get the rssi.
  /// - [inputType] The type of the input to get the rssi.
  /// - [hardware] The hardware to get the rssi from.
  ///
  /// - Returns the server message for the input rssi response.
  ///
  /// - Throws [UnimplementedError] if the input type is not supported.
  Future<RemoteToyServerMessage> handleInputRssiCmd({
    required int featureIndex,
    required String featureId,
    required InputType inputType,
    required Hardware hardware,
  }) async =>
      throw UnimplementedError('Rssi not supported');

  /// Returns the server message for the input button response.
  ///
  /// - [featureIndex] The index of the feature to get the button.
  /// - [featureId] The id of the feature to get the button.
  /// - [inputType] The type of the input to get the button.
  /// - [hardware] The hardware to get the button from.
  ///
  /// - Returns the server message for the input button response.
  ///
  /// - Throws [UnimplementedError] if the input type is not supported.
  Future<RemoteToyServerMessage> handleInputButtonCmd({
    required int featureIndex,
    required String featureId,
    required InputType inputType,
    required Hardware hardware,
  }) async =>
      throw UnimplementedError('Button not supported');

  /// Returns the server message for the input pressure response.
  ///
  /// - [featureIndex] The index of the feature to get the pressure.
  /// - [featureId] The id of the feature to get the pressure.
  /// - [inputType] The type of the input to get the pressure.
  /// - [hardware] The hardware to get the pressure from.
  ///
  /// - Returns the server message for the input pressure response.
  ///
  /// - Throws [UnimplementedError] if the input type is not supported.
  Future<RemoteToyServerMessage> handleInputPressureCmd({
    required int featureIndex,
    required String featureId,
    required InputType inputType,
    required Hardware hardware,
  }) async =>
      throw UnimplementedError('Pressure not supported');
}

Map<String, ProtocolIdentifierFactory> loadProtocolIdentifierFactories() {
  Map<String, ProtocolIdentifierFactory> map = {};

  void addProtocol(ProtocolIdentifierFactory factory) {
    map[factory.identifier()] = factory;
  }

  addProtocol(LovenseIdentifierFactory()); // Lovense
  addProtocol(MonsterPubIdentifierFactory()); // MonsterPub
  addProtocol(LovenseIdentifierFactory()); // Lovense
  addProtocol(SvakomV5IdentifierFactory()); // Svakom V5
  addProtocol(SvakomPulseIdentifierFactory()); // Svakom Pulse

  return map;
}
