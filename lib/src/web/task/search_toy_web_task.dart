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
        ProtocolIdentifier protocolIdentifier,
        ProtocolName protocolName,
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

    // Reverse mapping: tracks which protocols added manufacturer-data-only
    // filters so we can fall back to them when name matching fails.
    final List<(ProtocolName, BluetoothLESpecifier)> manufacturerDataProtocols =
        [];

    for (final entry in specifiers.entries) {
      final ProtocolName protocolName = entry.key;
      final BluetoothLESpecifier specifier = entry.value;

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

      // Add manufacturer data filters so devices that don't prominently
      // advertise a name can still appear in the browser picker.
      for (final mfgData in specifier.manufacturerData) {
        filters.add(RequestFilterBuilder(
          manufacturerData: [
            ManufacturerDataFilterBuilder(
              companyIdentifier: mfgData.company,
              dataPrefix: mfgData.data,
            ),
          ],
        ));
      }
      if (specifier.manufacturerData.isNotEmpty) {
        manufacturerDataProtocols.add((protocolName, specifier));
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

      final String deviceName = device.name ?? '';

      // First, try name-based matching (works when the device advertises a
      // recognisable name).
      final searchedDeviceSpecifier = BluetoothLESpecifier.fromDevice(
        name: deviceName,
        manufactureData: {},
        advertisedServices: [],
      );
      ProtocolIdentifierFactory? targetProtocolIdentifierFactory;
      BluetoothLESpecifier? targetSpecifier;
      ProtocolName? targetProtocolName;
      for (final entry in specifiers.entries) {
        final ProtocolName protocolName = entry.key;
        final BluetoothLESpecifier specifier = entry.value;
        if (specifier == searchedDeviceSpecifier) {
          targetProtocolIdentifierFactory = protocols[protocolName];
          targetSpecifier = specifier;
          targetProtocolName = protocolName;
          break;
        }
      }

      // Fallback: if name matching failed, the device was likely discovered
      // via a manufacturer data filter. Since the browser already narrowed the
      // list to our filters, pick the first protocol whose manufacturer data
      // filter could have matched.
      if (targetProtocolIdentifierFactory == null) {
        for (final (protocolName, specifier) in manufacturerDataProtocols) {
          final factory = protocols[protocolName];
          if (factory != null) {
            targetProtocolIdentifierFactory = factory;
            targetSpecifier = specifier;
            targetProtocolName = protocolName;
            logger.i(
              'Web search: name matching failed for "$deviceName", '
              'falling back to manufacturer-data protocol "$protocolName"',
            );
            break;
          }
        }
      }

      // If no matching protocol or specifier is found, throw an exception
      if (targetProtocolIdentifierFactory == null ||
          targetSpecifier == null ||
          targetProtocolName == null) {
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
        protocolName: targetProtocolName,
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
