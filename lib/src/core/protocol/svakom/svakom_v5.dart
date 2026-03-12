/// Svakom V5 Protocol Handler
///
/// Reference: Buttplug Rust implementation (buttplug_server/src/device/protocol_impl/svakom/svakom_v5.rs)
/// Contributor: Ciao Chiang
library packages.remote_toy_kit.protocol.svakom.svakom_v5;

import 'dart:async';
import 'dart:typed_data';

import '../../../configuration/configuration.dart';
import '../../../util/logger.dart';
import '../../hardware/hardware.dart';
import '../../message/message.dart';
import '../protocol.dart';

class SvakomV5IdentifierFactory implements ProtocolIdentifierFactory {
  @override
  String identifier() => 'svakom-v5';

  @override
  ProtocolIdentifier create() => SvakomV5Identifier();
}

class SvakomV5Identifier implements ProtocolIdentifier {
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
      protocolName: 'svakom-v5',
      modelIdentifier: modelIdentifier,
      initializer: const SvakomV5Initializer(),
    );
  }
}

class SvakomV5Initializer implements ProtocolInitializer {
  const SvakomV5Initializer();

  @override
  Future<ProtocolHandler> initialize({
    required Hardware hardware,
    required ProtocolAttributes protocolAttributes,
  }) async {
    return SvakomV5();
  }
}

class SvakomV5 extends ProtocolHandler {
  SvakomV5();

  final StreamController<RemoteToyServerMessage> _events$ =
      StreamController.broadcast();
  final List<int> _lastVibeSpeeds = List<int>.filled(2, 0);

  @override
  Stream<RemoteToyServerMessage> get events$ => _events$.stream;

  @override
  List<HardwareCmd> handleOutputVibrateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) {
    _setVibeSpeed(featureIndex, speed);
    return _buildVibeCommand();
  }

  @override
  List<HardwareCmd> handleOutputOscillateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) {
    return _buildOscillateCommand(speed);
  }

  void _setVibeSpeed(int index, int speed) {
    if (index < 0 || index >= _lastVibeSpeeds.length) {
      logger.w('Svakom V5 vibrate index out of range: $index');
      return;
    }
    _lastVibeSpeeds[index] = speed.clamp(0, 255);
  }

  List<HardwareCmd> _buildVibeCommand() {
    final int vibe1 = _lastVibeSpeeds[0];
    final int vibe2 = _lastVibeSpeeds[1];
    final int mode = (vibe1 > 0 && vibe2 > 0) || vibe1 == vibe2
        ? 0x00
        : (vibe1 > 0 ? 0x01 : 0x02);
    final int enable = (vibe1 == 0 && vibe2 == 0) ? 0x00 : 0x01;
    final int speed = vibe1 > vibe2 ? vibe1 : vibe2;

    return [
      HardwareWriteCmd(
        endpoint: Endpoint.tx,
        data: Uint8List.fromList([
          0x55,
          0x03,
          mode,
          0x00,
          enable,
          speed,
        ]),
        writeWithResponse: false,
      ),
    ];
  }

  List<HardwareCmd> _buildOscillateCommand(int speed) {
    final int clamped = speed.clamp(0, 255);
    return [
      HardwareWriteCmd(
        endpoint: Endpoint.tx,
        data: Uint8List.fromList([0x55, 0x09, 0x00, 0x00, clamped, 0x00]),
        writeWithResponse: false,
      ),
    ];
  }
}
