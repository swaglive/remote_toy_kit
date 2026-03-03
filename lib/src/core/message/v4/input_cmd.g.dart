// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_cmd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InputCmdV4 _$InputCmdV4FromJson(Map<String, dynamic> json) => InputCmdV4(
      featureIndex: (json['featureIndex'] as num).toInt(),
      inputType: $enumDecode(_$InputTypeEnumMap, json['inputType']),
      inputCommandType:
          $enumDecode(_$InputCommandTypeEnumMap, json['inputCommandType']),
    );

Map<String, dynamic> _$InputCmdV4ToJson(InputCmdV4 instance) =>
    <String, dynamic>{
      'featureIndex': instance.featureIndex,
      'inputType': _$InputTypeEnumMap[instance.inputType]!,
      'inputCommandType': _$InputCommandTypeEnumMap[instance.inputCommandType]!,
    };

const _$InputTypeEnumMap = {
  InputType.unknown: 'unknown',
  InputType.battery: 'battery',
  InputType.rssi: 'rssi',
  InputType.button: 'button',
  InputType.pressure: 'pressure',
};

const _$InputCommandTypeEnumMap = {
  InputCommandType.read: 'Read',
  InputCommandType.subscribe: 'Subscribe',
  InputCommandType.unsubscribe: 'Unsubscribe',
};
