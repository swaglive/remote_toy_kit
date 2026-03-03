// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vector_subcommand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VectorSubcommand _$VectorSubcommandFromJson(Map<String, dynamic> json) =>
    _VectorSubcommand(
      featureIndex: (json['featureIndex'] as num).toInt(),
      duration: const MillisecondDurationJsonConverter()
          .fromJson(json['duration'] as num),
      position: (json['position'] as num).toDouble(),
    );

Map<String, dynamic> _$VectorSubcommandToJson(_VectorSubcommand instance) =>
    <String, dynamic>{
      'featureIndex': instance.featureIndex,
      'duration':
          const MillisecondDurationJsonConverter().toJson(instance.duration),
      'position': instance.position,
    };
