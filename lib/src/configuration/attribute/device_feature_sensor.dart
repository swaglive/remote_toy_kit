/// V3 sensor feature configuration with value ranges and supported
/// sensor command types (read, subscribe).
library configuration.attribute.device_feature_sensor;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'range_inclusive.dart';
import 'sensor_feature_message_type.dart';

part 'device_feature_sensor.freezed.dart';
part 'device_feature_sensor.g.dart';

@freezed
@Deprecated('Will be deprecated after spec 4.0 is fully released')
abstract class DeviceFeatureSensor with _$DeviceFeatureSensor {
  const factory DeviceFeatureSensor({
    @JsonKey(name: 'value-range')
    @RangeInclusiveJsonConverter()
    required List<RangeInclusive> valueRange,
    required Set<SensorFeatureMessageType> messages,
  }) = _DeviceFeatureSensor;

  factory DeviceFeatureSensor.fromJson(Map<String, dynamic> json) =>
      _$DeviceFeatureSensorFromJson(json);
}
