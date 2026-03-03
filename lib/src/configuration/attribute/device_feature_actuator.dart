/// V3 actuator feature configuration with step range and supported
/// command types (scalar, rotate, linear).
library configuration.attribute.device_feature_actuator;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'actuator_feature_message_type.dart';
import 'range_inclusive.dart';

part 'device_feature_actuator.freezed.dart';
part 'device_feature_actuator.g.dart';

@freezed
@Deprecated('Will be deprecated after spec 4.0 is fully released')
abstract class DeviceFeatureActuator with _$DeviceFeatureActuator {
  /// Device feature actuator.
  /// [stepRange] is the step range of the feature.
  /// [messages] is the messages of the feature.
  const factory DeviceFeatureActuator({
    @JsonKey(name: 'step-range')
    @RangeInclusiveJsonConverter()
    required RangeInclusive stepRange,
    required Set<ActuatorFeatureMessageType> messages,
  }) = _DeviceFeatureActuator;

  factory DeviceFeatureActuator.fromJson(Map<String, dynamic> json) =>
      _$DeviceFeatureActuatorFromJson(json);
}
