/// Mobile (iOS/Android) implementation of the [RemoteToyKit] SDK.
///
/// Uses Flutter Blue Plus to scan for and connect to BLE remote-toy
/// devices. Initialization uses future-caching to prevent
/// duplicate loading of configs.
library mobile.remote_toy_kit_mobile;

import '../../remote_toy_kit.dart';
import '../core/protocol/protocol.dart';
import 'remote_toy_device_mobile_connector.dart';
import 'task/search_toy_mobile_task.dart';

/// Native mobile [RemoteToyKit] implementation backed by Flutter Blue Plus.
class RemoteToyKitMobile implements RemoteToyKit {
  Future<void>? _initFuture;
  Map<String, ProtocolIdentifierFactory>? _protocolIdentifierFactories;
  DeviceConfiguration? _deviceConfiguration;

  bool _isSearching = false;

  final DeviceConfigVersion deviceConfigVersion;
  RemoteToyKitMobile({required this.deviceConfigVersion});

  /// Lazily runs [_doInitialize] once. The `??=` operator caches the returned
  /// [Future] on first call, so subsequent calls return the same future
  /// without re-executing the body. This is safe in Dart's single-threaded
  /// event loop where `??=` is evaluated synchronously before any `await`.
  @override
  Future<void> initialize() => _initFuture ??= _doInitialize();

  Future<void> _doInitialize() async {
    _protocolIdentifierFactories = loadProtocolIdentifierFactories();
    _deviceConfiguration =
        await loadDeviceConfiguration(deviceConfigVersion: deviceConfigVersion);
  }

  @override
  bool get isSearchInProgress => _isSearching;

  @override
  Stream<RemoteToySearchedDevice> search() {
    // Prevent concurrent scans
    if (_isSearching) {
      throw RemoteToyBluetoothException(
        code: RemoteToyBluetoothException.codeSearchInProgress,
        message: 'Search is in progress',
      );
    }
    _isSearching = true;
    final DeviceConfiguration? deviceConfiguration = _deviceConfiguration;
    final protocolIdentifierFactories = _protocolIdentifierFactories;
    if (deviceConfiguration == null || protocolIdentifierFactories == null) {
      throw RemoteToyBluetoothException(
        code: RemoteToyBluetoothException.codeNotInitialized,
        message:
            'DeviceConfiguration or ProtocolIdentifierFactories not found, please call initialize() before searching device',
        details: {
          'hasDeviceConfiguration': deviceConfiguration != null,
          'hasProtocolIdentifierFactories': protocolIdentifierFactories != null,
        },
      );
    }
    // Start searching
    final task = SearchToyMobileTask(
      config: deviceConfiguration,
      protocols: protocolIdentifierFactories,
    );
    return _searchAndMap(task, deviceConfiguration);
  }

  Stream<RemoteToySearchedDevice> _searchAndMap(
    SearchToyMobileTask task,
    DeviceConfiguration deviceConfiguration,
  ) async* {
    try {
      await for (final result in task()) {
        final connector = RemoteToyDeviceMobileConnector(
          deviceConfiguration: deviceConfiguration,
          device: result.device,
          specifier: result.specifier,
          protocolIdentifier: result.protocolIdentifier,
          isSpecV4: deviceConfigVersion == DeviceConfigVersion.v4,
        );
        String name = result.device.advName;
        if (name.isEmpty) {
          name = deviceConfiguration
                  .findProtocolDefinition(result.protocolName)
                  ?.defaults
                  .name ??
              '';
        }
        yield RemoteToySearchedDevice(
          name: name,
          address: result.device.remoteId.str,
          connector: connector,
        );
      }
    } finally {
      _isSearching = false;
    }
  }
}
