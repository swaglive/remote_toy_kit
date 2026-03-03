/// Web Bluetooth connection task that produces a fully-initialized
/// [RemoteToyDevice].
///
/// Performs the full GATT service/characteristic discovery, identifies
/// the device model via [ProtocolIdentifier], resolves the feature set,
/// and wires up the [ProtocolHandler].
library web.task.connect_toy_web_task;

import 'package:flutter_web_bluetooth/flutter_web_bluetooth.dart';
import 'package:flutter_web_bluetooth/js_web_bluetooth.dart';

import '../../configuration/configuration.dart';
import '../../core/exceptions.dart';
import '../../core/hardware/hardware.dart';
import '../../core/message/message.dart';
import '../../core/protocol/protocol.dart';
import '../../remote_toy_device.dart';
import '../../util/logger.dart';
import '../bluetooth_web_hardware.dart';

/// Connects to a BLE device via Web Bluetooth and returns a [RemoteToyDevice].
///
/// - Throws [RemoteToyBluetoothException] on BLE connection errors.
/// - Throws [RemoteToyDeviceException] on device model identification errors.
class ConnectToyWebTask {
  const ConnectToyWebTask({
    required this.deviceConfiguration,
    required this.device,
    required this.specifier,
    required this.protocolIdentifier,
    required this.isSpecV4,
  });

  final DeviceConfiguration deviceConfiguration;
  final BluetoothDevice device;
  final BluetoothLESpecifier specifier;
  final ProtocolIdentifier protocolIdentifier;
  final bool isSpecV4;

  Future<RemoteToyDevice> call() async {
    logger.d('RemoteToyDevice start connecting (${device.name})');
    final NativeBluetoothRemoteGATTServer gatt;
    try {
      await device.connect();
      // ignore: invalid_use_of_visible_for_testing_member
      gatt = device.gatt!;
    } on TypeError catch (_) {
      throw RemoteToyBluetoothException(
        code: RemoteToyBluetoothException.codeBluetoothInternalError,
        message: 'BLE gatt server not found (${device.name})',
      );
    } catch (_) {
      throw RemoteToyBluetoothException(
        code: RemoteToyBluetoothException.codeBluetoothInternalError,
        message: 'Cannot establish BLE connection (${device.name})',
      );
    }

    // Discover GATT services and map each endpoint to its characteristic
    final Map<Endpoint, BluetoothCharacteristic> characteristics = {};
    for (final serviceEntry in specifier.services.entries) {
      // Get BLE GATT service
      final serviceUuid = serviceEntry.key;
      final BluetoothService gattService;
      try {
        gattService =
            BluetoothService(await gatt.getPrimaryService(serviceUuid));
        logger.d(
            'RemoteToy BLE found service (${device.name}) uuid: ${gattService.uuid}');
      } catch (_) {
        continue;
      }

      for (final endpointEntry in serviceEntry.value.entries) {
        // Get BLE GATT Characteristic
        final characteristicEndpoint = endpointEntry.key;
        final characteristicUuid = endpointEntry.value;
        final BluetoothCharacteristic characteristic;
        try {
          characteristic =
              await gattService.getCharacteristic(characteristicUuid);
          logger.d(
              'RemoteToy BLE found characteristic (${device.name}) uuid: ${characteristic.uuid}');
        } catch (_) {
          continue;
        }
        characteristics[characteristicEndpoint] = characteristic;
      }
    }

    logger.d('RemoteToyDevice BLE services discovered (${device.name})');

    // Build the hardware abstraction over the discovered characteristics
    final Hardware hardware = BluetoothWebHardware.build(
      device: device,
      endpoints: characteristics,
    );

    // Identify the device model and obtain a protocol initializer
    final (
      :ProtocolName protocolName,
      :String? modelIdentifier,
      :ProtocolInitializer initializer
    ) = await protocolIdentifier.identify(hardware: hardware);
    logger.d(
        'Protocol identified (${device.name}) name: $protocolName, model: $modelIdentifier');

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
            'Cannot find corresponding Feature Set (${device.name}), protocol: $protocolName, model: $modelIdentifier',
      );
    }

    // Initialize the protocol handler with the resolved attributes
    final ProtocolHandler protocolHandler = initializer.initialize(
      hardware: hardware,
      protocolAttributes: protocolAttributes,
      isSpecV4: isSpecV4,
    );

    return RemoteToyDevice.build(
      hardware: hardware,
      protocolHandler: protocolHandler,
      protocolAttributes: protocolAttributes,
    );
  }
}
