/// Spec 4.0 input (sensor) command model.
library core.message.v4.input_cmd;

import 'package:freezed_annotation/freezed_annotation.dart';

import '../input_type.dart';
import '../input_cmd_type.dart';

part 'input_cmd.freezed.dart';
part 'input_cmd.g.dart';

@freezed
sealed class InputCmd with _$InputCmd {
  const InputCmd._();

  const factory InputCmd.v4({
    required int featureIndex,
    required InputType inputType,
    required InputCommandType inputCommandType,
  }) = InputCmdV4;

  factory InputCmd.fromJson(Map<String, dynamic> json) =>
      _$InputCmdFromJson(json);
}
