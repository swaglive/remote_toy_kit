// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmptyServerMessage _$EmptyServerMessageFromJson(Map<String, dynamic> json) =>
    EmptyServerMessage(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$EmptyServerMessageToJson(EmptyServerMessage instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

RemoteToyServerReadingMessage _$RemoteToyServerReadingMessageFromJson(
        Map<String, dynamic> json) =>
    RemoteToyServerReadingMessage(
      featureIndex: (json['featureIndex'] as num).toInt(),
      inputType: $enumDecode(_$InputTypeEnumMap, json['inputType']),
      data: const Uint8ListJsonConverter().fromJson(json['data'] as List),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$RemoteToyServerReadingMessageToJson(
        RemoteToyServerReadingMessage instance) =>
    <String, dynamic>{
      'featureIndex': instance.featureIndex,
      'inputType': _$InputTypeEnumMap[instance.inputType]!,
      'data': const Uint8ListJsonConverter().toJson(instance.data),
      'runtimeType': instance.$type,
    };

const _$InputTypeEnumMap = {
  InputType.unknown: 'unknown',
  InputType.battery: 'battery',
  InputType.rssi: 'rssi',
  InputType.button: 'button',
  InputType.pressure: 'pressure',
};
