// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'output_cmd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OutputValue _$OutputValueFromJson(Map<String, dynamic> json) => _OutputValue(
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$OutputValueToJson(_OutputValue instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

_OutputPositionWithDuration _$OutputPositionWithDurationFromJson(
        Map<String, dynamic> json) =>
    _OutputPositionWithDuration(
      value: (json['value'] as num).toInt(),
      duration: (json['duration'] as num).toInt(),
    );

Map<String, dynamic> _$OutputPositionWithDurationToJson(
        _OutputPositionWithDuration instance) =>
    <String, dynamic>{
      'value': instance.value,
      'duration': instance.duration,
    };

OutputCommandVibrate _$OutputCommandVibrateFromJson(
        Map<String, dynamic> json) =>
    OutputCommandVibrate(
      outputValue:
          OutputValue.fromJson(json['outputValue'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$OutputCommandVibrateToJson(
        OutputCommandVibrate instance) =>
    <String, dynamic>{
      'outputValue': instance.outputValue.toJson(),
      'runtimeType': instance.$type,
    };

OutputCommandRotate _$OutputCommandRotateFromJson(Map<String, dynamic> json) =>
    OutputCommandRotate(
      outputValue:
          OutputValue.fromJson(json['outputValue'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$OutputCommandRotateToJson(
        OutputCommandRotate instance) =>
    <String, dynamic>{
      'outputValue': instance.outputValue.toJson(),
      'runtimeType': instance.$type,
    };

OutputCommandOscillate _$OutputCommandOscillateFromJson(
        Map<String, dynamic> json) =>
    OutputCommandOscillate(
      outputValue:
          OutputValue.fromJson(json['outputValue'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$OutputCommandOscillateToJson(
        OutputCommandOscillate instance) =>
    <String, dynamic>{
      'outputValue': instance.outputValue.toJson(),
      'runtimeType': instance.$type,
    };

OutputCommandConstrict _$OutputCommandConstrictFromJson(
        Map<String, dynamic> json) =>
    OutputCommandConstrict(
      outputValue:
          OutputValue.fromJson(json['outputValue'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$OutputCommandConstrictToJson(
        OutputCommandConstrict instance) =>
    <String, dynamic>{
      'outputValue': instance.outputValue.toJson(),
      'runtimeType': instance.$type,
    };

OutputCommandTemperature _$OutputCommandTemperatureFromJson(
        Map<String, dynamic> json) =>
    OutputCommandTemperature(
      outputValue:
          OutputValue.fromJson(json['outputValue'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$OutputCommandTemperatureToJson(
        OutputCommandTemperature instance) =>
    <String, dynamic>{
      'outputValue': instance.outputValue.toJson(),
      'runtimeType': instance.$type,
    };

OutputCommandLed _$OutputCommandLedFromJson(Map<String, dynamic> json) =>
    OutputCommandLed(
      outputValue:
          OutputValue.fromJson(json['outputValue'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$OutputCommandLedToJson(OutputCommandLed instance) =>
    <String, dynamic>{
      'outputValue': instance.outputValue.toJson(),
      'runtimeType': instance.$type,
    };

OutputCommandPosition _$OutputCommandPositionFromJson(
        Map<String, dynamic> json) =>
    OutputCommandPosition(
      outputValue:
          OutputValue.fromJson(json['outputValue'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$OutputCommandPositionToJson(
        OutputCommandPosition instance) =>
    <String, dynamic>{
      'outputValue': instance.outputValue.toJson(),
      'runtimeType': instance.$type,
    };

OutputCommandPositionWithDuration _$OutputCommandPositionWithDurationFromJson(
        Map<String, dynamic> json) =>
    OutputCommandPositionWithDuration(
      outputValue: OutputPositionWithDuration.fromJson(
          json['outputValue'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$OutputCommandPositionWithDurationToJson(
        OutputCommandPositionWithDuration instance) =>
    <String, dynamic>{
      'outputValue': instance.outputValue.toJson(),
      'runtimeType': instance.$type,
    };

OutputCommandSpray _$OutputCommandSprayFromJson(Map<String, dynamic> json) =>
    OutputCommandSpray(
      outputValue:
          OutputValue.fromJson(json['outputValue'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$OutputCommandSprayToJson(OutputCommandSpray instance) =>
    <String, dynamic>{
      'outputValue': instance.outputValue.toJson(),
      'runtimeType': instance.$type,
    };

OutputCmdV4 _$OutputCmdV4FromJson(Map<String, dynamic> json) => OutputCmdV4(
      featureIndex: (json['featureIndex'] as num).toInt(),
      command: OutputCommand.fromJson(json['command'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OutputCmdV4ToJson(OutputCmdV4 instance) =>
    <String, dynamic>{
      'featureIndex': instance.featureIndex,
      'command': instance.command.toJson(),
    };
