/// Parsed Buttplug device configuration containing protocol definitions,
/// BLE specifiers, and feature sets for all supported devices.
library configuration.device_configuration;

import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'attribute/protocol_attributes.dart';
import 'communication/bluetooth_le_specifier.dart';
import 'device_configuration_version.dart';
import 'protocol_definition.dart';

part 'device_configuration.freezed.dart';
part 'device_configuration.g.dart';

/// Alias for a protocol name string (e.g. `"lovense"`, `"monsterpub"`).
typedef ProtocolName = String;

/// Top-level parsed Buttplug device configuration.
///
/// Provides lookup methods to resolve [BluetoothLESpecifier]s for scanning
/// and [ProtocolAttributes] for a specific device model.
@freezed
abstract class DeviceConfiguration with _$DeviceConfiguration {
  const DeviceConfiguration._();

  const factory DeviceConfiguration({
    required DeviceConfigurationVersion version,
    @JsonKey(defaultValue: <ProtocolName, ProtocolDefinition>{})
    required Map<ProtocolName, ProtocolDefinition> protocols,
  }) = _DeviceConfiguration;

  factory DeviceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DeviceConfigurationFromJson(json);

  /// Extracts a flat map of protocol name -> BLE specifier for every
  /// protocol that declares a Bluetooth LE communication section.
  Map<ProtocolName, BluetoothLESpecifier> get specifiers {
    final Map<String, BluetoothLESpecifier> map = {};
    for (final entry in protocols.entries) {
      final String protocolName = entry.key;
      final BluetoothLESpecifier? specifier = entry.value.communication;
      if (specifier != null) {
        map[protocolName] = specifier;
      }
    }
    return map;
  }

  ProtocolDefinition? findProtocolDefinition(ProtocolName protocolName) {
    return protocols[protocolName];
  }

  /// Looks up the device's features by [protocolName] and [modelIdentifier].
  ///
  /// Returns null if the device is unsupported.
  ProtocolAttributes? findProtocolAttributes({
    required ProtocolName protocolName,
    String? modelIdentifier,
  }) {
    final ProtocolDefinition? definition = findProtocolDefinition(protocolName);
    if (definition == null) {
      // No protocol config found — device is unsupported
      return null;
    }
    if (modelIdentifier != null) {
      // Try to find a matching configuration by identifier
      final ProtocolAttributes? attributes = definition.configurations
          ?.firstWhereOrNull(
              (e) => e.identifier?.contains(modelIdentifier) ?? false);
      if (attributes != null) {
        if (attributes.features == null) {
          return attributes.copyWith(features: definition.defaults.features);
        }
        return attributes;
      }
    }
    // No matching model found — fall back to the default feature set
    return definition.defaults;
  }
}
