/// Svakom Pulse Protocol Handler
///
/// Reference: Buttplug Rust implementation (buttplug_server/src/device/protocol_impl/svakom/svakom_pulse.rs)
/// Contributor: Ciao Chiang
library packages.remote_toy_kit.protocol.svakom.svakom_pulse;

import 'dart:typed_data';

import 'package:rxdart/rxdart.dart';

import '../../../configuration/configuration.dart';
import '../../../util/logger.dart';
import '../../hardware/hardware.dart';
import '../../message/message.dart';
import '../protocol.dart';

class SvakomPulseIdentifierFactory implements ProtocolIdentifierFactory {
  @override
  String identifier() => 'svakom-pulse';

  @override
  ProtocolIdentifier create() => SvakomPulseIdentifier();
}

class SvakomPulseIdentifier implements ProtocolIdentifier {
  @override
  Future<
      ({
        ProtocolName protocolName,
        String? modelIdentifier,
        ProtocolInitializer initializer,
      })> identify({
    required Hardware hardware,
  }) async {
    final modelIdentifier = hardware.name.isEmpty ? null : hardware.name.trim();
    return (
      protocolName: 'svakom-pulse',
      modelIdentifier: modelIdentifier,
      initializer: const SvakomPulseInitializer(),
    );
  }
}

class SvakomPulseInitializer implements ProtocolInitializer {
  const SvakomPulseInitializer();

  @override
  ProtocolHandler initialize({
    required Hardware hardware,
    required ProtocolAttributes protocolAttributes,
    required bool isSpecV4,
  }) {
    if (!isSpecV4) {
      logger.w('Svakom Pulse expects spec v4 device configuration');
    }
    return SvakomPulse();
  }
}

class SvakomPulse extends ProtocolHandler {
  SvakomPulse();

  final PublishSubject<RemoteToyServerMessage> _events$ = PublishSubject();

  @override
  Stream<RemoteToyServerMessage> get events$ => _events$.stream;

  @override
  List<HardwareCmd> handleOutputVibrateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) {
    return _buildVibrateCommand(speed);
  }

  @override
  List<HardwareCmd> handleScalarVibrateCmd({
    required int index,
    required int scalar,
  }) {
    return _buildVibrateCommand(scalar);
  }

  List<HardwareCmd> _buildVibrateCommand(int speed) {
    final int clamped = speed.clamp(0, 255);
    final int mode = clamped == 0 ? 0x00 : 0x01;
    final int level = (clamped + 1) & 0xff;
    return [
      HardwareWriteCmd(
        endpoint: Endpoint.tx,
        data: Uint8List.fromList([
          0x55,
          0x03,
          0x03,
          0x00,
          mode,
          level,
        ]),
        writeWithResponse: false,
      ),
    ];
  }
}
