/// Manages actuator state and generates stop commands for all supported outputs.
library core.protocol.actuator_command_manager;

import '../../configuration/configuration.dart';
import '../message/message.dart';

/// Converts actuator command messages into protocol-level values.
class ActuatorCommandManager {
  /// Creates the manager from device [features], building stop commands
  /// for all supported outputs.
  factory ActuatorCommandManager({required List<DeviceFeature> features}) {
    final List<RemoteToyClientMessage> stopCommands = [];

    for (final (index, feature) in features.indexed) {
      final output = feature.output;
      final outputType = OutputType.tryFrom(value: feature.featureType);
      if (output != null && outputType != null) {
        for (final type in output.outputTypes) {
          final command = _createStopCommand(type);
          if (command != null) {
            final outputCmd =
                OutputCmdV4(featureIndex: index, command: command);
            stopCommands.add(OutputCmdClientMessage(command: outputCmd));
          }
        }
      }
    }

    return ActuatorCommandManager._(stopCommands: stopCommands);
  }

  const ActuatorCommandManager._({required this.stopCommands});

  /// Pre-built stop commands (value=0) for all actuator features.
  final List<RemoteToyClientMessage> stopCommands;

  /// Creates a stop command (value: 0) for the given output type.
  static OutputCommand? _createStopCommand(OutputType outputType) {
    return switch (outputType) {
      OutputType.rotate =>
        const OutputCommand.rotate(outputValue: OutputValue(value: 0)),
      OutputType.vibrate =>
        const OutputCommand.vibrate(outputValue: OutputValue(value: 0)),
      OutputType.oscillate =>
        const OutputCommand.oscillate(outputValue: OutputValue(value: 0)),
      OutputType.constrict =>
        const OutputCommand.constrict(outputValue: OutputValue(value: 0)),
      OutputType.temperature =>
        const OutputCommand.temperature(outputValue: OutputValue(value: 0)),
      OutputType.led =>
        const OutputCommand.led(outputValue: OutputValue(value: 0)),
      OutputType.position =>
        const OutputCommand.position(outputValue: OutputValue(value: 0)),
      OutputType.positionWithDuration =>
        const OutputCommand.positionWithDuration(
            outputValue: OutputPositionWithDuration(value: 0, duration: 0)),
      OutputType.spray =>
        const OutputCommand.spray(outputValue: OutputValue(value: 0)),
      OutputType.unknown => null,
    };
  }
}
