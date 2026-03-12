/// Mobile BLE connection task that produces a fully-initialized
/// [RemoteToyDevice].
///
/// Connects via Flutter Blue Plus, discovers GATT services/characteristics,
/// identifies the device model via [ProtocolIdentifier], resolves the
/// feature set, and wires up the [ProtocolHandler].
library mobile.task.connect_toy_mobile_task;

import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../../configuration/configuration.dart';
import '../../core/exceptions.dart';
import '../../core/hardware/hardware.dart';
import '../../core/message/message.dart';
import '../../core/protocol/protocol.dart';
import '../../remote_toy_device.dart';
import '../../util/logger.dart';
import '../bluetooth_mobile_hardware.dart';

/// Connects to a BLE device on iOS/Android and returns a [RemoteToyDevice].
///
/// - Throws [RemoteToyBluetoothException] on BLE connection errors.
/// - Throws [RemoteToyDeviceException] on device model identification errors.
class ConnectToyMobileTask {
  const ConnectToyMobileTask({
    required this.deviceConfiguration,
    required this.device,
    required this.specifier,
    required this.protocolIdentifier,
  });

  final DeviceConfiguration deviceConfiguration;
  final BluetoothDevice device;
  final BluetoothLESpecifier specifier;
  final ProtocolIdentifier protocolIdentifier;

  Future<RemoteToyDevice> call() async {
    logger.d('RemoteToyDevice start connecting (${device.advName})');
    try {
      await device.connect();
      await device.discoverServices();
      if (Platform.isAndroid && device.servicesList.isEmpty) {
        // Workaround: some Android devices return an empty service list
        // until the GATT cache is cleared and services are re-discovered
        await device.clearGattCache();
        await device.discoverServices();
      }
    } catch (e) {
      throw RemoteToyBluetoothException(
        code: RemoteToyBluetoothException.codeBluetoothInternalError,
        message: 'Cannot establish BLE connection (${device.advName}): $e',
      );
    }

    // Map each protocol-defined endpoint to its discovered characteristic
    final Map<Endpoint, BluetoothCharacteristic> endpoints = {};
    for (final protoEntry in specifier.services.entries) {
      final protoServiceUuid = protoEntry.key;
      final protoService = protoEntry.value;
      for (final BluetoothService service in device.servicesList) {
        if (service.uuid.str128 != protoServiceUuid) continue;
        for (final protoCharEntry in protoService.entries) {
          final charName = protoCharEntry.key;
          final charUuid = protoCharEntry.value;
          final characteristic = service.characteristics
              .where((e) => e.uuid.str128 == charUuid)
              .firstOrNull;
          if (characteristic != null) {
            endpoints[charName] = characteristic;
          }
        }
      }
    }

    logger.d('RemoteToyDevice BLE services discovered (${device.advName})');

    // Build the hardware abstraction over the discovered characteristics
    final Hardware hardware = BluetoothMobileHardware.build(
      device: device,
      endpoints: endpoints,
    );

    // Identify the device model and obtain a protocol initializer
    final (
      :ProtocolName protocolName,
      :String? modelIdentifier,
      :ProtocolInitializer initializer
    ) = await protocolIdentifier.identify(hardware: hardware);
    logger.d(
        'Protocol identified (${device.advName}) name: $protocolName, model: $modelIdentifier');

    // Look up the device's feature set from configuration
    final ProtocolAttributes? protocolAttributes =
        deviceConfiguration.findProtocolAttributes(
      protocolName: protocolName,
      modelIdentifier: modelIdentifier,
    );

    if (protocolAttributes == null) {
      throw RemoteToyDeviceException(
        code: RemoteToyDeviceException.codeDeviceNotSupported,
        message:
            'Cannot find corresponding Feature Set (${device.advName}), protocol: $protocolName, model: $modelIdentifier',
      );
    }

    // Initialize the protocol handler with the resolved attributes
    final ProtocolHandler protocolHandler = await initializer.initialize(
      hardware: hardware,
      protocolAttributes: protocolAttributes,
    );

    return RemoteToyDevice.build(
      hardware: hardware,
      protocolHandler: protocolHandler,
      protocolAttributes: protocolAttributes,
    );
  }
}
