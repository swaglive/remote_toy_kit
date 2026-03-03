/// V4 input property model holding value ranges and supported
/// input command types. Not used in spec 3.0.
library configuration.attribute.device_feature_input_properties;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'range_inclusive.dart';
import '../../core/message/message.dart';

part 'device_feature_input_properties.freezed.dart';
part 'device_feature_input_properties.g.dart';

@freezed
abstract class DeviceFeatureInputProperties
    with _$DeviceFeatureInputProperties {
  /// Device feature input properties.
  /// [value] is the supported value range of the feature, it is a list of [RangeInclusive].
  /// [command] is the supported input command types of the feature, it is a set of [InputCommandType].
  const factory DeviceFeatureInputProperties({
    @RangeInclusiveJsonConverter() required List<RangeInclusive> value,
    required Set<InputCommandType> command,
  }) = _DeviceFeatureInputProperties;

  factory DeviceFeatureInputProperties.fromJson(Map<String, dynamic> json) =>
      _$DeviceFeatureInputPropertiesFromJson(json);
}
