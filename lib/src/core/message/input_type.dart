/// Input (sensor) type identifiers for device queries.
library core.message.input_type;

import 'feature_type.dart';

/// The type of input sensor a command targets.
enum InputType {
  unknown,
  battery,
  rssi,
  button,
  pressure;

  static InputType? tryFrom({required FeatureType type}) => switch (type) {
        FeatureType.unknown => InputType.unknown,
        FeatureType.battery => InputType.battery,
        FeatureType.rssi => InputType.rssi,
        FeatureType.button => InputType.button,
        FeatureType.pressure => InputType.pressure,
        _ => null,
      };
}
