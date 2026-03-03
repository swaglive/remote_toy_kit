/// Web Bluetooth device-scanning task.
///
/// Opens the browser's device-picker dialog, matches the selected device
/// against known protocol specifiers, and returns the device together
/// with its [BluetoothLESpecifier] and [ProtocolIdentifier].
library web.task.search_toy_web_task;

import 'package:flutter_web_bluetooth/flutter_web_bluetooth.dart';
import 'package:flutter_web_bluetooth/js_web_bluetooth.dart';

import '../../configuration/configuration.dart';
import '../../core/exceptions.dart';
import '../../core/protocol/protocol.dart';
import '../../util/logger.dart';

/// Scans for a remote-toy device via the Web Bluetooth picker dialog.
///
/// - Throws [RemoteToyBluetoothException] on BLE scanning errors.
/// - Throws [RemoteToyDeviceException] if the selected device is unsupported.
class SearchToyWebTask {
  const SearchToyWebTask({
    required this.config,
    required this.protocols,
  });

  final DeviceConfiguration config;
  final Map<String, ProtocolIdentifierFactory> protocols;

  Future<
      ({
        BluetoothDevice device,
        BluetoothLESpecifier specifier,
        ProtocolIdentifier protocolIdentifier
      })> call() async {
    if (!FlutterWebBluetooth.instance.isBluetoothApiSupported) {
      throw RemoteToyBluetoothException(
        code: RemoteToyBluetoothException.codeBluetoothNotSupported,
        message: 'This browser does not support BLE api',
      );
    }

    // Build request filters from all known protocol specifiers so the
    // browser picker only shows supported devices
    final List<RequestFilterBuilder> filters = [];
    final List<String> services = [];
    final Map<ProtocolName, BluetoothLESpecifier> specifiers =
        config.specifiers;

    // Add filters for each specifier's names and services
    for (final specifier in specifiers.values) {
      for (final String name in specifier.names) {
        final RequestFilterBuilder filter;
        // Wildcard names (e.g. "LVS-*") are treated as name prefixes
        if (name.contains('*')) {
          final String namePrefix = name.substring(0, name.length - 1);
          filter = RequestFilterBuilder(namePrefix: namePrefix);
        } else {
          filter = RequestFilterBuilder(name: name);
        }
        filters.add(filter);
      }
      for (final String service in specifier.services.keys) {
        services.add(service);
      }
    }

    final RequestOptionsBuilder options = RequestOptionsBuilder(
      filters,
      optionalServices: services,
    );

    try {
      final BluetoothDevice device =
          await FlutterWebBluetooth.instance.requestDevice(options);

      // Match the selected device to a known specifier using
      // BluetoothLESpecifier equality (name-based matching)
      final searchedDeviceSpecifier = BluetoothLESpecifier.fromDevice(
        name: device.name ?? '',
        manufactureData: {},
        advertisedServices: [],
      );
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

      // If no matching protocol or specifier is found, throw an exception
      if (targetProtocolIdentifierFactory == null || targetSpecifier == null) {
        throw RemoteToyDeviceException(
          code: RemoteToyDeviceException.codeDeviceNotSupported,
          message: 'Remote toy device not supported',
          details: {
            'name': device.name,
            'address': device.id,
          },
        );
      }

      return (
        device: device,
        specifier: targetSpecifier,
        protocolIdentifier: targetProtocolIdentifierFactory.create(),
      );
    } on UserCancelledDialogError catch (e) {
      logger.w('User cancelled web search dialog', ex: e);
      throw RemoteToyBluetoothException(
        code: RemoteToyBluetoothException.codeCancelSearch,
        message: 'User cancelled web search dialog',
      );
    }
  }
}
