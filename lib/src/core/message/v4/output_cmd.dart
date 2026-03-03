/// Spec 4.0 output command models: [OutputCmd], [OutputCommand],
/// [OutputValue], and [OutputPositionWithDuration].
library core.message.v4.output_cmd;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../output_type.dart';

part 'output_cmd.freezed.dart';
part 'output_cmd.g.dart';

@freezed
sealed class OutputValue with _$OutputValue {
  const OutputValue._();

  const factory OutputValue({
    required int value,
  }) = _OutputValue;

  factory OutputValue.fromJson(Map<String, dynamic> json) =>
      _$OutputValueFromJson(json);
}

@freezed
sealed class OutputPositionWithDuration with _$OutputPositionWithDuration {
  const OutputPositionWithDuration._();

  const factory OutputPositionWithDuration({
    required int value,
    required int duration,
  }) = _OutputPositionWithDuration;

  factory OutputPositionWithDuration.fromJson(Map<String, dynamic> json) =>
      _$OutputPositionWithDurationFromJson(json);
}

@freezed
sealed class OutputCommand with _$OutputCommand {
  const OutputCommand._();

  const factory OutputCommand.vibrate({
    required OutputValue outputValue,
  }) = OutputCommandVibrate;

  const factory OutputCommand.rotate({
    required OutputValue outputValue,
  }) = OutputCommandRotate;

  const factory OutputCommand.oscillate({
    required OutputValue outputValue,
  }) = OutputCommandOscillate;

  const factory OutputCommand.constrict({
    required OutputValue outputValue,
  }) = OutputCommandConstrict;

  const factory OutputCommand.temperature({
    required OutputValue outputValue,
  }) = OutputCommandTemperature;

  const factory OutputCommand.led({
    required OutputValue outputValue,
  }) = OutputCommandLed;

  const factory OutputCommand.position({
    required OutputValue outputValue,
  }) = OutputCommandPosition;

  const factory OutputCommand.positionWithDuration({
    required OutputPositionWithDuration outputValue,
  }) = OutputCommandPositionWithDuration;

  const factory OutputCommand.spray({
    required OutputValue outputValue,
  }) = OutputCommandSpray;

  factory OutputCommand.fromJson(Map<String, dynamic> json) =>
      _$OutputCommandFromJson(json);

  OutputType get outputType => switch (this) {
        OutputCommandVibrate() => OutputType.vibrate,
        OutputCommandRotate() => OutputType.rotate,
        OutputCommandOscillate() => OutputType.oscillate,
        OutputCommandConstrict() => OutputType.constrict,
        OutputCommandTemperature() => OutputType.temperature,
        OutputCommandLed() => OutputType.led,
        OutputCommandPosition() => OutputType.position,
        OutputCommandPositionWithDuration() => OutputType.positionWithDuration,
        OutputCommandSpray() => OutputType.spray,
      };

  OutputCommand setValue(int newValue) {
    switch (this) {
      case OutputCommandVibrate():
        return OutputCommandVibrate(outputValue: OutputValue(value: newValue));
      case OutputCommandRotate():
        return OutputCommandRotate(outputValue: OutputValue(value: newValue));
      case OutputCommandOscillate():
        return OutputCommandOscillate(
            outputValue: OutputValue(value: newValue));
      case OutputCommandConstrict():
        return OutputCommandConstrict(
            outputValue: OutputValue(value: newValue));
      case OutputCommandTemperature():
        return OutputCommandTemperature(
            outputValue: OutputValue(value: newValue));
      case OutputCommandLed():
        return OutputCommandLed(outputValue: OutputValue(value: newValue));
      case OutputCommandPosition():
        return OutputCommandPosition(outputValue: OutputValue(value: newValue));
      case OutputCommandPositionWithDuration(:final outputValue):
        return OutputCommandPositionWithDuration(
            outputValue: OutputPositionWithDuration(
                value: newValue, duration: outputValue.duration));
      case OutputCommandSpray():
        return OutputCommandSpray(outputValue: OutputValue(value: newValue));
    }
  }

  int get value => switch (this) {
        OutputCommandVibrate(:final outputValue) => outputValue.value,
        OutputCommandRotate(:final outputValue) => outputValue.value,
        OutputCommandOscillate(:final outputValue) => outputValue.value,
        OutputCommandConstrict(:final outputValue) => outputValue.value,
        OutputCommandTemperature(:final outputValue) => outputValue.value,
        OutputCommandLed(:final outputValue) => outputValue.value,
        OutputCommandPosition(:final outputValue) => outputValue.value,
        OutputCommandPositionWithDuration(:final outputValue) =>
          outputValue.value,
        OutputCommandSpray(:final outputValue) => outputValue.value,
      };
}

@freezed
sealed class OutputCmd with _$OutputCmd {
  const OutputCmd._();

  const factory OutputCmd.v4({
    required int featureIndex,
    required OutputCommand command,
  }) = OutputCmdV4;

  factory OutputCmd.fromJson(Map<String, dynamic> json) =>
      _$OutputCmdFromJson(json);
}
