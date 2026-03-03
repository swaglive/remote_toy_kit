// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_feature_output_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceFeatureOutputValueProperties
    _$DeviceFeatureOutputValuePropertiesFromJson(Map<String, dynamic> json) =>
        _DeviceFeatureOutputValueProperties(
          value: const RangeInclusiveJsonConverter()
              .fromJson(json['value'] as List),
        );

Map<String, dynamic> _$DeviceFeatureOutputValuePropertiesToJson(
        _DeviceFeatureOutputValueProperties instance) =>
    <String, dynamic>{
      'value': const RangeInclusiveJsonConverter().toJson(instance.value),
    };

_DeviceFeatureOutputPositionProperties
    _$DeviceFeatureOutputPositionPropertiesFromJson(
            Map<String, dynamic> json) =>
        _DeviceFeatureOutputPositionProperties(
          value: const RangeInclusiveJsonConverter()
              .fromJson(json['value'] as List),
        );

Map<String, dynamic> _$DeviceFeatureOutputPositionPropertiesToJson(
        _DeviceFeatureOutputPositionProperties instance) =>
    <String, dynamic>{
      'value': const RangeInclusiveJsonConverter().toJson(instance.value),
    };

_DeviceFeatureOutputPositionWithDurationProperties
    _$DeviceFeatureOutputPositionWithDurationPropertiesFromJson(
            Map<String, dynamic> json) =>
        _DeviceFeatureOutputPositionWithDurationProperties(
          value: const RangeInclusiveJsonConverter()
              .fromJson(json['value'] as List),
          duration: const RangeInclusiveJsonConverter()
              .fromJson(json['duration'] as List),
        );

Map<String, dynamic> _$DeviceFeatureOutputPositionWithDurationPropertiesToJson(
        _DeviceFeatureOutputPositionWithDurationProperties instance) =>
    <String, dynamic>{
      'value': const RangeInclusiveJsonConverter().toJson(instance.value),
      'duration': const RangeInclusiveJsonConverter().toJson(instance.duration),
    };
