// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_feature_input_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceFeatureInputProperties _$DeviceFeatureInputPropertiesFromJson(
        Map<String, dynamic> json) =>
    _DeviceFeatureInputProperties(
      value: (json['value'] as List<dynamic>)
          .map((e) => const RangeInclusiveJsonConverter().fromJson(e as List))
          .toList(),
      command: (json['command'] as List<dynamic>)
          .map((e) => $enumDecode(_$InputCommandTypeEnumMap, e))
          .toSet(),
    );

Map<String, dynamic> _$DeviceFeatureInputPropertiesToJson(
        _DeviceFeatureInputProperties instance) =>
    <String, dynamic>{
      'value': instance.value
          .map(const RangeInclusiveJsonConverter().toJson)
          .toList(),
      'command':
          instance.command.map((e) => _$InputCommandTypeEnumMap[e]!).toList(),
    };

const _$InputCommandTypeEnumMap = {
  InputCommandType.read: 'Read',
  InputCommandType.subscribe: 'Subscribe',
  InputCommandType.unsubscribe: 'Unsubscribe',
};
