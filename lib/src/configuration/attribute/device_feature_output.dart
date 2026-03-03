/// V4 output feature configuration listing all supported output
/// capabilities (vibrate, rotate, oscillate, etc.) and their value
/// ranges. Not used in spec 3.0.
library configuration.attribute.device_feature_output;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'device_feature_output_properties.dart';
import '../../core/message/message.dart';
import 'range_inclusive.dart';

part 'device_feature_output.freezed.dart';
part 'device_feature_output.g.dart';

@freezed
abstract class DeviceFeatureOutput with _$DeviceFeatureOutput {
  const DeviceFeatureOutput._();

  /// Device feature output.
  /// [vibrate] is the vibrate actuator properties.
  /// [rotate] is the rotate actuator properties.
  /// [oscillate] is the oscillate actuator properties.
  /// [constrict] is the constrict actuator properties.
  /// [temperature] is the temperature actuator properties.
  /// [led] is the led actuator properties.
  /// [position] is the position actuator properties.
  /// [positionWithDuration] is the position with duration actuator properties.
  /// [spray] is the spray actuator properties.
  const factory DeviceFeatureOutput({
    DeviceFeatureOutputValueProperties? vibrate,
    DeviceFeatureOutputValueProperties? rotate,
    DeviceFeatureOutputValueProperties? oscillate,
    DeviceFeatureOutputValueProperties? constrict,
    DeviceFeatureOutputValueProperties? temperature,
    DeviceFeatureOutputValueProperties? led,
    DeviceFeatureOutputPositionProperties? position,
    DeviceFeatureOutputPositionWithDurationProperties? positionWithDuration,
    DeviceFeatureOutputValueProperties? spray,
  }) = _DeviceFeatureOutput;

  factory DeviceFeatureOutput.fromJson(Map<String, dynamic> json) =>
      _$DeviceFeatureOutputFromJson(json);

  /// Check if the device feature output contains the given [outputType].
  /// Returns [bool] if output type is contained in this device feature output.
  bool contains(OutputType outputType) {
    switch (outputType) {
      case OutputType.vibrate:
        return vibrate != null;
      case OutputType.rotate:
        return rotate != null;
      case OutputType.oscillate:
        return oscillate != null;
      case OutputType.constrict:
        return constrict != null;
      case OutputType.temperature:
        return temperature != null;
      case OutputType.led:
        return led != null;
      case OutputType.position:
        return position != null;
      case OutputType.positionWithDuration:
        return positionWithDuration != null;
      case OutputType.spray:
        return spray != null;
      default:
        return false;
    }
  }

  /// Returns the feature type for this device feature output.
  /// If not found, return [FeatureType.unknown].
  FeatureType get featureType {
    if (vibrate != null) {
      return FeatureType.vibrate;
    } else if (rotate != null) {
      return FeatureType.rotate;
    } else if (oscillate != null) {
      return FeatureType.oscillate;
    } else if (constrict != null) {
      return FeatureType.constrict;
    } else if (temperature != null) {
      return FeatureType.temperature;
    } else if (led != null) {
      return FeatureType.led;
    } else if (position != null) {
      return FeatureType.position;
    } else if (positionWithDuration != null) {
      return FeatureType.positionWithDuration;
    } else if (spray != null) {
      return FeatureType.spray;
    } else {
      return FeatureType.unknown;
    }
  }

  /// Returns the output types for this device feature output.
  List<OutputType> get outputTypes {
    return [
      if (vibrate != null) OutputType.vibrate,
      if (rotate != null) OutputType.rotate,
      if (oscillate != null) OutputType.oscillate,
      if (constrict != null) OutputType.constrict,
      if (temperature != null) OutputType.temperature,
      if (led != null) OutputType.led,
      if (position != null) OutputType.position,
      if (positionWithDuration != null) OutputType.positionWithDuration,
      if (spray != null) OutputType.spray,
    ];
  }

  /// Returns the output value range (min/max limits) for the given [outputType].
  /// To get the step count, use [RangeInclusive.count].
  RangeInclusive? get outputValueRange {
    if (spray != null) {
      return spray!.value;
    } else if (position != null) {
      return position!.value;
    } else if (led != null) {
      return led!.value;
    } else if (temperature != null) {
      return temperature!.value;
    } else if (constrict != null) {
      return constrict!.value;
    } else if (oscillate != null) {
      return oscillate!.value;
    } else if (rotate != null) {
      return rotate!.value;
    } else if (vibrate != null) {
      return vibrate!.value;
    } else {
      return null;
    }
  }

  /// Returns the output limits for the given [outputType].
  DeviceFeatureOutputLimits? outputLimits(OutputType outputType) {
    switch (outputType) {
      case OutputType.vibrate:
        return vibrate;
      case OutputType.rotate:
        return rotate;
      case OutputType.oscillate:
        return oscillate;
      case OutputType.constrict:
        return constrict;
      case OutputType.temperature:
        return temperature;
      case OutputType.led:
        return led;
      case OutputType.position:
        return position;
      case OutputType.positionWithDuration:
        return positionWithDuration;
      case OutputType.spray:
        return spray;
      default:
        return null;
    }
  }

  /// Scales [value] through the output properties for the given
  /// [outputType], clamping or validating against the configured range.
  ///
  /// Throws [ArgumentError] if the [outputType] is not present or
  /// [value] is out of range.
  int calculateFromValue(OutputType outputType, int value) {
    switch (outputType) {
      case OutputType.constrict:
        final props = constrict;
        if (props == null) {
          throw ArgumentError.value(
            outputType,
            'outputType',
            'Invalid output',
          );
        }
        return props.calculateScaledValue(value);
      case OutputType.temperature:
        final props = temperature;
        if (props == null) {
          throw ArgumentError.value(
            outputType,
            'outputType',
            'Invalid output',
          );
        }
        return props.calculateScaledValue(value);
      case OutputType.led:
        final props = led;
        if (props == null) {
          throw ArgumentError.value(
            outputType,
            'outputType',
            'Invalid output',
          );
        }
        return props.calculateScaledValue(value);
      case OutputType.oscillate:
        final props = oscillate;
        if (props == null) {
          throw ArgumentError.value(
            outputType,
            'outputType',
            'Invalid output',
          );
        }
        return props.calculateScaledValue(value);
      case OutputType.position:
        final props = position;
        if (props == null) {
          throw ArgumentError.value(
            outputType,
            'outputType',
            'Invalid output',
          );
        }
        return props.calculateScaledValue(value);
      case OutputType.positionWithDuration:
        final props = positionWithDuration;
        if (props == null) {
          throw ArgumentError.value(
            outputType,
            'outputType',
            'Invalid output',
          );
        }
        return props.calculateScaledValue(value);
      case OutputType.rotate:
        final props = rotate;
        if (props == null) {
          throw ArgumentError.value(
            outputType,
            'outputType',
            'Invalid output',
          );
        }
        return props.calculateScaledValue(value);
      case OutputType.spray:
        final props = spray;
        if (props == null) {
          throw ArgumentError.value(
            outputType,
            'outputType',
            'Invalid output',
          );
        }
        return props.calculateScaledValue(value);
      case OutputType.vibrate:
        final props = vibrate;
        if (props == null) {
          throw ArgumentError.value(
            outputType,
            'outputType',
            'Invalid output',
          );
        }
        return props.calculateScaledValue(value);
      default:
        throw ArgumentError.value(
          outputType,
          'outputType',
          'Invalid output',
        );
    }
  }
}
