/// An inclusive integer range [start, end] used for step counts
/// and value limits, plus a JSON converter that reads `[start, end]`
/// arrays from configuration files.
library configuration.attribute.range_inclusive;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'range_inclusive.freezed.dart';

@Freezed(fromJson: false, toJson: false)
abstract class RangeInclusive with _$RangeInclusive {
  const RangeInclusive._();

  /// Range inclusive.
  /// [start] is the lower bound of the range.
  /// [end] is the upper bound of the range.
  const factory RangeInclusive({
    required int start,
    required int end,
  }) = _RangeInclusive;

  /// Returns the number of steps in the range.
  int get count => end - start;

  /// Check if the range is valid.
  bool get isValid => (start == 0 && end == 0) || start < end;
}

/// A JSON converter for [RangeInclusive].
class RangeInclusiveJsonConverter
    extends JsonConverter<RangeInclusive, List<dynamic>> {
  const RangeInclusiveJsonConverter();

  /// Custom JSON converter for [RangeInclusive].
  /// Convert JSON representation of a range inclusive into a [RangeInclusive].
  @override
  RangeInclusive fromJson(List<dynamic> json) {
    try {
      final List<int> list = json.cast<int>();
      return RangeInclusive(start: list[0], end: list[1]);
    } catch (e) {
      // TODO: log cast error
      return const RangeInclusive(start: 0, end: 0);
    }
  }

  @override
  List<dynamic> toJson(RangeInclusive object) {
    return <dynamic>[object.start, object.end];
  }
}
