// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_feature_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceFeatureOutput _$DeviceFeatureOutputFromJson(Map<String, dynamic> json) =>
    _DeviceFeatureOutput(
      vibrate: json['vibrate'] == null
          ? null
          : DeviceFeatureOutputValueProperties.fromJson(
              json['vibrate'] as Map<String, dynamic>),
      rotate: json['rotate'] == null
          ? null
          : DeviceFeatureOutputValueProperties.fromJson(
              json['rotate'] as Map<String, dynamic>),
      oscillate: json['oscillate'] == null
          ? null
          : DeviceFeatureOutputValueProperties.fromJson(
              json['oscillate'] as Map<String, dynamic>),
      constrict: json['constrict'] == null
          ? null
          : DeviceFeatureOutputValueProperties.fromJson(
              json['constrict'] as Map<String, dynamic>),
      temperature: json['temperature'] == null
          ? null
          : DeviceFeatureOutputValueProperties.fromJson(
              json['temperature'] as Map<String, dynamic>),
      led: json['led'] == null
          ? null
          : DeviceFeatureOutputValueProperties.fromJson(
              json['led'] as Map<String, dynamic>),
      position: json['position'] == null
          ? null
          : DeviceFeatureOutputPositionProperties.fromJson(
              json['position'] as Map<String, dynamic>),
      positionWithDuration: json['positionWithDuration'] == null
          ? null
          : DeviceFeatureOutputPositionWithDurationProperties.fromJson(
              json['positionWithDuration'] as Map<String, dynamic>),
      spray: json['spray'] == null
          ? null
          : DeviceFeatureOutputValueProperties.fromJson(
              json['spray'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeviceFeatureOutputToJson(
        _DeviceFeatureOutput instance) =>
    <String, dynamic>{
      'vibrate': instance.vibrate?.toJson(),
      'rotate': instance.rotate?.toJson(),
      'oscillate': instance.oscillate?.toJson(),
      'constrict': instance.constrict?.toJson(),
      'temperature': instance.temperature?.toJson(),
      'led': instance.led?.toJson(),
      'position': instance.position?.toJson(),
      'positionWithDuration': instance.positionWithDuration?.toJson(),
      'spray': instance.spray?.toJson(),
    };
