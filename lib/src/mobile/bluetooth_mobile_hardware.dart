/// Mobile (iOS/Android) [Hardware] implementation.
///
/// Bridges the [Hardware] abstraction to Flutter Blue Plus's
/// [BluetoothDevice] and [BluetoothCharacteristic]. Manages GATT
/// read/write/subscribe operations and connection-state tracking.
library mobile.bluetooth_mobile_hardware;

import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../core/exceptions.dart';
import '../core/hardware/hardware.dart';
import '../core/message/endpoint.dart';
import '../util/logger.dart';
import '../util/value_stream_controller.dart';

/// [Hardware] backed by Flutter Blue Plus for native iOS/Android BLE.
class BluetoothMobileHardware extends Hardware {
  factory BluetoothMobileHardware.build({
    required BluetoothDevice device,
    required Map<Endpoint, BluetoothCharacteristic> endpoints,
  }) =>
      BluetoothMobileHardware._(
        device: device,
        endpoints: endpoints,
      ).._listen();

  BluetoothMobileHardware._({
    required BluetoothDevice device,
    required Map<Endpoint, BluetoothCharacteristic> endpoints,
  })  : _device = device,
        _endpoints = endpoints,
        name = device.advName,
        id = device.remoteId.str,
        _connected$ = ValueStreamController(true);

  final BluetoothDevice _device;
  final Map<Endpoint, BluetoothCharacteristic> _endpoints;

  final Map<Endpoint, StreamSubscription<List<int>>> _charNotifySubscriptions =
      {};
  final StreamController<HardwareEvent> _events$ = StreamController.broadcast();

  StreamSubscription<BluetoothConnectionState>? _connectionSubscription;
  final ValueStreamController<bool> _connected$;

  @override
  final String name;

  @override
  final String id;

  @override
  bool get connected => _connected$.value;

  @override
  Stream<bool> get connected$ => _connected$.stream;

  @override
  List<Endpoint> get endpoints => _endpoints.keys.toList();

  @override
  Stream<HardwareEvent> get events$ => _events$.stream;

  void _listen() {
    _connectionSubscription = _device.connectionState.listen((state) {
      final bool connected = state == BluetoothConnectionState.connected;
      if (connected != _connected$.value) {
        _connected$.add(connected);
      }
    });
  }

  @override
  Future<void> disconnect() async {
    await _device.disconnect();
    _connected$.add(false);
    await _connectionSubscription?.cancel();
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
      await characteristic.write(cmd.data,
          withoutResponse: !cmd.writeWithResponse);
    } catch (e) {
      throw RemoteToyDeviceException(
        code: RemoteToyDeviceException.codeDeviceSpecificError,
        message: 'BluetoothWebHardware write value error ($name): $e',
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
  Future<({Uint8List data, Endpoint endpoint})> readValue({
    required HardwareReadCmd cmd,
  }) async {
    logger.d('Reading from endpoint ($name): ${cmd.endpoint}');
    final BluetoothCharacteristic characteristic =
        _requireCharacteristic(cmd.endpoint);
    try {
      final List<int> readValue = await characteristic.read();
      return (endpoint: cmd.endpoint, data: Uint8List.fromList(readValue));
    } catch (e) {
      throw RemoteToyDeviceException(
        code: RemoteToyDeviceException.codeDeviceSpecificError,
        message: 'BluetoothWebHardware read value error ($name): $e',
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
    final existSubscription = _charNotifySubscriptions[cmd.endpoint];
    if (existSubscription != null) {
      existSubscription.cancel();
    }
    _charNotifySubscriptions[cmd.endpoint] =
        characteristic.onValueReceived.listen((data) {
      _events$.add(NotificationHardwareEvent(
        id: id,
        endpoint: cmd.endpoint,
        data: Uint8List.fromList(data),
      ));
    });
    try {
      return characteristic.setNotifyValue(true);
    } catch (e) {
      throw RemoteToyDeviceException(
        code: RemoteToyDeviceException.codeDeviceSpecificError,
        message: 'BluetoothWebHardware subscribe value error ($name): $e',
        details: {
          'endpoint': cmd.endpoint,
        },
      );
    }
  }

  @override
  Future<void> unsubscribe({required HardwareUnsubscribeCmd cmd}) {
    logger.d('Unsubscribing to endpoint ($name): ${cmd.endpoint}');
    final existSubscription = _charNotifySubscriptions[cmd.endpoint];
    if (existSubscription != null) {
      existSubscription.cancel();
    }

    final BluetoothCharacteristic characteristic =
        _requireCharacteristic(cmd.endpoint);
    try {
      return characteristic.setNotifyValue(false);
    } catch (e) {
      throw RemoteToyDeviceException(
        code: RemoteToyDeviceException.codeDeviceSpecificError,
        message: 'BluetoothWebHardware unsubscribe value error ($name): $e',
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
}
