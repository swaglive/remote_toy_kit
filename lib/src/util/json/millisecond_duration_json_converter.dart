import 'package:freezed_annotation/freezed_annotation.dart';

class MillisecondDurationJsonConverter extends JsonConverter<Duration, num> {
  const MillisecondDurationJsonConverter();

  @override
  Duration fromJson(num json) {
    return Duration(milliseconds: json.toInt());
  }

  @override
  num toJson(Duration object) {
    return object.inMilliseconds;
  }
}
