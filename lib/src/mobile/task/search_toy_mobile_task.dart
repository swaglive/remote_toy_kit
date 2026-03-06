/// Mobile BLE device-scanning task.
///
/// Verifies Bluetooth adapter readiness, starts a 5-second BLE scan via
/// Flutter Blue Plus, and yields each discovered supported device as a
/// [MobileScanResult]. Unsupported and already-notified devices are
/// filtered out automatically.
library mobile.task.search_toy_mobile_task;

import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../../configuration/configuration.dart';
import '../../core/exceptions.dart';
import '../../core/protocol/protocol.dart';
import '../../util/logger.dart';

/// Result emitted for each matched device during a mobile BLE scan.
typedef MobileScanResult = ({
  BluetoothDevice device,
  BluetoothLESpecifier specifier,
  ProtocolIdentifier protocolIdentifier,
});

/// Scans for remote-toy devices on iOS/Android via Flutter Blue Plus.
///
/// - Throws [RemoteToyBluetoothException] on BLE scanning or adapter errors.
/// - Throws [RemoteToyDeviceException] if a device is unsupported.
class SearchToyMobileTask {
  const SearchToyMobileTask({
    required this.config,
    required this.protocols,
  });

  final DeviceConfiguration config;
  final Map<String, ProtocolIdentifierFactory> protocols;

  Stream<MobileScanResult> call() async* {
    // 檢查Browser是否支援BLE
    final bool isSupported = await FlutterBluePlus.isSupported;
    if (!isSupported) {
      throw RemoteToyBluetoothException(
        code: RemoteToyBluetoothException.codeBluetoothNotSupported,
        message: 'The device does not support BLE api',
      );
    }

    // Wait for the Bluetooth adapter to settle into a known state (3s timeout)
    final Completer<BluetoothAdapterState> adapterStateCompleter = Completer();
    StreamSubscription? adapterStateSubscriptions;
    adapterStateSubscriptions = FlutterBluePlus.adapterState.listen((state) {
      if (state != BluetoothAdapterState.unknown) {
        if (!adapterStateCompleter.isCompleted) {
          adapterStateCompleter.complete(state);
        }
        adapterStateSubscriptions?.cancel();
      }
    });
    final BluetoothAdapterState adapterState = await adapterStateCompleter
        .future
        .timeout(const Duration(seconds: 3))
        .catchError((e) {
      throw RemoteToyBluetoothException(
        code: RemoteToyBluetoothException.codeBluetoothInternalError,
        message:
            'The device cannot resolve adapter state, reason: ${(e is TimeoutException) ? 'timeout' : '$e'}',
      );
    });
    switch (adapterState) {
      case BluetoothAdapterState.unavailable:
        throw RemoteToyBluetoothException(
          code: RemoteToyBluetoothException.codeBluetoothInternalError,
          message: 'The device has internal BLE error, reason: $adapterState',
        );
      case BluetoothAdapterState.unauthorized:
        throw RemoteToyBluetoothException(
          code: RemoteToyBluetoothException.codeBluetoothPermission,
          message:
              'The device did not allow BLE permission, reason: $adapterState',
        );
      case BluetoothAdapterState.off:
      case BluetoothAdapterState.turningOff:
      case BluetoothAdapterState.turningOn:
        throw RemoteToyBluetoothException(
          code: RemoteToyBluetoothException.codeBluetoothOff,
          message: 'The device BLE is not turned on, reason: $adapterState',
        );
      default:
        break;
    }

    final StreamController<MobileScanResult> onScanned$ =
        StreamController.broadcast();
    // Track devices already emitted or known to be unsupported to avoid duplicates
    final Map<DeviceIdentifier, MobileScanResult> notified = {};
    final Set<DeviceIdentifier> notSupportedDevices = {};
    try {
      final subscription = FlutterBluePlus.onScanResults.listen(
        (results) {
          for (final result in results) {
            final BluetoothDevice device = result.device;
            final DeviceIdentifier id = device.remoteId;
            final String name = device.advName;

            // Skip already-rejected or already-notified devices
            if (notSupportedDevices.contains(id)) continue;
            if (notified.containsKey(id)) continue;

            // Extract manufacturer data and advertised services from the
            // advertisement packet for protocol matching
            final Map<int, Uint8List> manufactureData = result
                .advertisementData.manufacturerData
                .map((key, value) => MapEntry(key, Uint8List.fromList(value)));
            final List<String> services = result.advertisementData.serviceUuids
                .map((e) => e.str128)
                .toList();

            // Match Rust SDK scan filter: require a name or advertised
            // services before attempting specifier matching. Devices with
            // neither are indistinguishable at this stage.
            if (name.isEmpty && services.isEmpty) continue;
            // Match the scanned device to a known specifier via
            // BluetoothLESpecifier equality
            final searchedDeviceSpecifier = BluetoothLESpecifier.fromDevice(
              name: name,
              manufactureData: manufactureData,
              advertisedServices: services,
            );
            final Map<ProtocolName, BluetoothLESpecifier> specifiers =
                config.specifiers;
            ProtocolIdentifierFactory? targetProtocolIdentifierFactory;
            BluetoothLESpecifier? targetSpecifier;
            for (final entry in specifiers.entries) {
              final ProtocolName protocolName = entry.key;
              final BluetoothLESpecifier specifier = entry.value;
              if (specifier == searchedDeviceSpecifier) {
                targetProtocolIdentifierFactory = protocols[protocolName];
                targetSpecifier = specifier;
                break;
              }
            }

            if (targetProtocolIdentifierFactory == null ||
                targetSpecifier == null) {
              notSupportedDevices.add(id);
              continue;
            }

            final MobileScanResult scannedResult = (
              device: device,
              specifier: targetSpecifier,
              protocolIdentifier: targetProtocolIdentifierFactory.create(),
            );

            if (!onScanned$.isClosed) {
              onScanned$.add(scannedResult);
              notified[id] = scannedResult;
            }
          }
        },
      );
      FlutterBluePlus.cancelWhenScanComplete(subscription);

      // Start scanning
      await FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));

      // Close the result stream once scanning finishes
      StreamSubscription<bool>? scanSubscription;
      scanSubscription = FlutterBluePlus.isScanning.listen((scanning) {
        if (!scanning) {
          scanSubscription?.cancel();
          onScanned$.close();
        }
      });
      yield* onScanned$.stream;
    } catch (e) {
      logger.w('Search bluetooth device error', ex: e);
      throw RemoteToyBluetoothException(
        code: RemoteToyBluetoothException.codeSearchError,
        message: 'Search bluetooth device error: $e',
      );
    }
  }
}
