/// Input command operation types (read, subscribe, unsubscribe).
library core.message.input_cmd_type;

import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(valueField: 'jsonValue')
enum InputCommandType {
  read(jsonValue: 'Read'),
  subscribe(jsonValue: 'Subscribe'),
  unsubscribe(jsonValue: 'Unsubscribe');

  const InputCommandType({required this.jsonValue});

  final String jsonValue;
}
