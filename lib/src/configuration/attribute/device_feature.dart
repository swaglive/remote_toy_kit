/// A single device feature described in a Buttplug device configuration.
///
/// Wraps the v4 device feature format (uses output/input).
library configuration.attribute.device_feature;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/message/message.dart';
import 'device_feature_output.dart';
import 'device_feature_input.dart';
import 'range_inclusive.dart';

part 'device_feature.freezed.dart';

@Freezed(fromJson: false, toJson: false)
abstract class DeviceFeature with _$DeviceFeature {
  const DeviceFeature._();

  const factory DeviceFeature({
    @Default('') String description,
    required String id,
    required int index,
    DeviceFeatureOutput? output,
    DeviceFeatureInput? input,
  }) = _DeviceFeature;

  factory DeviceFeature.fromJson(Map<String, dynamic> json) {
    return DeviceFeature(
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

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'id': id,
      'index': index,
      'output': output?.toJson(),
      'input': input?.toJson(),
    };
  }

  /// Returns the feature index.
  int get featureIndex => index;

  /// Returns the feature type derived from the output or input configuration.
  FeatureType get featureType {
    return output?.featureType ?? input?.featureType ?? FeatureType.unknown;
  }

  /// Returns true if this device feature contains an output.
  bool get containsOutput => output != null;

  /// Returns the output value range for this device feature.
  RangeInclusive? get outputValueRange => output?.outputValueRange;
}
