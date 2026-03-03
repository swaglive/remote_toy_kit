/// Web Browser implementation of the [RemoteToyKit] SDK.
///
/// Uses the Web Bluetooth API to scan for and connect to BLE
/// remote-toy devices. Initialization is guarded by a [Lock] to
/// prevent duplicate loading of configs.
library web.remote_toy_kit_web;

import 'package:flutter_web_bluetooth/flutter_web_bluetooth.dart';
import 'package:synchronized/synchronized.dart';

import '../../remote_toy_kit.dart';
import '../core/protocol/protocol.dart';
import 'remote_toy_device_web_connector.dart';
import 'task/search_toy_web_task.dart';

/// Browser-side [RemoteToyKit] implementation backed by Web Bluetooth.
class RemoteToyKitWeb implements RemoteToyKit {
  final Lock _initializeLock = Lock();
  bool _initialized = false;
  Map<String, ProtocolIdentifierFactory>? _protocolIdentifierFactories;
  DeviceConfiguration? _deviceConfiguration;

  bool _isSearching = false;

  final DeviceConfigVersion deviceConfigVersion;
  RemoteToyKitWeb({required this.deviceConfigVersion});

  @override
  Future<void> initialize() => _initializeLock.synchronized<void>(() async {
        if (_initialized) return;
        // Load vendor-specific protocol identifier factories
        _protocolIdentifierFactories = loadProtocolIdentifierFactories();
        // Load device configurations (feature sets, specifiers, etc.)
        _deviceConfiguration = await loadDeviceConfiguration(
            deviceConfigVersion: deviceConfigVersion);
        _initialized = true;
      });

  @override
  bool get isSearchInProgress => _isSearching;

  @override
  Stream<RemoteToySearchedDevice> search() async* {
    // Prevent concurrent scans
    if (_isSearching) {
      throw RemoteToyBluetoothException(
        code: RemoteToyBluetoothException.codeSearchInProgress,
        message: 'Search is in progress',
      );
    }
    _isSearching = true;
    try {
      final DeviceConfiguration? deviceConfiguration = _deviceConfiguration;
      final protocolIdentifierFactories = _protocolIdentifierFactories;
      if (deviceConfiguration == null || protocolIdentifierFactories == null) {
        throw RemoteToyBluetoothException(
          code: RemoteToyBluetoothException.codeNotInitialized,
          message:
              'DeviceConfiguration or ProtocolIdentifierFactories not found, please call initialize() before searching device',
          details: {
            'hasDeviceConfiguration': deviceConfiguration != null,
            'hasProtocolIdentifierFactories':
                protocolIdentifierFactories != null,
          },
        );
      }
      // Start searching
      final (
        :BluetoothDevice device,
        :BluetoothLESpecifier specifier,
        :ProtocolIdentifier protocolIdentifier,
      ) = await SearchToyWebTask(
        config: deviceConfiguration,
        protocols: protocolIdentifierFactories,
      ).call();
      // Wrap the discovered device with a web-specific connector
      final connector = RemoteToyDeviceWebConnector(
        deviceConfiguration: deviceConfiguration,
        device: device,
        specifier: specifier,
        protocolIdentifier: protocolIdentifier,
        isSpecV4: deviceConfigVersion == DeviceConfigVersion.v4,
      );
      _isSearching = false;
      yield RemoteToySearchedDevice(
        name: device.name ?? '',
        address: device.id,
        connector: connector,
      );
    } catch (e) {
      rethrow;
    } finally {
      _isSearching = false;
    }
  }
}
