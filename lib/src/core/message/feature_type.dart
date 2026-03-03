/// Unified feature type enum covering both output (actuator) and
/// input (sensor) capabilities of a device.
library core.message.feature_type;

import 'package:freezed_annotation/freezed_annotation.dart';

import 'output_type.dart';
import 'input_type.dart';

@JsonEnum(valueField: 'jsonValue')
enum FeatureType {
  unknown(jsonValue: ''),
  vibrate(jsonValue: 'Vibrate'),
  // Single Direction Rotation Speed
  rotate(jsonValue: 'Rotate'),
  oscillate(jsonValue: 'Oscillate'),
  constrict(jsonValue: 'Constrict'),
  inflate(jsonValue: 'Inflate'),
  // For instances where we specify a position to move to ASAP. Usually servos, probably for the
  // OSR-2/SR-6.
  position(jsonValue: 'Position'),
  // Sensor Types
  battery(jsonValue: 'Battery'),
  rssi(jsonValue: 'RSSI'),
  button(jsonValue: 'Button'),
  pressure(jsonValue: 'Pressure'),

  // New feature types in spec 4.0
  led(jsonValue: 'Led'),
  spray(jsonValue: 'Spray'),
  temperature(jsonValue: 'Temperature'),
  positionWithDuration(jsonValue: 'PositionWithDuration'),

  // Currently unused but possible sensor features:
  // Accelerometer,
  // Gyro,
  //
  // Raw Feature, for when raw messages are on
  raw(jsonValue: 'Raw');

  const FeatureType({required this.jsonValue});

  /// Converts an [InputType] to its corresponding [FeatureType].
  ///
  /// Note: This was renamed from `fromSensorType` (spec 3.0) to
  /// `fromInputType` (spec 4.0).
  static FeatureType fromInputType(InputType type) => switch (type) {
        InputType.unknown => unknown,
        InputType.battery => battery,
        InputType.rssi => rssi,
        InputType.button => button,
        InputType.pressure => pressure,
      };

  /// Converts an [OutputType] to its corresponding [FeatureType].
  ///
  /// Note: This was renamed from `fromActuatorType` (spec 3.0) to
  /// `fromOutputType` (spec 4.0).
  static FeatureType fromOutputType(OutputType type) => switch (type) {
        OutputType.unknown => unknown,
        OutputType.vibrate => vibrate,
        OutputType.rotate => rotate,
        OutputType.oscillate => oscillate,
        OutputType.constrict => constrict,
        OutputType.position => position,
        OutputType.positionWithDuration => positionWithDuration,
        OutputType.led => led,
        OutputType.spray => spray,
        OutputType.temperature => temperature,
      };

  final String jsonValue;
}
