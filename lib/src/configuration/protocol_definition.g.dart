// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protocol_definition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProtocolDefinition _$ProtocolDefinitionFromJson(Map<String, dynamic> json) =>
    _ProtocolDefinition(
      communication:
          _$JsonConverterFromJson<List<dynamic>, BluetoothLESpecifier?>(
              json['communication'],
              const _CommunicationJsonConverter().fromJson),
      defaults:
          ProtocolAttributes.fromJson(json['defaults'] as Map<String, dynamic>),
      configurations: (json['configurations'] as List<dynamic>?)
              ?.map(
                  (e) => ProtocolAttributes.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ProtocolDefinitionToJson(_ProtocolDefinition instance) =>
    <String, dynamic>{
      'communication':
          const _CommunicationJsonConverter().toJson(instance.communication),
      'defaults': instance.defaults.toJson(),
      'configurations':
          instance.configurations?.map((e) => e.toJson()).toList(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
