/// The message sent from remote toy device to mobile app.
library core.message.server.server_message;

import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../util/json/uint8_list_json_converter.dart';
import '../input_type.dart';

part 'server_message.freezed.dart';
part 'server_message.g.dart';

@freezed
sealed class RemoteToyServerMessage with _$RemoteToyServerMessage {
  const factory RemoteToyServerMessage.empty() = EmptyServerMessage;

  /// Reading message from remote toy device.
  /// [featureIndex] is the index of the feature.
  /// [inputType] is the object of [InputType].
  /// [data] is the [Uint8List] of the reading.
  const factory RemoteToyServerMessage.reading({
    required int featureIndex,
    required InputType inputType,
    @Uint8ListJsonConverter() required Uint8List data,
  }) = RemoteToyServerReadingMessage;

  factory RemoteToyServerMessage.fromJson(Map<String, dynamic> json) =>
      _$RemoteToyServerMessageFromJson(json);
}
