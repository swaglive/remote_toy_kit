// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_feature_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceFeatureInput _$DeviceFeatureInputFromJson(Map<String, dynamic> json) =>
    _DeviceFeatureInput(
      battery: json['battery'] == null
          ? null
          : DeviceFeatureInputProperties.fromJson(
              json['battery'] as Map<String, dynamic>),
      rssi: json['rssi'] == null
          ? null
          : DeviceFeatureInputProperties.fromJson(
              json['rssi'] as Map<String, dynamic>),
      button: json['button'] == null
          ? null
          : DeviceFeatureInputProperties.fromJson(
              json['button'] as Map<String, dynamic>),
      pressure: json['pressure'] == null
          ? null
          : DeviceFeatureInputProperties.fromJson(
              json['pressure'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeviceFeatureInputToJson(_DeviceFeatureInput instance) =>
    <String, dynamic>{
      'battery': instance.battery?.toJson(),
      'rssi': instance.rssi?.toJson(),
      'button': instance.button?.toJson(),
      'pressure': instance.pressure?.toJson(),
    };
