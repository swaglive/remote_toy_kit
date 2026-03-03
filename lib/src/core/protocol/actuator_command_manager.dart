/// Manages actuator state and converts high-level commands into
/// protocol-level values.
///
/// Tracks the current value of each feature to detect changes and
/// generates stop commands for all supported outputs.
library core.protocol.actuator_command_manager;

import 'package:collection/collection.dart';

import '../../configuration/configuration.dart';
import '../message/message.dart';
import '../../util/logger.dart';

typedef FeatureStatusValue = (int, bool);
typedef FeatureStatusCurrent = (OutputType, FeatureStatusValue);
typedef FeatureStatusUpdatedValue = (double, bool);
typedef FeatureStatusResult = (int, OutputType, FeatureStatusValue);

/// Caches the current value of a feature so changes can be detected.
class FeatureStatus {
  /// Creates a feature status instance.
  FeatureStatus({
    required this.outputType,
    this.actuator,
    this.output,
    this.sent = false,
    this.value = (0, false),
  });

  final OutputType outputType;

  @Deprecated('Will be deprecated after spec 4.0 is fully released')
  final DeviceFeatureActuator? actuator;

  final DeviceFeatureOutput? output;
  bool sent;
  FeatureStatusValue value;
  FeatureStatusCurrent get current => (outputType, value);

  // Only used for spec 3.0
  @Deprecated('Will be deprecated after spec 4.0 is released')
  Set<ActuatorFeatureMessageType> get messages => actuator?.messages ?? {};

  /// Converts to the actual step value and updates the cached value.
  /// Returns null if the value hasn't changed.
  @Deprecated('Will be deprecated after spec 4.0 is released')
  FeatureStatusValue? update({required FeatureStatusUpdatedValue value}) {
    // Ensure the actuator is not null, only spec 3.0 uses it
    if (this.actuator == null) {
      return null;
    }

    (int, bool)? result;
    final actuator = this.actuator!;
    final int rangeStart = actuator.stepRange.start;
    final int range = actuator.stepRange.end - rangeStart;
    final double scalarModifier = value.$1 * range;
    final scalar = scalarModifier < 0.0001
        ? 0
        :
        // When calculating speeds, round up. This follows how we calculated
        // things in buttplug-js and buttplug-csharp, so it's more for history
        // than anything, but it's what users will expect.
        (scalarModifier + rangeStart).ceil();
    logger.d(
        'FeatureStatus.update ${actuator.stepRange}, $range, $scalarModifier, $scalar');
    // If we've already sent commands, we don't want to send them again,
    // because some of our communication busses are REALLY slow. Make sure
    // these values get null in our return List.
    final int current = this.value.$1;
    final bool clockwise = this.value.$2;
    final bool sent = this.sent;
    if (!sent || scalar != current || clockwise != value.$2) {
      // Value changed or has never been sent
      this.value = (scalar, value.$2);
      if (!sent) {
        this.sent = true;
      }
      result = (scalar, value.$2);
    }
    return result;
  }
}

/// Converts actuator command messages to actual device values.
class ActuatorCommandManager {
  /// Creates the manager from device [features], initializing per-feature
  /// state tracking and building stop commands for all supported outputs.
  factory ActuatorCommandManager({required List<DeviceFeature> features}) {
    final List<RemoteToyClientMessage> stopCommands = [];

    final List<FeatureStatus> statuses = [];
    final List<ScalarSubcommand> scalarSubcommands = [];
    final List<RotationSubcommand> rotateSubcommands = [];

    for (final (index, feature) in features.indexed) {
      final outputType = OutputType.tryFrom(value: feature.featureType);

      if (feature is DeviceFeatureV4) {
        final output = feature.output;
        if (output != null && outputType != null) {
          statuses.add(FeatureStatus(outputType: outputType, output: output));
          // Add stop commands for all supported output types
          for (final type in output.outputTypes) {
            final command = _createStopCommand(type);
            if (command != null) {
              final outputCmd =
                  OutputCmdV4(featureIndex: index, command: command);
              stopCommands.add(OutputCmdClientMessage(command: outputCmd));
            }
          }
        }
      } else if (feature is DeviceFeatureV3) {
        // Initialize FeatureStatus for each V3 actuator feature
        final actuator = feature.actuator;
        if (actuator != null && outputType != null) {
          statuses
              .add(FeatureStatus(outputType: outputType, actuator: actuator));
          if (actuator.messages
              .contains(ActuatorFeatureMessageType.rotateCmd)) {
            rotateSubcommands.add(RotationSubcommand(
                featureIndex: index, speed: 0.0, clockwise: false));
          } else if (actuator.messages
              .contains(ActuatorFeatureMessageType.scalarCmd)) {
            scalarSubcommands.add(ScalarSubcommand(
                featureIndex: index, scalar: 0.0, outputType: outputType));
          }
        }

        // Add stop commands for this V3 actuator's supported message types
        if (scalarSubcommands.isNotEmpty) {
          stopCommands.add(ScalarCmdClientMessage(scalars: scalarSubcommands));
        }
        if (rotateSubcommands.isNotEmpty) {
          stopCommands
              .add(RotateCmdClientMessage(rotations: rotateSubcommands));
        }
      }
    }
    // Collect stop commands outside the loop for V4 features
    if (scalarSubcommands.isNotEmpty) {
      stopCommands.add(ScalarCmdClientMessage(scalars: scalarSubcommands));
    }
    if (rotateSubcommands.isNotEmpty) {
      stopCommands.add(RotateCmdClientMessage(rotations: rotateSubcommands));
    }
    return ActuatorCommandManager._(
      featureStatus: statuses,
      stopCommands: stopCommands,
    );
  }

  const ActuatorCommandManager._({
    required this.featureStatus,
    required this.stopCommands,
  });

  /// Cached status for all actuator features, ordered by feature index.
  final List<FeatureStatus> featureStatus;

  /// Pre-built stop commands (value=0) for all actuator features.
  final List<RemoteToyClientMessage> stopCommands;

  /// Updates cached state and returns changed (or all, if [matchAll]) values.
  ///
  /// [msgType] is the command category (scalar or rotate).
  /// [commands] are the values to update.
  /// When [matchAll] is true, the result includes every feature's current
  /// value, not only those that changed.
  List<(int, OutputType, FeatureStatusValue)> update({
    required ActuatorFeatureMessageType msgType,
    required List<(int, OutputType, FeatureStatusUpdatedValue)> commands,
    required bool matchAll,
  }) {
    // Convert from the generic 0.0-1.0 Ｆrange to the StepCount attribute given by the device config.

    // If we've already sent commands before, we should check against our old values. Otherwise, we
    // should always send whatever command we're going to send.
    final List<FeatureStatusResult> result = [];

    for (final command in commands) {
      if (command.$1 >= featureStatus.length) {
        throw Exception(
            'Command requests feature index ${command.$1}, which does not exist.');
      }
    }

    for (final (index, cmd) in featureStatus.indexed) {
      final command = commands.firstWhereOrNull((e) => e.$1 == index);
      if (command != null) {
        final (_, cmdActuator, cmdValue) = command;
        // By this point, we should have already checked whether the feature takes the message type.
        final updatedValue = featureStatus[index].update(value: cmdValue);
        if (updatedValue != null) {
          result.add((index, cmdActuator, updatedValue));
        } else if (matchAll) {
          // Include unchanged values when matchAll is requested
          result.add((index, cmd.outputType, cmd.current.$2));
        }
      } else if (matchAll) {
        if (cmd.messages.contains(msgType)) {
          // matchAll: include this feature since it handles the same message type
          result.add((index, cmd.outputType, cmd.current.$2));
        }
      }
    }
    return result;
  }

  /// Converts a ScalarCmd message into actual device step values.
  /// When [matchAll] is true, includes all scalar features in the result.
  @Deprecated('Will be deprecated after spec 4.0 is released')
  List<(OutputType, int)?> updateScalar({
    required ScalarCmdClientMessage msg,
    required bool matchAll,
  }) {
    // First, make sure this is a valid command, that contains at least one
    // subcommand.
    if (msg.scalars.isEmpty) {
      throw Exception('ScalarCmd has 0 commands, will not do anything.');
    }

    // <Feature Index, ScalarCmd Index>
    final Map<int, int> idx = {};
    for (final (i, x) in featureStatus.indexed) {
      if (x.messages.contains(ActuatorFeatureMessageType.scalarCmd)) {
        idx[i] = idx.length;
      }
    }

    final List<(OutputType, int)?> finalResult = List.filled(idx.length, null);

    // (Feature Index, ActuatorType, Value, Not Used)
    final List<(int, OutputType, (double, bool))> commands = [];
    for (final x in msg.scalars) {
      commands.add((x.featureIndex, x.outputType, (x.scalar, false)));
    }
    // Convert to actual device values
    final result = update(
      msgType: ActuatorFeatureMessageType.scalarCmd,
      commands: commands,
      matchAll: matchAll,
    );
    // Sort by feature index and fill result slots accordingly
    result.sortBy<num>((e) => e.$1);
    for (final (index, actuator, value) in result) {
      final finalIndex = idx[index];
      if (finalIndex != null) {
        finalResult[finalIndex] = (actuator, value.$1);
      }
    }
    return finalResult;
  }

  /// Converts a RotateCmd message into actual device step values.
  /// When [matchAll] is true, includes all rotation features in the result.
  @Deprecated('Will be deprecated after spec 4.0 is released')
  List<(int, bool)?> updateRotation({
    required RotateCmdClientMessage msg,
    required bool matchAll,
  }) {
    // First, make sure this is a valid command, that contains at least one
    // command.
    if (msg.rotations.isEmpty) {
      throw Exception('RotateCmd has 0 commands, will not do anything.');
    }

    // Create result list sized to the number of rotation-capable features
    final List<(int, bool)?> finalResult = List.filled(
      featureStatus
          .where(
              (x) => x.messages.contains(ActuatorFeatureMessageType.rotateCmd))
          .length,
      null,
    );

    // (FeatureIndex, ActuatorType, (Speed, Clockwise))
    final List<(int, OutputType, (double, bool))> commands = [];
    for (final x in msg.rotations) {
      commands.add((x.featureIndex, OutputType.rotate, (x.speed, x.clockwise)));
    }
    // Convert to actual device values
    final result = update(
      msgType: ActuatorFeatureMessageType.rotateCmd,
      commands: commands,
      matchAll: matchAll,
    );
    // Sort by feature index and fill result slots accordingly
    result.sortBy<num>((e) => e.$1);
    for (final (arrayIndex, (_, _, value)) in result.indexed) {
      finalResult[arrayIndex] = value;
    }
    return finalResult;
  }

  /// Creates a stop command (value: 0) for the given output type.
  ///
  /// [outputType] is the output type to create a stop command for.
  ///
  /// Returns the stop command for the given output type.
  /// Returns [null] if the output type is not supported.
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
