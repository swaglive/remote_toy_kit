/// Mobile (iOS/Android) implementation of [RemoteToyDeviceConnector].
///
/// Delegates the actual connection handshake to [ConnectToyMobileTask].
library mobile.remote_toy_device_mobile_connector;

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../configuration/configuration.dart';
import '../core/protocol/protocol.dart';
import '../remote_toy_device.dart';
import '../remote_toy_device_connector.dart';
import 'task/connect_toy_mobile_task.dart';

/// Mobile [RemoteToyDeviceConnector] that establishes a BLE connection
/// on iOS/Android and returns a [RemoteToyDevice].
class RemoteToyDeviceMobileConnector implements RemoteToyDeviceConnector {
  RemoteToyDeviceMobileConnector({
    required this.deviceConfiguration,
    required this.device,
    required this.specifier,
    required this.protocolIdentifier,
    required this.isSpecV4,
  });

  /// Full device configuration including supported feature sets.
  final DeviceConfiguration deviceConfiguration;

  /// The BLE device discovered during scanning.
  final BluetoothDevice device;

  /// BLE communication config (service UUIDs, characteristic mappings).
  final BluetoothLESpecifier specifier;

  /// Identifies the device model and creates the appropriate [ProtocolHandler].
  final ProtocolIdentifier protocolIdentifier;

  /// Whether to use the V4 device config spec.
  final bool isSpecV4;

  @override
  Future<RemoteToyDevice> connect() => ConnectToyMobileTask(
        deviceConfiguration: deviceConfiguration,
        device: device,
        specifier: specifier,
        protocolIdentifier: protocolIdentifier,
        isSpecV4: isSpecV4,
      ).call();
}
