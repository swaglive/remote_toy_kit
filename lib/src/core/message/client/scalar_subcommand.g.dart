// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scalar_subcommand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScalarSubcommand _$ScalarSubcommandFromJson(Map<String, dynamic> json) =>
    _ScalarSubcommand(
      featureIndex: (json['featureIndex'] as num).toInt(),
      scalar: (json['scalar'] as num).toDouble(),
      outputType: $enumDecode(_$OutputTypeEnumMap, json['outputType']),
    );

Map<String, dynamic> _$ScalarSubcommandToJson(_ScalarSubcommand instance) =>
    <String, dynamic>{
      'featureIndex': instance.featureIndex,
      'scalar': instance.scalar,
      'outputType': _$OutputTypeEnumMap[instance.outputType]!,
    };

const _$OutputTypeEnumMap = {
  OutputType.unknown: 'unknown',
  OutputType.vibrate: 'vibrate',
  OutputType.rotate: 'rotate',
  OutputType.oscillate: 'oscillate',
  OutputType.constrict: 'constrict',
  OutputType.position: 'position',
  OutputType.positionWithDuration: 'positionWithDuration',
  OutputType.temperature: 'temperature',
  OutputType.led: 'led',
  OutputType.spray: 'spray',
};
