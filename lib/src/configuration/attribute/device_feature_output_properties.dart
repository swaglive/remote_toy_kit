/// V4 output property models that define value/position/duration ranges
/// and provide scaling logic for converting client values into valid
/// device-level step counts. Not used in spec 3.0.
library configuration.attribute.device_feature_output_properties;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'range_inclusive.dart';

part 'device_feature_output_properties.freezed.dart';
part 'device_feature_output_properties.g.dart';

/// Base class for output properties.
abstract class DeviceFeatureOutputLimits {
  /// The range of steps in the output property.
  RangeInclusive get stepLimit;

  /// The number of steps in the output property.
  int get stepCount;
}

/// Provides scaling methods to convert client-side double/int values into
/// device-level step values within the configured range.
abstract class DeviceFeatureOutputPropertiesCalculator {
  /// Calculates the scaled double value from the given double value.
  int calculateScaledDoubleValue(double value);

  /// Calculates the scaled value from the given int value.
  int calculateScaledValue(int value);
}

/// Value only output properties.
/// [value] is the range limits of the feature, it is a [RangeInclusive].
@freezed
abstract class DeviceFeatureOutputValueProperties
    with _$DeviceFeatureOutputValueProperties
    implements
        DeviceFeatureOutputLimits,
        DeviceFeatureOutputPropertiesCalculator {
  const DeviceFeatureOutputValueProperties._();

  const factory DeviceFeatureOutputValueProperties({
    @RangeInclusiveJsonConverter() required RangeInclusive value,
  }) = _DeviceFeatureOutputValueProperties;

  factory DeviceFeatureOutputValueProperties.fromJson(
          Map<String, dynamic> json) =>
      _$DeviceFeatureOutputValuePropertiesFromJson(json);

  @override
  RangeInclusive get stepLimit => value;

  @override
  int get stepCount => value.end;

  @override
  int calculateScaledDoubleValue(double value) {
    if (value < 0.0 || value > 1.0) {
      throw ArgumentError.value(
        value,
        'value',
        'Value must be between 0.0 and 1.0',
      );
    }

    final normalizedValue = value < 0.000001 ? 0.0 : value;
    final scaledValue = (stepCount * normalizedValue).ceil();
    return calculateScaledValue(scaledValue);
  }

  @override
  int calculateScaledValue(int value) {
    final range = this.value;

    if (value != 0 && value >= range.start && value <= range.end) {
      return value;
    } else if (value == 0) {
      return 0;
    }

    throw ArgumentError.value(
      value,
      'value',
      'Value is outside of range $range',
    );
  }
}

/// Position (value only) output properties.
/// [value] is the range limits of the feature, it is a [RangeInclusive].
@freezed
abstract class DeviceFeatureOutputPositionProperties
    with _$DeviceFeatureOutputPositionProperties
    implements
        DeviceFeatureOutputLimits,
        DeviceFeatureOutputPropertiesCalculator {
  const DeviceFeatureOutputPositionProperties._();

  const factory DeviceFeatureOutputPositionProperties({
    @RangeInclusiveJsonConverter() required RangeInclusive value,
  }) = _DeviceFeatureOutputPositionProperties;

  factory DeviceFeatureOutputPositionProperties.fromJson(
          Map<String, dynamic> json) =>
      _$DeviceFeatureOutputPositionPropertiesFromJson(json);

  @override
  RangeInclusive get stepLimit => value;

  @override
  int get stepCount => value.end;

  @override
  int calculateScaledValue(int value) {
    final range = this.value;
    final candidate = range.start + value;

    if (candidate >= range.start && candidate <= range.end) {
      return candidate;
    }

    throw ArgumentError.value(
      value,
      'value',
      'Value is outside of range $range',
    );
  }

  @override
  int calculateScaledDoubleValue(double value) {
    if (value < 0.0 || value > 1.0) {
      throw ArgumentError.value(
        value,
        'value',
        'Value must be between 0.0 and 1.0',
      );
    }

    final scaledValue = (stepCount * value).ceil();
    return calculateScaledValue(scaledValue);
  }
}

/// Position with duration output properties.
/// [value] is the range limits of the feature, it is a [RangeInclusive].
/// [duration] is the range limits of the feature, it is a [RangeInclusive].
@freezed
abstract class DeviceFeatureOutputPositionWithDurationProperties
    with _$DeviceFeatureOutputPositionWithDurationProperties
    implements
        DeviceFeatureOutputLimits,
        DeviceFeatureOutputPropertiesCalculator {
  const DeviceFeatureOutputPositionWithDurationProperties._();

  const factory DeviceFeatureOutputPositionWithDurationProperties({
    @RangeInclusiveJsonConverter() required RangeInclusive value,
    @RangeInclusiveJsonConverter() required RangeInclusive duration,
  }) = _DeviceFeatureOutputPositionWithDurationProperties;

  factory DeviceFeatureOutputPositionWithDurationProperties.fromJson(
          Map<String, dynamic> json) =>
      _$DeviceFeatureOutputPositionWithDurationPropertiesFromJson(json);

  @override
  RangeInclusive get stepLimit => value;

  @override
  int get stepCount => value.end;

  @override
  int calculateScaledValue(int value) {
    final range = this.value;
    final candidate = range.start + value;

    if (value > 0 && candidate >= range.start && candidate <= range.end) {
      return candidate;
    } else if (value == 0) {
      return 0;
    }

    throw ArgumentError.value(
      value,
      'value',
      'Value is outside of range $range',
    );
  }

  @override
  int calculateScaledDoubleValue(double value) {
    final scaledValue = (stepCount * value).ceil();
    return calculateScaledValue(scaledValue);
  }
}
