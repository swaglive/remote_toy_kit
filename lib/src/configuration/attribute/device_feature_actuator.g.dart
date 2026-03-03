// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_feature_actuator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceFeatureActuator _$DeviceFeatureActuatorFromJson(
        Map<String, dynamic> json) =>
    _DeviceFeatureActuator(
      stepRange: const RangeInclusiveJsonConverter()
          .fromJson(json['step-range'] as List),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => $enumDecode(_$ActuatorFeatureMessageTypeEnumMap, e))
          .toSet(),
    );

Map<String, dynamic> _$DeviceFeatureActuatorToJson(
        _DeviceFeatureActuator instance) =>
    <String, dynamic>{
      'step-range':
          const RangeInclusiveJsonConverter().toJson(instance.stepRange),
      'messages': instance.messages
          .map((e) => _$ActuatorFeatureMessageTypeEnumMap[e]!)
          .toList(),
    };

const _$ActuatorFeatureMessageTypeEnumMap = {
  ActuatorFeatureMessageType.scalarCmd: 'ScalarCmd',
  ActuatorFeatureMessageType.rotateCmd: 'RotateCmd',
  ActuatorFeatureMessageType.linearCmd: 'LinearCmd',
};
