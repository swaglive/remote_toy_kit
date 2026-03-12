/// Barrel export for all device configuration types, plus helpers
/// for loading bundled Buttplug JSON configs.
library configuration.configuration;

import 'dart:convert';
import 'package:flutter/services.dart';
import 'device_configuration.dart';

export 'attribute/device_feature.dart';
export 'attribute/protocol_attributes.dart';
export 'attribute/range_inclusive.dart';
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

/// The asset path for the Buttplug v4 device configuration.
const String _deviceConfigAssetPath =
    'packages/remote_toy_kit/assets/buttplug-device-config-v4.json';

/// Loads the device configuration from the bundled JSON asset.
Future<DeviceConfiguration> loadDeviceConfiguration() async {
  final configurationFile = await rootBundle.loadString(_deviceConfigAssetPath);
  return DeviceConfiguration.fromJson(jsonDecode(configurationFile));
}
