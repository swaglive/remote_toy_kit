/// Barrel export for all device configuration types, plus helpers
/// for loading bundled Buttplug JSON configs.
library configuration.configuration;

import 'dart:convert';
import 'package:flutter/services.dart';
import 'device_configuration.dart';

export 'attribute/actuator_feature_message_type.dart';
export 'attribute/device_feature.dart';
export 'attribute/device_feature_actuator.dart';
export 'attribute/device_feature_sensor.dart';
export 'attribute/protocol_attributes.dart';
export 'attribute/range_inclusive.dart';
export 'attribute/sensor_feature_message_type.dart';
export 'attribute/device_feature_output.dart';
export 'attribute/device_feature_input.dart';
export 'attribute/device_feature_output_properties.dart';
export 'attribute/device_feature_input_properties.dart';

// communication
export 'communication/bluetooth_le_manufacturer_data.dart';
export 'communication/bluetooth_le_specifier.dart';
// base
export 'device_configuration.dart';
export 'device_configuration_version.dart';
export 'protocol_definition.dart';

/// Buttplug device configuration spec version.
enum DeviceConfigVersion {
  /// Buttplug spec v3 - legacy version
  @Deprecated('Will be deprecated after spec 4.0 is fully released')
  v3('packages/remote_toy_kit/assets/buttplug-device-config-v3.json'),

  /// Buttplug spec v4 - latest version
  v4('packages/remote_toy_kit/assets/buttplug-device-config-v4.json');

  const DeviceConfigVersion(this.assetPath);

  /// The asset path for this config version.
  final String assetPath;
}

/// Loads the device configuration from the bundled JSON asset.
///
/// [deviceConfigVersion] specifies which Buttplug spec version to load.
Future<DeviceConfiguration> loadDeviceConfiguration({
  // !!IMPORTANT: DO NOT CHANGE THIS DEFAULT VALUE until v4 migration is completed.
  required DeviceConfigVersion deviceConfigVersion,
}) async {
  final configurationFile =
      await rootBundle.loadString(deviceConfigVersion.assetPath);
  return DeviceConfiguration.fromJson(jsonDecode(configurationFile));
}
