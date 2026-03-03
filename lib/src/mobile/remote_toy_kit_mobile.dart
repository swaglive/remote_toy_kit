/// Mobile (iOS/Android) implementation of the [RemoteToyKit] SDK.
///
/// Uses Flutter Blue Plus to scan for and connect to BLE remote-toy
/// devices. Initialization is guarded by a [Lock] to prevent
/// duplicate loading of configs.
library mobile.remote_toy_kit_mobile;

import 'package:rxdart/rxdart.dart';
import 'package:synchronized/synchronized.dart';

import '../../remote_toy_kit.dart';
import '../core/protocol/protocol.dart';
import 'remote_toy_device_mobile_connector.dart';
import 'task/search_toy_mobile_task.dart';

/// Native mobile [RemoteToyKit] implementation backed by Flutter Blue Plus.
class RemoteToyKitMobile implements RemoteToyKit {
  final Lock _initializedLock = Lock();
  bool _initialized = false;
  Map<String, ProtocolIdentifierFactory>? _protocolIdentifierFactories;
  DeviceConfiguration? _deviceConfiguration;

  bool _isSearching = false;

  final DeviceConfigVersion deviceConfigVersion;
  RemoteToyKitMobile({required this.deviceConfigVersion});

  @override
  Future<void> initialize() => _initializedLock.synchronized(() async {
        if (_initialized) return;
        _protocolIdentifierFactories = loadProtocolIdentifierFactories();
        _deviceConfiguration = await loadDeviceConfiguration(
            deviceConfigVersion: deviceConfigVersion);
        _initialized = true;
      });

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
    return task().doOnDone(() {
      _isSearching = false;
    }).map((result) {
      // Wrap each discovered device with a mobile-specific connector
      final connector = RemoteToyDeviceMobileConnector(
        deviceConfiguration: deviceConfiguration,
        device: result.device,
        specifier: result.specifier,
        protocolIdentifier: result.protocolIdentifier,
        isSpecV4: deviceConfigVersion == DeviceConfigVersion.v4,
      );
      return RemoteToySearchedDevice(
        name: result.device.advName,
        address: result.device.remoteId.str,
        connector: connector,
      );
    });
  }
}
