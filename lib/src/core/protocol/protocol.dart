/// Core protocol abstraction layer.
///
/// Defines the interfaces ([ProtocolIdentifierFactory], [ProtocolIdentifier],
/// [ProtocolInitializer], [ProtocolHandler]) that vendor-specific
/// implementations (Lovense, MonsterPub, etc.) must provide.
library core.protocol.protocol;

import '../../configuration/configuration.dart';
import '../hardware/hardware.dart';
import '../message/message.dart';
import 'keepalive_strategy.dart';
import 'lovense/lovense.dart';
import 'monsterpub.dart';
import 'svakom/svakom_v5.dart';
import 'svakom/svakom_pulse.dart';
import 'satisfyer.dart';

export 'keepalive_strategy.dart';

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
  Future<ProtocolHandler> initialize({
    required Hardware hardware,
    required ProtocolAttributes protocolAttributes,
  });
}

abstract class ProtocolHandler {
  /// Whether all actuator commands must be sent together, even if only
  /// some values changed (true), or only changed values are needed (false).
  bool get needsFullCommandSet => false;

  /// Whether this handler intercepts all messages directly, bypassing
  /// [RemoteToyDevice]'s default command dispatch.
  bool get hasHandleMessage => false;

  /// Strategy for keeping the BLE connection alive during idle periods.
  ProtocolKeepaliveStrategy get keepaliveStrategy =>
      const ProtocolKeepaliveStrategyNone();

  /// Returns hardware commands that should be sent periodically to keep the
  /// device connection alive. Only meaningful when [keepaliveStrategy] is not
  /// [ProtocolKeepaliveStrategyNone].
  List<HardwareCmd> buildKeepalive() => const [];

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

  /// Returns the hardware commands to execute the output command.
  ///
  /// - [command] The checked output command [CheckedOutputCmd] to execute.
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

  List<HardwareCmd> handleOutputVibrateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) =>
      _commandUnimplemented(command: 'OutputCmd (Vibrate Actuator)');

  List<HardwareCmd> handleOutputRotateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) =>
      _commandUnimplemented(command: 'OutputCmd (Rotate Actuator)');

  List<HardwareCmd> handleOutputOscillateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) =>
      _commandUnimplemented(command: 'OutputCmd (Oscillate Actuator)');

  List<HardwareCmd> handleOutputSprayCmd({
    required int featureIndex,
    required String featureId,
    required int level,
  }) =>
      _commandUnimplemented(command: 'OutputCmd (Spray Actuator)');

  List<HardwareCmd> handleOutputConstrictCmd({
    required int featureIndex,
    required String featureId,
    required int level,
  }) =>
      _commandUnimplemented(command: 'OutputCmd (Constrict Actuator)');

  List<HardwareCmd> handleOutputTemperatureCmd({
    required int featureIndex,
    required String featureId,
    required int level,
  }) =>
      _commandUnimplemented(command: 'OutputCmd (Temperature Actuator)');

  List<HardwareCmd> handleOutputLedCmd({
    required int featureIndex,
    required String featureId,
    required int level,
  }) =>
      _commandUnimplemented(command: 'OutputCmd (Led Actuator)');

  List<HardwareCmd> handleOutputPositionCmd({
    required int featureIndex,
    required String featureId,
    required int position,
  }) =>
      _commandUnimplemented(command: 'OutputCmd (Position Actuator)');

  List<HardwareCmd> handleOutputPositionWithDurationCmd({
    required int featureIndex,
    required String featureId,
    required int position,
    required int duration,
  }) =>
      _commandUnimplemented(
          command: 'OutputCmd (Position w/ Duration Actuator)');

  /// Returns the server message for the input response.
  ///
  /// - [hardware] The hardware to execute the command on.
  /// - [command] The checked input command [CheckedInputCmd] to execute.
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

  Future<RemoteToyServerMessage> handleInputSubscribeCmd({
    required int featureIndex,
    required String featureId,
    required InputType inputType,
    required Hardware hardware,
  }) async =>
      throw UnimplementedError('Subscribe not supported');

  Future<RemoteToyServerMessage> handleInputUnsubscribeCmd({
    required int featureIndex,
    required String featureId,
    required InputType inputType,
    required Hardware hardware,
  }) async =>
      throw UnimplementedError('Unsubscribe not supported');

  Future<RemoteToyServerMessage> handleInputBatteryLevelCmd({
    required int featureIndex,
    required String featureId,
    required InputType inputType,
    required Hardware hardware,
  }) async =>
      throw UnimplementedError('Battery level not supported');

  Future<RemoteToyServerMessage> handleInputRssiCmd({
    required int featureIndex,
    required String featureId,
    required InputType inputType,
    required Hardware hardware,
  }) async =>
      throw UnimplementedError('Rssi not supported');

  Future<RemoteToyServerMessage> handleInputButtonCmd({
    required int featureIndex,
    required String featureId,
    required InputType inputType,
    required Hardware hardware,
  }) async =>
      throw UnimplementedError('Button not supported');

  Future<RemoteToyServerMessage> handleInputPressureCmd({
    required int featureIndex,
    required String featureId,
    required InputType inputType,
    required Hardware hardware,
  }) async =>
      throw UnimplementedError('Pressure not supported');

  /// Handles sensor subscribe command (kept for backward compatibility).
  Future<void> handleSensorSubscribeCmd({
    required Hardware hardware,
    required SensorSubscribeCmdClientMessage message,
  }) =>
      throw UnimplementedError();

  /// Handles sensor unsubscribe command (kept for backward compatibility).
  Future<void> handleSensorUnsubscribeCmd({
    required Hardware hardware,
    required SensorUnsubscribeCmdClientMessage message,
  }) =>
      throw UnimplementedError();
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
  addProtocol(SatisfyerIdentifierFactory()); // Satisfyer

  return map;
}
