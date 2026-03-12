/// Base implementation for the Lovense protocol, including the protocol identifier,
/// initializer, and core protocol handlers.
///
/// Reference: Buttplug Rust implementation (buttplug_server/src/device/protocol_impl/lovense/mod.rs)
library core.protocol.lovense.lovense;

import 'dart:async';
import 'dart:convert';

import '../../../configuration/configuration.dart';
import '../../../util/logger.dart';
import '../../hardware/hardware.dart';
import '../../message/message.dart';
import '../protocol.dart';

/// Lovense protocol handlers
import 'lovense_stroker.dart';
import 'lovense_single_actuator.dart';
import 'lovense_multi_actuator.dart';
import 'lovense_dual_actuator.dart';
import 'lovense_rotate_vibrator.dart';
import 'lovense_max.dart';

export 'lovense_base.dart';
export 'lovense_stroker.dart';
export 'lovense_single_actuator.dart';
export 'lovense_multi_actuator.dart';
export 'lovense_dual_actuator.dart';
export 'lovense_rotate_vibrator.dart';
export 'lovense_max.dart';

/// Determines the model identifier from the DeviceType response.
/// This device model resolver appears to be unique to Lovense devices;
/// other brands do not seem to require similar logic.
String _lovenseModelResolver(String typeResponse) {
  final List<String> parts = typeResponse.split(':');
  if (parts.length < 2) {
    logger.w('Lovense Device returned invalid DeviceType info: $typeResponse');
    return 'lovense';
  }
  final String identifier = parts[0];
  final int version = int.tryParse(parts[1]) ?? 0;

  logger.d('Identified device type $identifier version $version');

  // Flexer: version must be 3+ to control actuators separately
  if (identifier == 'EI' && version >= 3) {
    return 'EI-FW3';
  }
  return identifier;
}

/// Factory for creating Lovense identifier instances.
/// This factory is used to create a new instance of the Lovense identifier.
/// It implements the [ProtocolIdentifierFactory] interface.
class LovenseIdentifierFactory implements ProtocolIdentifierFactory {
  @override
  String identifier() => 'lovense';

  @override
  ProtocolIdentifier create() => LovenseIdentifier();
}

/// Lovense identifier implementation.
/// This identifier is used to identify the Lovense device.
/// It implements the [ProtocolIdentifier] interface.
class LovenseIdentifier implements ProtocolIdentifier {
  @override
  Future<
      ({
        ProtocolName protocolName,
        String? modelIdentifier,
        ProtocolInitializer initializer,
      })> identify({
    required Hardware hardware,
  }) async {
    try {
      // Read DeviceType
      final Completer<HardwareEvent> completer = Completer();
      await hardware.subscribe(
          cmd: const HardwareSubscribeCmd(endpoint: Endpoint.rx));
      final listener = hardware.events$.listen(
        (event) {
          if (completer.isCompleted) {
            return;
          }
          completer.complete(event);
        },
      );

      /// Keep live strategy
      /// For Lovense, we'll just repeat the device type packet and drop the result.
      await hardware.writeValue(
        cmd: HardwareWriteCmd(
          endpoint: Endpoint.tx,
          data: utf8.encode('DeviceType;'),
          writeWithResponse: false,
        ),
      );

      /// Wait for hardware event to complete and parse the result
      final HardwareEvent event =
          await completer.future.timeout(const Duration(seconds: 2));
      listener.cancel();
      if (event is NotificationHardwareEvent) {
        /// Correctly read DeviceType, find model identifier
        final String typeResponse = utf8.decode(event.data);
        final String ident = _lovenseModelResolver(typeResponse);
        return (
          protocolName: 'lovense',
          modelIdentifier: ident,
          initializer: LovenseInitializer(deviceType: ident),
        );
      }
    } catch (e) {
      /// Failed to read DeviceType, but can parse model identifier from hardware name
      final regex = RegExp(r'LVS-([A-Z]+)\d+');
      final match = regex.firstMatch(hardware.name);
      if (match != null && match.groupCount > 0) {
        return (
          protocolName: 'lovense',
          modelIdentifier: match.group(1),
          initializer: LovenseInitializer(deviceType: match.group(1)!),
        );
      }
    }

    /// Failed to read model identifier, use default device type
    return (
      protocolName: 'lovense',
      modelIdentifier: null,
      initializer: const LovenseInitializer(deviceType: 'lovense'),
    );
  }
}

/// Lovense initializer implementation.
/// This initializer is used to initialize the Lovense device.
/// It implements the [ProtocolInitializer] interface.
class LovenseInitializer implements ProtocolInitializer {
  const LovenseInitializer({required this.deviceType});

  final String deviceType;

  @override
  Future<ProtocolHandler> initialize({
    required Hardware hardware,
    required ProtocolAttributes protocolAttributes,
  }) async {
    final vibratorCount = (protocolAttributes.features ?? [])
        .where((e) => [FeatureType.vibrate, FeatureType.oscillate]
            .contains(e.featureType))
        .length;
    final outputCount = (protocolAttributes.features ?? [])
        .where((e) => e.containsOutput)
        .length;

    /// If the device is rotate vibrator
    /// It has 2 outputs, 1 vibrator and 1 rotate
    final bool isRotateVibrator = outputCount == 2 &&
        protocolAttributes.features
                ?.where((e) => e.featureType == FeatureType.vibrate)
                .length ==
            1 &&
        protocolAttributes.features
                ?.where((e) => e.featureType == FeatureType.rotate)
                .length ==
            1;

    /// If the device is Lovense Max
    /// It has 2 outputs, 1 vibrator and 1 constrict
    final bool isLovenseMax = outputCount == 2 &&
        protocolAttributes.features
                ?.where((e) => e.featureType == FeatureType.vibrate)
                .length ==
            1 &&
        protocolAttributes.features
                ?.where((e) => e.featureType == FeatureType.constrict)
                .length ==
            1;

    /// This might need better tuning if other complex Lovenses are released
    /// Currently this only applies to the Flexer/Lapis/Solace
    final bool useMply = (vibratorCount == 2 && outputCount > 2) ||
        vibratorCount > 2 ||
        deviceType == "H";

    logger.d(
        "Device type $deviceType initialized with $vibratorCount vibrators, $outputCount outputs, ${useMply ? '' : 'not '}using Mply");

    if (deviceType == 'H' || deviceType == 'BA') {
      return LovenseStroker(
        hardware: hardware,
        needRangeZerod: deviceType == 'H',
      );
    } else if (outputCount == 1) {
      return LovenseSingleActuator();
    } else if (isLovenseMax) {
      return LovenseMax();
    } else if (isRotateVibrator) {
      return LovenseRotateVibrator();
    } else if (useMply) {
      return LovenseMultiActuator(
        outputCount: outputCount,
      );
    } else {
      return LovenseDualActuator();
    }
  }
}
