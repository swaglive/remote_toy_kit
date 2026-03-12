// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StopDeviceCmdClientMessage _$StopDeviceCmdClientMessageFromJson(
        Map<String, dynamic> json) =>
    StopDeviceCmdClientMessage(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$StopDeviceCmdClientMessageToJson(
        StopDeviceCmdClientMessage instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

StopAllDevicesClientMessage _$StopAllDevicesClientMessageFromJson(
        Map<String, dynamic> json) =>
    StopAllDevicesClientMessage(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$StopAllDevicesClientMessageToJson(
        StopAllDevicesClientMessage instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

SensorSubscribeCmdClientMessage _$SensorSubscribeCmdClientMessageFromJson(
        Map<String, dynamic> json) =>
    SensorSubscribeCmdClientMessage(
      featureIndex: (json['featureIndex'] as num).toInt(),
      inputType: $enumDecode(_$InputTypeEnumMap, json['inputType']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SensorSubscribeCmdClientMessageToJson(
        SensorSubscribeCmdClientMessage instance) =>
    <String, dynamic>{
      'featureIndex': instance.featureIndex,
      'inputType': _$InputTypeEnumMap[instance.inputType]!,
      'runtimeType': instance.$type,
    };

const _$InputTypeEnumMap = {
  InputType.unknown: 'unknown',
  InputType.battery: 'battery',
  InputType.rssi: 'rssi',
  InputType.button: 'button',
  InputType.pressure: 'pressure',
};

SensorUnsubscribeCmdClientMessage _$SensorUnsubscribeCmdClientMessageFromJson(
        Map<String, dynamic> json) =>
    SensorUnsubscribeCmdClientMessage(
      featureIndex: (json['featureIndex'] as num).toInt(),
      inputType: $enumDecode(_$InputTypeEnumMap, json['inputType']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SensorUnsubscribeCmdClientMessageToJson(
        SensorUnsubscribeCmdClientMessage instance) =>
    <String, dynamic>{
      'featureIndex': instance.featureIndex,
      'inputType': _$InputTypeEnumMap[instance.inputType]!,
      'runtimeType': instance.$type,
    };

InputCmdClientMessage _$InputCmdClientMessageFromJson(
        Map<String, dynamic> json) =>
    InputCmdClientMessage(
      command: InputCmd.fromJson(json['command'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$InputCmdClientMessageToJson(
        InputCmdClientMessage instance) =>
    <String, dynamic>{
      'command': instance.command.toJson(),
      'runtimeType': instance.$type,
    };

OutputCmdClientMessage _$OutputCmdClientMessageFromJson(
        Map<String, dynamic> json) =>
    OutputCmdClientMessage(
      command: OutputCmd.fromJson(json['command'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$OutputCmdClientMessageToJson(
        OutputCmdClientMessage instance) =>
    <String, dynamic>{
      'command': instance.command.toJson(),
      'runtimeType': instance.$type,
    };
