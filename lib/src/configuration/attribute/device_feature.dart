/// A single device feature described in a Buttplug device configuration.
///
/// Two spec versions are supported: [DeviceFeatureV3] (uses actuator/sensor)
/// and [DeviceFeatureV4] (uses output/input). A custom `fromJson` factory
/// dispatches to the correct variant based on the presence of `feature-type`.
library configuration.attribute.device_feature;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/message/message.dart';
import 'device_feature_actuator.dart';
import 'device_feature_sensor.dart';
import 'device_feature_output.dart';
import 'device_feature_input.dart';
import '../../core/message/feature_type.dart';
import 'range_inclusive.dart';

part 'device_feature.freezed.dart';

@Freezed(fromJson: false, toJson: false)
abstract class DeviceFeature with _$DeviceFeature {
  const DeviceFeature._();

  /// Device feature v3.
  /// [description] is the description of the feature.
  /// [featureType] is the type of the feature.
  /// [actuator] is the actuator of the feature.
  /// [sensor] is the sensor of the feature.
  @Deprecated('Will be deprecated after spec 4.0 is fully released')
  const factory DeviceFeature.v3({
    @JsonKey(defaultValue: '') @Default('') String description,
    @JsonKey(name: 'feature-type') required FeatureType featureType,
    DeviceFeatureActuator? actuator,
    DeviceFeatureSensor? sensor,
  }) = DeviceFeatureV3;

  /// Device feature v4.
  /// [description] is the description of the feature.
  /// [id] is the unique identifier string.
  /// [index] is the index of the feature.
  /// [output] is the output properies from configuration.
  /// [input] is the input properies from configuration.
  const factory DeviceFeature.v4({
    @Default('') String description,
    required String id,
    required int index,
    DeviceFeatureOutput? output,
    DeviceFeatureInput? input,
  }) = DeviceFeatureV4;

  /// Convert JSON representation of a device feature into a [DeviceFeature].
  /// based on the presence of `feature-type`.
  factory DeviceFeature.fromJson(Map<String, dynamic> json) {
    if (json['feature-type'] != null) {
      return DeviceFeatureV3(
        description: json['description'] ?? '',
        featureType: FeatureType.values.firstWhere(
          (type) => type.jsonValue == json['feature-type'],
          orElse: () => FeatureType.unknown,
        ),
        actuator: json['actuator'] != null
            ? DeviceFeatureActuator.fromJson(json['actuator'])
            : null,
        sensor: json['sensor'] != null
            ? DeviceFeatureSensor.fromJson(json['sensor'])
            : null,
      );
    } else {
      return DeviceFeatureV4(
        description: json['description'] ?? '',
        id: json['id'] ?? '',
        index: json['index'] ?? 0,
        output: json['output'] != null
            ? DeviceFeatureOutput.fromJson(json['output'])
            : null,
        input: json['input'] != null
            ? DeviceFeatureInput.fromJson(json['input'])
            : null,
      );
    }
  }

  /// Convert the device feature into a JSON representation.
  /// based on the presence of `feature-type`.
  Map<String, dynamic> toJson() {
    switch (this) {
      case DeviceFeatureV3():
        final feature = this as DeviceFeatureV3;
        return {
          'description': feature.description,
          'feature-type': feature.featureType.jsonValue,
          'actuator': feature.actuator?.toJson(),
          'sensor': feature.sensor?.toJson(),
        };
      case DeviceFeatureV4():
        final feature = this as DeviceFeatureV4;
        return {
          'description': feature.description,
          'id': feature.id,
          'index': feature.index,
          'output': feature.output?.toJson(),
          'input': feature.input?.toJson(),
        };
    }
    throw UnsupportedError('Unsupported DeviceFeature type');
  }

  /// Returns the feature index for this device feature.
  ///
  /// V3 and V4 have different structures: V3 does not have a feature index,
  /// while V4 has a feature index.
  int? get featureIndex {
    switch (this) {
      case DeviceFeatureV3():
        return null;
      case DeviceFeatureV4():
        return (this as DeviceFeatureV4).index;
    }
    return null;
  }

  /// Returns the feature type for this device feature.
  ///
  /// V3 and V4 have different structures: V3 stores the feature type directly
  /// as a field, while V4 derives it from the output or input configuration.
  FeatureType get featureType {
    if (this is DeviceFeatureV3) {
      return (this as DeviceFeatureV3).featureType;
    } else if (this is DeviceFeatureV4) {
      final feature = this as DeviceFeatureV4;
      return feature.output?.featureType ??
          feature.input?.featureType ??
          FeatureType.unknown;
    }
    throw UnsupportedError('Unsupported DeviceFeature type');
  }

  /// Returns true if this device feature contains an output.
  ///
  /// V3 and V4 have different structures: V3 stores the output as an actuator,
  /// while V4 stores the output as an output.
  bool get containsOutput {
    switch (this) {
      case DeviceFeatureV3():
        return (this as DeviceFeatureV3).actuator != null;
      case DeviceFeatureV4():
        final feature = this as DeviceFeatureV4;
        return feature.output != null;
    }
    throw UnsupportedError('Unsupported DeviceFeature type');
  }

  /// Returns the output value range for this device feature.
  ///
  /// V3 and V4 have different structures: V3 stores the output value range as an actuator,
  /// while V4 stores the output value range as an output.
  RangeInclusive? get outputValueRange {
    switch (this) {
      case DeviceFeatureV3():
        return (this as DeviceFeatureV3).actuator?.stepRange;
      case DeviceFeatureV4():
        return (this as DeviceFeatureV4).output?.outputValueRange;
    }
    return null;
  }
}
