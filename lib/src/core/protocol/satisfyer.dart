/// Satisfyer Protocol Handler
///
/// Reference: Buttplug Rust implementation (buttplug_server/src/device/protocol_impl/satisfyer.rs)
/// Contributor: Victor Doan
library core.protocol.satisfyer;

import 'dart:async';
import 'dart:typed_data';

import '../../configuration/configuration.dart';
import '../../util/logger.dart';
import '../hardware/hardware.dart';
import '../message/message.dart';
import 'protocol.dart';

/// Convert the first 4 bytes of a BLE payload into a big-endian 32-bit integer string.
///
/// This is used to parse a numeric device identifier that comes back as 4 bytes.
String _u32BeToString(Uint8List data) {
  if (data.length < 4) return '';
  final int v = (data[0] << 24) | (data[1] << 16) | (data[2] << 8) | data[3];
  return '$v';
}

/// Registers the protocol name and provides an identifier instance.
class SatisfyerIdentifierFactory implements ProtocolIdentifierFactory {
  @override
  String identifier() => 'satisfyer';

  @override
  ProtocolIdentifier create() => SatisfyerIdentifier();
}

/// Reads the model identifier from the rxBleModel GATT characteristic.
class SatisfyerIdentifier implements ProtocolIdentifier {
  @override
  Future<
      ({
        ProtocolName protocolName,
        String? modelIdentifier,
        ProtocolInitializer initializer,
      })> identify({
    required Hardware hardware,
  }) async {
    String? modelIdentifier;

    if (hardware.endpoints.contains(Endpoint.rxBleModel)) {
      try {
        final result = await hardware.readValue(
          cmd: const HardwareReadCmd(endpoint: Endpoint.rxBleModel),
        );
        final id = _u32BeToString(result.data).trim();
        if (id.isNotEmpty) {
          modelIdentifier = id;
        }
      } catch (e) {
        logger.w('Satisfyer read model failed', ex: e);
      }
    }

    return (
      protocolName: 'satisfyer',
      modelIdentifier: modelIdentifier,
      initializer: const SatisfyerInitializer(),
    );
  }
}

/// Performs any one-time setup needed before control commands can be sent,
/// then creates the protocol handler with the correct number of outputs.
class SatisfyerInitializer implements ProtocolInitializer {
  const SatisfyerInitializer();

  @override
  Future<ProtocolHandler> initialize({
    required Hardware hardware,
    required ProtocolAttributes protocolAttributes,
    required bool isSpecV4,
  }) async {
    if (!isSpecV4) {
      logger.w('Satisfyer expects spec v4 device configuration');
    }

    // Send an enable byte and wait for acknowledgment so the GATT queue is
    // clear before any control commands are sent.
    await _enable(hardware);

    // Count how many output features exist so we know how many actuator slots to encode.
    final int outputCount = (protocolAttributes.features ?? [])
        .where((f) => f.containsOutput)
        .length;

    return Satisfyer(outputCount: outputCount);
  }

  Future<void> _enable(Hardware hardware) async {
    if (!hardware.endpoints.contains(Endpoint.command)) return;

    try {
      await hardware.writeValue(
        cmd: HardwareWriteCmd(
          endpoint: Endpoint.command,
          data: Uint8List.fromList(const [0x01]),
          writeWithResponse: true,
        ),
      );
    } catch (e) {
      logger.w('Satisfyer enable failed', ex: e);
    }
  }
}

/// Encodes output commands into device-specific BLE packets.
class Satisfyer extends ProtocolHandler {
  Satisfyer({required int outputCount})
      : _speeds = List<int>.filled(outputCount, 0);

  /// Cached speeds for each output feature.
  final List<int> _speeds;

  final StreamController<RemoteToyServerMessage> _events$ =
      StreamController.broadcast();

  @override
  Stream<RemoteToyServerMessage> get events$ => _events$.stream;

  @override
  ProtocolKeepaliveStrategy get keepaliveStrategy =>
      const ProtocolKeepaliveStrategyRepeatLastPacket(
        interval: Duration(seconds: 1),
      );

  @override
  List<HardwareCmd> buildKeepalive() => _formCommand();

  /// Updates one actuator speed, then sends a full multi-actuator packet.
  ///
  /// The device expects one packet that contains all actuator speeds.
  @override
  List<HardwareCmd> handleOutputVibrateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) {
    if (featureIndex < 0 || featureIndex >= _speeds.length) {
      logger.w('Satisfyer output index out of range: $featureIndex');
      return const [];
    }

    // Clamp to byte range.
    _speeds[featureIndex] = speed.clamp(0, 255);

    return _formCommand();
  }

  @override
  List<HardwareCmd> handleOutputConstrictCmd({
    required int featureIndex,
    required String featureId,
    required int level,
  }) {
    if (featureIndex < 0 || featureIndex >= _speeds.length) {
      logger.w('Satisfyer output index out of range: $featureIndex');
      return const [];
    }

    _speeds[featureIndex] = level.clamp(0, 255);

    return _formCommand();
  }

  /// Builds the BLE payload. Each actuator speed is repeated 4 times.
  List<HardwareCmd> _formCommand() {
    if (_speeds.isEmpty) return const [];

    final List<int> data = <int>[];
    for (final s in _speeds) {
      data.addAll([s, s, s, s]);
    }

    return [
      HardwareWriteCmd(
        endpoint: Endpoint.tx,
        data: Uint8List.fromList(data),
        writeWithResponse: false,
      ),
    ];
  }
}
