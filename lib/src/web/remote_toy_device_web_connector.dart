/// Web Bluetooth implementation of [RemoteToyDeviceConnector].
///
/// Delegates the actual connection handshake to [ConnectToyWebTask].
library web.remote_toy_device_web_connector;

import 'package:flutter_web_bluetooth/flutter_web_bluetooth.dart';

import '../configuration/configuration.dart';
import '../core/protocol/protocol.dart';
import '../remote_toy_device.dart';
import '../remote_toy_device_connector.dart';
import 'task/connect_toy_web_task.dart';

/// Web Bluetooth [RemoteToyDeviceConnector] that establishes a BLE connection
/// in a browser environment and returns a [RemoteToyDevice].
class RemoteToyDeviceWebConnector implements RemoteToyDeviceConnector {
  RemoteToyDeviceWebConnector({
    required this.deviceConfiguration,
    required this.device,
    required this.specifier,
    required this.protocolIdentifier,
    required this.protocols,
    required this.isSpecV4,
  });

  /// Full device configuration including supported feature sets.
  final DeviceConfiguration deviceConfiguration;

  /// The Web Bluetooth device discovered during scanning.
  final BluetoothDevice device;

  /// BLE communication config (service UUIDs, characteristic mappings).
  final BluetoothLESpecifier specifier;

  /// Identifies the device model and creates the appropriate [ProtocolHandler].
  final ProtocolIdentifier protocolIdentifier;

  /// All known protocol identifier factories, used as fallback when the
  /// primary protocol identification fails.
  final Map<String, ProtocolIdentifierFactory> protocols;

  /// Whether to use the V4 device config spec.
  final bool isSpecV4;

  @override
  Future<RemoteToyDevice> connect() => ConnectToyWebTask(
        deviceConfiguration: deviceConfiguration,
        device: device,
        specifier: specifier,
        protocolIdentifier: protocolIdentifier,
        protocols: protocols,
        isSpecV4: isSpecV4,
      ).call();
}
