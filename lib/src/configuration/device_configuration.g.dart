// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceConfiguration _$DeviceConfigurationFromJson(Map<String, dynamic> json) =>
    _DeviceConfiguration(
      version: DeviceConfigurationVersion.fromJson(
          json['version'] as Map<String, dynamic>),
      protocols: (json['protocols'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, ProtocolDefinition.fromJson(e as Map<String, dynamic>)),
          ) ??
          {},
    );

Map<String, dynamic> _$DeviceConfigurationToJson(
        _DeviceConfiguration instance) =>
    <String, dynamic>{
      'version': instance.version.toJson(),
      'protocols': instance.protocols.map((k, e) => MapEntry(k, e.toJson())),
    };
