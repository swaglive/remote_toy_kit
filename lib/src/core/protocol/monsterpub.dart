/// MonsterPub Protocol Handler
///
/// Reference: Buttplug Rust implementation (buttplug_server/src/device/protocol_impl/monsterpub.rs)
/// Contributor: Ciao Chiang
library core.protocol.monsterpub;

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import '../../configuration/configuration.dart';
import '../../util/logger.dart';
import '../hardware/hardware.dart';
import '../message/message.dart';
import 'protocol.dart';

/// Auth flow (high-level):
/// - Read 16-byte challenge from rx (index + 15-byte payload).
/// - XOR payload with selected key to build auth response.
/// - Write 15-byte response back to rx to unlock control.

/// Lookup table of four 15-byte auth keys selected by challenge index.
const List<List<int>> _monsterPubKeys = [
  [
    0x32,
    0x49,
    0x50,
    0x4f,
    0x32,
    0x49,
    0x50,
    0x4f,
    0x32,
    0x49,
    0x50,
    0x4f,
    0x32,
    0x49,
    0x50
  ],
  [
    0x4c,
    0x53,
    0x42,
    0x42,
    0x4c,
    0x53,
    0x42,
    0x42,
    0x4c,
    0x53,
    0x42,
    0x42,
    0x4c,
    0x53,
    0x42
  ],
  [
    0x53,
    0x49,
    0x53,
    0x36,
    0x53,
    0x49,
    0x53,
    0x36,
    0x53,
    0x49,
    0x53,
    0x36,
    0x53,
    0x49,
    0x53
  ],
  [
    0x54,
    0x41,
    0x4c,
    0x4b,
    0x54,
    0x41,
    0x4c,
    0x4b,
    0x54,
    0x41,
    0x4c,
    0x4b,
    0x54,
    0x41,
    0x4c
  ],
];

/// Decode a null-terminated BLE UTF-8 string (for model identifiers).
///
/// - [data] is the data to decode.
/// - Returns the decoded string.
String _decodeNullTerminatedUtf8(Uint8List data) {
  final int end = data.indexWhere((value) => value == 0x00);
  final int length = end == -1 ? data.length : end;
  if (length <= 0) {
    return '';
  }
  return utf8.decode(data.sublist(0, length));
}

class MonsterPubIdentifierFactory implements ProtocolIdentifierFactory {
  @override
  String identifier() => 'monsterpub';

  @override
  ProtocolIdentifier create() => MonsterPubIdentifier();
}

class MonsterPubIdentifier implements ProtocolIdentifier {
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
        final decoded = _decodeNullTerminatedUtf8(result.data).trim();
        if (decoded.isNotEmpty) {
          modelIdentifier = decoded;
        }
      } catch (e) {
        logger.w('MonsterPub read model failed', ex: e);
      }
    }

    return (
      protocolName: 'monsterpub',
      modelIdentifier: modelIdentifier,
      initializer: const MonsterPubInitializer(),
    );
  }
}

class MonsterPubInitializer implements ProtocolInitializer {
  const MonsterPubInitializer();

  @override
  ProtocolHandler initialize({
    required Hardware hardware,
    required ProtocolAttributes protocolAttributes,
    required bool isSpecV4,
  }) {
    if (!isSpecV4) {
      logger.w('MonsterPub expects spec v4 device configuration');
    }
    _startAuthenticationIfNeeded(hardware);

    final outputCount = (protocolAttributes.features ?? [])
        .where((feature) => feature.containsOutput)
        .length;

    final Endpoint tx = _resolveTxEndpoint(hardware.endpoints);
    return MonsterPub(
      tx: tx,
      outputCount: outputCount,
    );
  }

  /// Start authentication if needed.
  ///
  /// - [hardware] is the hardware to start authentication on.
  void _startAuthenticationIfNeeded(Hardware hardware) {
    if (!hardware.endpoints.contains(Endpoint.rx)) {
      return;
    }
    // Fire-and-forget so initialize stays synchronous.
    () async {
      try {
        final result = await hardware.readValue(
          cmd: const HardwareReadCmd(endpoint: Endpoint.rx),
        );
        final data = result.data;
        if (data.length < 16) {
          logger.w('MonsterPub auth data too short: ${data.length}');
          return;
        }
        final int keyIndex = data[0];
        if (keyIndex < 0 || keyIndex >= _monsterPubKeys.length) {
          logger.w('MonsterPub auth key index out of range: $keyIndex');
          return;
        }
        final key = _monsterPubKeys[keyIndex];
        final List<int> auth = List<int>.generate(
          15,
          (index) => data[index + 1] ^ key[index],
        );
        await hardware.writeValue(
          cmd: HardwareWriteCmd(
            endpoint: Endpoint.rx,
            data: Uint8List.fromList(auth),
            writeWithResponse: true,
          ),
        );
      } catch (e) {
        logger.w('MonsterPub auth handshake failed', ex: e);
      }
    }();
  }

  /// Resolve the tx endpoint to use.
  ///
  /// - [endpoints] is the list of endpoints to resolve from.
  /// - Returns the resolved endpoint.
  Endpoint _resolveTxEndpoint(List<Endpoint> endpoints) {
    // Prefer explicit vibrate endpoint, then tx, else fallback to generic0.
    if (endpoints.contains(Endpoint.txVibrate)) {
      return Endpoint.txVibrate;
    }
    if (endpoints.contains(Endpoint.tx)) {
      return Endpoint.tx;
    }
    return Endpoint.generic0;
  }
}

class MonsterPub extends ProtocolHandler {
  MonsterPub({
    required Endpoint tx,
    required int outputCount,
  })  : _tx = tx,
        _speeds = List<int>.filled(outputCount, 0);

  final Endpoint _tx;
  // Cached speeds for multi-actuator command construction.
  final List<int> _speeds;
  final StreamController<RemoteToyServerMessage> _events$ =
      StreamController.broadcast();

  @override
  Stream<RemoteToyServerMessage> get events$ => _events$.stream;

  @override
  List<HardwareCmd> handleOutputVibrateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) {
    _setSpeed(featureIndex, speed);
    return _formCommand();
  }

  @override
  List<HardwareCmd> handleOutputOscillateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) {
    _setSpeed(featureIndex, speed);
    return _formCommand();
  }

  @override
  List<HardwareCmd> handleOutputConstrictCmd({
    required int featureIndex,
    required String featureId,
    required int level,
  }) {
    _setSpeed(featureIndex, level);
    return _formCommand();
  }

  /// Set the speed for the given index.
  ///
  /// - [index] is the index to set the speed for.
  /// - [speed] is the speed to set.
  void _setSpeed(int index, int speed) {
    if (index < 0 || index >= _speeds.length) {
      logger.w('MonsterPub output index out of range: $index');
      return;
    }
    // Protocol expects byte-range values.
    final int clamped = speed.clamp(0, 255);
    _speeds[index] = clamped;
  }

  /// Form the command to send to the device.
  ///
  /// - Returns the list of [HardwareCmd] to send to the device.
  List<HardwareCmd> _formCommand() {
    if (_speeds.isEmpty) {
      return const [];
    }
    final List<int> data = [];
    bool shouldStop = true;

    // generic0 requires a leading 0x03 byte.
    if (_tx == Endpoint.generic0) {
      data.add(3);
    }

    // Track whether we should switch to stop/idle mode.
    for (final speed in _speeds) {
      data.add(speed);
      if (speed != 0) {
        shouldStop = false;
      }
    }

    // If using tx and all speeds are zero, switch to txMode to stop.
    final Endpoint txEndpoint =
        _tx == Endpoint.tx && shouldStop ? Endpoint.txMode : _tx;

    return [
      HardwareWriteCmd(
        endpoint: txEndpoint,
        data: Uint8List.fromList(data),
        writeWithResponse: txEndpoint == Endpoint.txMode,
      ),
    ];
  }
}
