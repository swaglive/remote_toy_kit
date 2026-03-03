/// Defines the abstract interface for device connections.
///
/// Implementors establish a Bluetooth connection and return
/// an operable [RemoteToyDevice].
library remote_toy_device_connector;

import 'remote_toy_device.dart';

/// [RemoteToyDeviceConnector] provides a [connect] method to establish
/// a connection and return a [RemoteToyDevice] for controlling the device
/// and reading its information.
abstract interface class RemoteToyDeviceConnector {
  /// Connects to the device and returns a [RemoteToyDevice].
  ///
  /// - Throws [RemoteToyBluetoothException] on connection errors.
  /// - Throws [RemoteToyDeviceException] on device model identification errors.
  Future<RemoteToyDevice> connect();
}
