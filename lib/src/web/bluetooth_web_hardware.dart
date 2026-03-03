/// Web Bluetooth [Hardware] implementation.
///
/// Bridges the [Hardware] abstraction to the browser's Web Bluetooth API
/// via [BluetoothDevice] and [BluetoothCharacteristic]. Manages GATT
/// read/write/subscribe operations and connection-state tracking.
library web.bluetooth_web_hardware;

import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_web_bluetooth/flutter_web_bluetooth.dart';
import 'package:rxdart/rxdart.dart';

import '../core/exceptions.dart';
import '../core/hardware/hardware.dart';
import '../core/message/message.dart';
import '../util/logger.dart';

/// [Hardware] backed by the browser's Web Bluetooth API.
class BluetoothWebHardware extends Hardware {
  factory BluetoothWebHardware.build({
    required BluetoothDevice device,
    required Map<Endpoint, BluetoothCharacteristic> endpoints,
  }) =>
      BluetoothWebHardware._(device: device, endpoints: endpoints).._listen();

  BluetoothWebHardware._({
    required BluetoothDevice device,
    required Map<Endpoint, BluetoothCharacteristic> endpoints,
  })  : _device = device,
        _endpoints = endpoints,
        name = device.name ?? '',
        id = device.id,
        _connected$ = BehaviorSubject.seeded(true);

  final BluetoothDevice _device;
  final Map<Endpoint, BluetoothCharacteristic> _endpoints;

  final Map<Endpoint, StreamSubscription> _charNotifySubscriptions = {};

  final PublishSubject<HardwareEvent> _events$ = PublishSubject();

  final BehaviorSubject<bool> _connected$;
  StreamSubscription<bool>? _connectedSubscription;

  @override
  final String name;

  @override
  final String id;

  @override
  bool get connected => _connected$.value;

  @override
  Stream<bool> get connected$ => _connected$;

  @override
  List<Endpoint> get endpoints => _endpoints.keys.toList();

  @override
  Stream<HardwareEvent> get events$ => _events$.stream;

  void _listen() {
    _connectedSubscription = _device.connected.listen((connected) {
      if (connected != _connected$.value) {
        _connected$.add(connected);
      }
    });
  }

  @override
  Future<void> disconnect() async {
    _device.disconnect();
    _connected$.add(false);
    await _connectedSubscription?.cancel();
    for (final subscription in _charNotifySubscriptions.values) {
      subscription.cancel();
    }
    _charNotifySubscriptions.clear();
  }

  @override
  Future<void> writeValue({required HardwareWriteCmd cmd}) async {
    logger.d(
        'Writing to endpoint ($name): ${cmd.endpoint}, ${_formatBytes(cmd.data)}');
    final BluetoothCharacteristic characteristic =
        _requireCharacteristic(cmd.endpoint);
    try {
      if (cmd.writeWithResponse) {
        await characteristic.writeValueWithResponse(cmd.data);
      } else {
        await characteristic.writeValueWithoutResponse(cmd.data);
      }
    } catch (e) {
      throw RemoteToyDeviceException(
        code: RemoteToyDeviceException.codeDeviceSpecificError,
        message:
            'BluetoothWebHardware write value ($name) => ${parseOperationErrorMessage(e)}',
        details: {
          'endpoint': cmd.endpoint,
        },
      );
    }
  }

  String _formatBytes(Uint8List data) {
    return data.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ');
  }

  @override
  Future<({Endpoint endpoint, Uint8List data})> readValue({
    required HardwareReadCmd cmd,
  }) async {
    logger.d('Reading from endpoint ($name): ${cmd.endpoint}');
    final BluetoothCharacteristic characteristic =
        _requireCharacteristic(cmd.endpoint);
    try {
      final ByteData readValue = await characteristic.readValue();
      return (endpoint: cmd.endpoint, data: readValue.buffer.asUint8List());
    } catch (e) {
      throw RemoteToyDeviceException(
        code: RemoteToyDeviceException.codeDeviceSpecificError,
        message:
            'BluetoothWebHardware read value ($name) => ${parseOperationErrorMessage(e)}',
        details: {
          'endpoint': cmd.endpoint,
        },
      );
    }
  }

  @override
  Future<void> subscribe({required HardwareSubscribeCmd cmd}) {
    logger.d('Subscribing to endpoint ($name): ${cmd.endpoint}');
    final BluetoothCharacteristic characteristic =
        _requireCharacteristic(cmd.endpoint);
    // Cancel any existing subscription on this endpoint before re-subscribing
    final existSubscription = _charNotifySubscriptions[cmd.endpoint];
    if (existSubscription != null) {
      existSubscription.cancel();
    }
    // Attach listener before startNotifications to avoid missing early events
    _charNotifySubscriptions[cmd.endpoint] =
        characteristic.value.listen((data) {
      _events$.add(NotificationHardwareEvent(
        id: id,
        endpoint: cmd.endpoint,
        data: data.buffer.asUint8List(),
      ));
    });
    try {
      return characteristic.startNotifications();
    } catch (e) {
      throw RemoteToyDeviceException(
        code: RemoteToyDeviceException.codeDeviceSpecificError,
        message:
            'BluetoothWebHardware subscribe value ($name) => ${parseOperationErrorMessage(e)}',
        details: {
          'endpoint': cmd.endpoint,
        },
      );
    }
  }

  @override
  Future<void> unsubscribe({required HardwareUnsubscribeCmd cmd}) async {
    logger.d('Unsubscribing to endpoint ($name): ${cmd.endpoint}');
    final existSubscription = _charNotifySubscriptions[cmd.endpoint];
    if (existSubscription != null) {
      existSubscription.cancel();
    }

    final BluetoothCharacteristic characteristic =
        _requireCharacteristic(cmd.endpoint);
    try {
      return characteristic.stopNotifications();
    } catch (e) {
      throw RemoteToyDeviceException(
        code: RemoteToyDeviceException.codeDeviceSpecificError,
        message:
            'BluetoothWebHardware unsubscribe value ($name) => ${parseOperationErrorMessage(e)}',
        details: {
          'endpoint': cmd.endpoint,
        },
      );
    }
  }

  BluetoothCharacteristic _requireCharacteristic(Endpoint endpoint) {
    final BluetoothCharacteristic? characteristic = _endpoints[endpoint];
    if (characteristic == null) {
      throw RemoteToyDeviceException(
        code: RemoteToyDeviceException.codeInvalidEndpoint,
        message:
            'Cannot find characteristic uuid by endpoint ($name): ${endpoint.name}',
        details: {
          'endpoints': _endpoints,
        },
      );
    }
    return characteristic;
  }

  /// Maps Web Bluetooth JS errors to human-readable messages.
  String? parseOperationErrorMessage(dynamic e) {
    if (e is NotSupportedError) {
      return 'Operation not supported';
    } else if (e is SecurityError) {
      return 'Characteristic is blocked';
    } else if (e is TimeoutException) {
      return 'Operation is timed out';
    } else if (e is NetworkError) {
      return 'Device disconnected or communication error';
    } else {
      return 'BLE internal error';
    }
  }
}
