/// Abstract BLE hardware interface defining communication primitives.
///
/// Platform-specific implementations ([BluetoothWebHardware],
/// [BluetoothMobileHardware]) provide concrete read/write/subscribe
/// operations over GATT characteristics.
library core.hardware.hardware;

import 'dart:typed_data';
import '../message/message.dart';
import 'hardware_cmd.dart';
import 'hardware_event.dart';

export 'hardware_cmd.dart';
export 'hardware_event.dart';

/// Device communication methods and basic identity information.
abstract class Hardware {
  /// The advertised device name.
  String get name;

  /// Unique device identifier (MAC address or platform UUID).
  String get id;

  /// The list of endpoints supported by the device.
  List<Endpoint> get endpoints;

  /// Whether the device is currently connected.
  bool get connected;

  /// Observable stream of the device's connection state.
  Stream<bool> get connected$;

  /// Events pushed by the device when a subscribed characteristic value changes.
  Stream<HardwareEvent> get events$;

  /// Disconnects from the device.
  Future<void> disconnect();

  /// Unified entry point for executing a [HardwareCmd].
  ///
  /// Dispatches to the appropriate method based on the command type:
  /// - [HardwareWriteCmd] => [writeValue]
  /// - [HardwareSubscribeCmd] => [subscribe]
  /// - [HardwareUnsubscribeCmd] => [unsubscribe]
  Future<void> execute({required HardwareCmd cmd}) => switch (cmd) {
        HardwareWriteCmd() => writeValue(cmd: cmd),
        HardwareSubscribeCmd() => subscribe(cmd: cmd),
        HardwareUnsubscribeCmd() => unsubscribe(cmd: cmd),
        _ => Future<void>.value(),
      };

  /// Reads data from the device.
  ///
  /// Returns the [Endpoint] that was read and the raw bytes received.
  Future<({Endpoint endpoint, Uint8List data})> readValue(
      {required HardwareReadCmd cmd});

  /// Writes data to the device via the specified endpoint.
  Future<void> writeValue({required HardwareWriteCmd cmd});

  /// Subscribes to value change notifications on the specified endpoint.
  Future<void> subscribe({required HardwareSubscribeCmd cmd});

  /// Unsubscribes from value change notifications on the specified endpoint.
  Future<void> unsubscribe({required HardwareUnsubscribeCmd cmd});
}
