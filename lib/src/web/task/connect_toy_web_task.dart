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
    required this.protocols,
    required this.isSpecV4,
  });

  final DeviceConfiguration deviceConfiguration;
  final BluetoothDevice device;
  final BluetoothLESpecifier specifier;
  final ProtocolIdentifier protocolIdentifier;
  final Map<String, ProtocolIdentifierFactory> protocols;
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

    // Try the primary specifier/protocol first
    final primaryResult =
        await _tryIdentify(gatt, specifier, protocolIdentifier);
    if (primaryResult != null) return primaryResult;

    // Fallback: try all other known specifiers in case the search task
    // picked the wrong protocol (e.g. manufacturer-data ambiguity).
    logger.i(
      'Primary protocol identification failed for ${device.name}, '
      'trying alternative protocols',
    );
    for (final entry in deviceConfiguration.specifiers.entries) {
      final candidateName = entry.key;
      final candidateSpecifier = entry.value;
      if (candidateSpecifier == specifier) continue;
      final factory = protocols[candidateName];
      if (factory == null) continue;

      final result =
          await _tryIdentify(gatt, candidateSpecifier, factory.create());
      if (result != null) return result;
    }

    throw RemoteToyDeviceException(
      code: RemoteToyDeviceException.codeDeviceNotSupported,
      message:
          'Cannot find corresponding Feature Set (${device.name}), no protocol matched',
    );
  }

  /// Attempts GATT service discovery with [candidateSpecifier] and protocol
  /// identification with [candidateIdentifier]. Returns a [RemoteToyDevice]
  /// on success, or `null` if this candidate doesn't match the device.
  Future<RemoteToyDevice?> _tryIdentify(
    NativeBluetoothRemoteGATTServer gatt,
    BluetoothLESpecifier candidateSpecifier,
    ProtocolIdentifier candidateIdentifier,
  ) async {
    final Map<Endpoint, BluetoothCharacteristic> characteristics = {};
    for (final serviceEntry in candidateSpecifier.services.entries) {
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

    if (characteristics.isEmpty) return null;

    logger.d('RemoteToyDevice BLE services discovered (${device.name})');

    final Hardware hardware = BluetoothWebHardware.build(
      device: device,
      endpoints: characteristics,
    );

    final (
      :ProtocolName protocolName,
      :String? modelIdentifier,
      :ProtocolInitializer initializer
    ) = await candidateIdentifier.identify(hardware: hardware);
    logger.d(
        'Protocol identified (${device.name}) name: $protocolName, model: $modelIdentifier');

    final ProtocolAttributes? protocolAttributes =
        deviceConfiguration.findProtocolAttributes(
      protocolName: protocolName,
      modelIdentifier: modelIdentifier,
    );

    if (protocolAttributes == null) return null;

    final ProtocolHandler protocolHandler = await initializer.initialize(
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
