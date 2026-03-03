// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protocol_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProtocolAttributes _$ProtocolAttributesFromJson(Map<String, dynamic> json) =>
    _ProtocolAttributes(
      id: json['id'] as String?,
      identifier: (json['identifier'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      name: json['name'] as String,
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => DeviceFeature.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProtocolAttributesToJson(_ProtocolAttributes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'identifier': instance.identifier,
      'name': instance.name,
      'features': instance.features?.map((e) => e.toJson()).toList(),
    };
