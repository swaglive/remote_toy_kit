// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_configuration_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceConfigurationVersion _$DeviceConfigurationVersionFromJson(
        Map<String, dynamic> json) =>
    _DeviceConfigurationVersion(
      major: (json['major'] as num).toInt(),
      minor: (json['minor'] as num).toInt(),
    );

Map<String, dynamic> _$DeviceConfigurationVersionToJson(
        _DeviceConfigurationVersion instance) =>
    <String, dynamic>{
      'major': instance.major,
      'minor': instance.minor,
    };
