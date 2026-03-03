/// Device feature model that wraps a single feature's configuration
/// and command conversion logic.
///
/// [RemoteToyDeviceFeature] wraps a [DeviceFeature] config into an operable
/// object, responsible for validating and converting client-side
/// [ClientDeviceOutputCommand]s into protocol-level [OutputCmd]s.
library remote_toy_device_feature;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'configuration/configuration.dart';
import 'core/message/message.dart';

part 'remote_toy_device_feature.freezed.dart';

@Freezed(fromJson: false, toJson: false)
sealed class RemoteToyDeviceFeature with _$RemoteToyDeviceFeature {
  const RemoteToyDeviceFeature._();

  const factory RemoteToyDeviceFeature({
    required int featureIndex,
    required FeatureType featureType,
    required DeviceFeature feature,
  }) = _RemoteToyDeviceFeature;

  /// Creates an instance from a [DeviceFeature] config.
  ///
  /// Prefers the config's own featureIndex if present, otherwise falls back
  /// to the provided [featureIndex].
  static RemoteToyDeviceFeature fromConfig(
    DeviceFeature feature, {
    required int featureIndex,
  }) {
    return _RemoteToyDeviceFeature(
      featureIndex: feature.featureIndex ?? featureIndex,
      featureType: feature.featureType,
      feature: feature,
    );
  }

  // Validates that the step value falls within featureOutput's allowed range;
  // throws if out of bounds.
  int _checkStepValue(
    DeviceFeatureOutputLimits featureOutput,
    ClientDeviceCommandValue steps,
  ) {
    // Convert double values to their corresponding integer step
    final int value = switch (steps) {
      ClientDeviceCommandValueInt(:final value) => value,
      ClientDeviceCommandValueDouble(:final value) =>
        _convertDoubleValue(featureOutput, value),
    };

    if (value >= featureOutput.stepLimit.start &&
        value <= featureOutput.stepLimit.end) {
      return value;
    }

    throw Exception(
      "$value is larger than the maximum number of steps (${featureOutput.stepCount}).",
    );
  }

  // Maps a float in the range -1.0..1.0 to an integer step in 0..stepCount.
  int _convertDoubleValue(
    DeviceFeatureOutputLimits featureOutput,
    double floatAmount,
  ) {
    if (floatAmount < -1.0 || floatAmount > 1.0) {
      throw Exception(
        'Float values must be between 0.0 and 1.0',
      );
    }

    var value = floatAmount * featureOutput.stepCount.toDouble();
    // Ceil small positive values, floor otherwise, to avoid floating-point rounding artifacts
    value = value > 0.000001 ? value.ceilToDouble() : value.floorToDouble();
    return value.toInt();
  }

  /// Converts a [ClientDeviceOutputCommand] into a protocol-level [OutputCmd].
  ///
  /// Only V4 [DeviceFeature]s are supported. Looks up the output limits
  /// for the command's output type and validates the step value range.
  OutputCmd convertClientCmdtoOutputCmd(
      ClientDeviceOutputCommand clientCommand) {
    // Only V4 is supported; V3 is not implemented
    if (feature is DeviceFeatureV3) {
      throw UnsupportedError('DeviceFeatureV3 is not supported');
    }

    final outputType = clientCommand.outputType;
    final output =
        (feature as DeviceFeatureV4).output?.outputLimits(outputType);
    if (output == null) {
      throw UnsupportedError('Output type $outputType is not supported');
    }

    final outputCmd = switch (clientCommand) {
      ClientDeviceOutputVibrateCommand(:final value) => OutputCommand.vibrate(
          outputValue: OutputValue(value: _checkStepValue(output, value))),
      ClientDeviceOutputRotateCommand(:final value) => OutputCommand.rotate(
          outputValue: OutputValue(value: _checkStepValue(output, value))),
      ClientDeviceOutputOscillateCommand(:final value) =>
        OutputCommand.oscillate(
            outputValue: OutputValue(value: _checkStepValue(output, value))),
      ClientDeviceOutputConstrictCommand(:final value) =>
        OutputCommand.constrict(
            outputValue: OutputValue(value: _checkStepValue(output, value))),
      ClientDeviceOutputTemperatureCommand(:final value) =>
        OutputCommand.temperature(
            outputValue: OutputValue(value: _checkStepValue(output, value))),
      ClientDeviceOutputLedCommand(:final value) => OutputCommand.led(
          outputValue: OutputValue(value: _checkStepValue(output, value))),
      ClientDeviceOutputPositionCommand(:final value) => OutputCommand.position(
          outputValue: OutputValue(value: _checkStepValue(output, value))),
      ClientDeviceOutputPositionWithDurationCommand(
        :final value,
        :final duration
      ) =>
        OutputCommand.positionWithDuration(
            outputValue: OutputPositionWithDuration(
                value: _checkStepValue(output, value), duration: duration)),
      ClientDeviceOutputSprayCommand(:final value) => OutputCommand.spray(
          outputValue: OutputValue(value: _checkStepValue(output, value))),
    };
    return OutputCmd.v4(featureIndex: featureIndex, command: outputCmd);
  }
}
