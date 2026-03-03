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

ScalarCmdClientMessage _$ScalarCmdClientMessageFromJson(
        Map<String, dynamic> json) =>
    ScalarCmdClientMessage(
      scalars: (json['scalars'] as List<dynamic>)
          .map((e) => ScalarSubcommand.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ScalarCmdClientMessageToJson(
        ScalarCmdClientMessage instance) =>
    <String, dynamic>{
      'scalars': instance.scalars.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };

LinearCmdClientMessage _$LinearCmdClientMessageFromJson(
        Map<String, dynamic> json) =>
    LinearCmdClientMessage(
      vectors: (json['vectors'] as List<dynamic>)
          .map((e) => VectorSubcommand.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$LinearCmdClientMessageToJson(
        LinearCmdClientMessage instance) =>
    <String, dynamic>{
      'vectors': instance.vectors.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };

RotateCmdClientMessage _$RotateCmdClientMessageFromJson(
        Map<String, dynamic> json) =>
    RotateCmdClientMessage(
      rotations: (json['rotations'] as List<dynamic>)
          .map((e) => RotationSubcommand.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$RotateCmdClientMessageToJson(
        RotateCmdClientMessage instance) =>
    <String, dynamic>{
      'rotations': instance.rotations.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };

SensorReadCmdClientMessage _$SensorReadCmdClientMessageFromJson(
        Map<String, dynamic> json) =>
    SensorReadCmdClientMessage(
      featureIndex: (json['featureIndex'] as num).toInt(),
      inputType: $enumDecode(_$InputTypeEnumMap, json['inputType']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SensorReadCmdClientMessageToJson(
        SensorReadCmdClientMessage instance) =>
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
