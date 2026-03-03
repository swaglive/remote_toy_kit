/// Output (actuator) type identifiers for device commands.
library core.message.output_type;

import 'feature_type.dart';

/// The type of output actuator a command targets.
enum OutputType {
  unknown,
  vibrate,
  // Single Direction Rotation Speed
  rotate,
  oscillate,
  constrict,
  // For instances where we specify a position to move to ASAP. Usually servos, probably for the
  // OSR-2/SR-6.
  position,
  positionWithDuration,
  temperature,
  led,
  spray;

  static OutputType? tryFrom({required FeatureType value}) => switch (value) {
        FeatureType.unknown => OutputType.unknown,
        FeatureType.vibrate => OutputType.vibrate,
        FeatureType.rotate => OutputType.rotate,
        FeatureType.oscillate => OutputType.oscillate,
        FeatureType.constrict => OutputType.constrict,
        FeatureType.position => OutputType.position,
        FeatureType.positionWithDuration => OutputType.positionWithDuration,
        FeatureType.temperature => OutputType.temperature,
        FeatureType.led => OutputType.led,
        FeatureType.spray => OutputType.spray,
        _ => null,
      };
}
