// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rotation_subcommand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RotationSubcommand _$RotationSubcommandFromJson(Map<String, dynamic> json) =>
    _RotationSubcommand(
      featureIndex: (json['featureIndex'] as num).toInt(),
      speed: (json['speed'] as num).toDouble(),
      clockwise: json['clockwise'] as bool,
    );

Map<String, dynamic> _$RotationSubcommandToJson(_RotationSubcommand instance) =>
    <String, dynamic>{
      'featureIndex': instance.featureIndex,
      'speed': instance.speed,
      'clockwise': instance.clockwise,
    };
