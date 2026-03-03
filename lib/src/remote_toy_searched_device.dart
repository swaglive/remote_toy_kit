/// A device discovered during a BLE scan, carrying the info needed
/// to display it in a list and to establish a connection.
library remote_toy_searched_device;

import 'remote_toy_device_connector.dart';

/// Represents a remote-toy device found during a BLE scan.
///
/// Two instances are considered equal when they share the same [address],
/// which serves as the device's unique identifier across scans.
class RemoteToySearchedDevice {
  const RemoteToySearchedDevice({
    required this.name,
    required this.address,
    required this.connector,
  });

  /// The BLE advertised name of the device.
  final String name;

  /// Platform-dependent unique identifier -- could be a MAC address
  /// or a UUID.
  final String address;

  /// Connector that identifies the device model, resolves supported
  /// features, and establishes a [RemoteToyDevice] connection.
  final RemoteToyDeviceConnector connector;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RemoteToySearchedDevice && other.address == address;
  }

  @override
  int get hashCode => Object.hash(name, address, connector);
}
