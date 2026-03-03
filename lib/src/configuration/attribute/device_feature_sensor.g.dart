// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_feature_sensor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceFeatureSensor _$DeviceFeatureSensorFromJson(Map<String, dynamic> json) =>
    _DeviceFeatureSensor(
      valueRange: (json['value-range'] as List<dynamic>)
          .map((e) => const RangeInclusiveJsonConverter().fromJson(e as List))
          .toList(),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => $enumDecode(_$SensorFeatureMessageTypeEnumMap, e))
          .toSet(),
    );

Map<String, dynamic> _$DeviceFeatureSensorToJson(
        _DeviceFeatureSensor instance) =>
    <String, dynamic>{
      'value-range': instance.valueRange
          .map(const RangeInclusiveJsonConverter().toJson)
          .toList(),
      'messages': instance.messages
          .map((e) => _$SensorFeatureMessageTypeEnumMap[e]!)
          .toList(),
    };

const _$SensorFeatureMessageTypeEnumMap = {
  SensorFeatureMessageType.sensorReadCmd: 'SensorReadCmd',
  SensorFeatureMessageType.sensorSubscribeCmd: 'SensorSubscribeCmd',
};
