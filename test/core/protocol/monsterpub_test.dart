import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/configuration/configuration.dart';
import 'package:remote_toy_kit/src/core/hardware/hardware.dart';
import 'package:remote_toy_kit/src/core/message/message.dart';
import 'package:remote_toy_kit/src/core/protocol/monsterpub.dart';

class _FakeHardware implements Hardware {
  _FakeHardware({
    required this.endpoints,
    Map<Endpoint, Uint8List>? readResponses,
    this.onWrite,
  }) : _readResponses = readResponses ?? {};

  @override
  final String name = 'MonsterPub';

  @override
  final String id = 'device-id';

  @override
  final List<Endpoint> endpoints;

  final Map<Endpoint, Uint8List> _readResponses;
  final void Function(HardwareWriteCmd cmd)? onWrite;

  final StreamController<HardwareEvent> _eventsController =
      StreamController<HardwareEvent>.broadcast();

  @override
  bool get connected => true;

  @override
  Stream<bool> get connected$ => Stream<bool>.value(true);

  @override
  Stream<HardwareEvent> get events$ => _eventsController.stream;

  @override
  Future<void> disconnect() async {}

  @override
  Future<void> execute({required HardwareCmd cmd}) async {
    switch (cmd) {
      case HardwareWriteCmd():
        return writeValue(cmd: cmd);
      case HardwareSubscribeCmd():
        return subscribe(cmd: cmd);
      case HardwareUnsubscribeCmd():
        return unsubscribe(cmd: cmd);
      case HardwareReadCmd():
        await readValue(cmd: cmd);
        return;
    }
  }

  @override
  Future<({Endpoint endpoint, Uint8List data})> readValue(
      {required HardwareReadCmd cmd}) async {
    final data = _readResponses[cmd.endpoint];
    if (data == null) {
      throw StateError('No response registered for ${cmd.endpoint}');
    }
    return (endpoint: cmd.endpoint, data: data);
  }

  @override
  Future<void> writeValue({required HardwareWriteCmd cmd}) async {
    onWrite?.call(cmd);
  }

  @override
  Future<void> subscribe({required HardwareSubscribeCmd cmd}) async {}

  @override
  Future<void> unsubscribe({required HardwareUnsubscribeCmd cmd}) async {}
}

ProtocolAttributes _buildAttributes({int outputCount = 1}) {
  final features = List<DeviceFeature>.generate(
    outputCount,
    (index) => DeviceFeature.v4(
      id: 'feature-$index',
      index: index,
      output: const DeviceFeatureOutput(
        vibrate: DeviceFeatureOutputValueProperties(
          value: RangeInclusive(start: 0, end: 100),
        ),
      ),
    ),
  );
  return ProtocolAttributes(
    id: 'monsterpub',
    name: 'MonsterPub Device',
    features: features,
  );
}

void main() {
  group('MonsterPub', () {
    group('MonsterPubIdentifier', () {
      test('reads model identifier from rxBleModel', () async {
        final hardware = _FakeHardware(
          endpoints: [Endpoint.rxBleModel],
          readResponses: {
            Endpoint.rxBleModel:
                Uint8List.fromList('MP_MW_TL_P2\u0000'.codeUnits),
          },
        );
        final identifier = MonsterPubIdentifier();
        final result = await identifier.identify(hardware: hardware);

        expect(result.protocolName, 'monsterpub');
        expect(result.modelIdentifier, 'MP_MW_TL_P2');
        expect(result.initializer, isA<MonsterPubInitializer>());
      });
    });

    group('MonsterPubInitializer', () {
      test('performs auth handshake when rx endpoint exists', () async {
        final payload = List<int>.generate(15, (index) => index + 1);
        final challenge = Uint8List.fromList([0, ...payload]);
        final completer = Completer<HardwareWriteCmd>();

        final hardware = _FakeHardware(
          endpoints: [Endpoint.rx],
          readResponses: {Endpoint.rx: challenge},
          onWrite: (cmd) {
            if (!completer.isCompleted) {
              completer.complete(cmd);
            }
          },
        );

        const key = [
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
          0x50,
        ];
        final expectedAuth = List<int>.generate(
          15,
          (index) => payload[index] ^ key[index],
        );

        const initializer = MonsterPubInitializer();
        initializer.initialize(
          hardware: hardware,
          protocolAttributes: _buildAttributes(outputCount: 1),
          isSpecV4: true,
        );

        final writeCmd =
            await completer.future.timeout(const Duration(seconds: 1));

        expect(writeCmd.endpoint, Endpoint.rx);
        expect(writeCmd.writeWithResponse, isTrue);
        expect(writeCmd.data, Uint8List.fromList(expectedAuth));
      });
    });

    group('MonsterPub commands', () {
      test('uses txMode when all outputs stop on tx endpoint', () {
        final handler = MonsterPub(tx: Endpoint.tx, outputCount: 2);
        final cmds = handler.handleOutputVibrateCmd(
          featureIndex: 0,
          featureId: 'feature-0',
          speed: 0,
        );

        expect(cmds.length, 1);
        final cmd = cmds.first as HardwareWriteCmd;
        expect(cmd.endpoint, Endpoint.txMode);
        expect(cmd.writeWithResponse, isTrue);
        expect(cmd.data, Uint8List.fromList([0, 0]));
      });

      test('oscillate uses txMode when all outputs stop', () {
        final handler = MonsterPub(tx: Endpoint.tx, outputCount: 1);
        final cmds = handler.handleOutputOscillateCmd(
          featureIndex: 0,
          featureId: 'feature-0',
          speed: 0,
        );

        expect(cmds.length, 1);
        final cmd = cmds.first as HardwareWriteCmd;
        expect(cmd.endpoint, Endpoint.txMode);
        expect(cmd.writeWithResponse, isTrue);
        expect(cmd.data, Uint8List.fromList([0]));
      });

      test('uses tx when any output is nonzero', () {
        final handler = MonsterPub(tx: Endpoint.tx, outputCount: 2);
        final cmds = handler.handleOutputVibrateCmd(
          featureIndex: 1,
          featureId: 'feature-1',
          speed: 12,
        );

        expect(cmds.length, 1);
        final cmd = cmds.first as HardwareWriteCmd;
        expect(cmd.endpoint, Endpoint.tx);
        expect(cmd.writeWithResponse, isFalse);
        expect(cmd.data, Uint8List.fromList([0, 12]));
      });

      test('prepends 0x03 when using generic0', () {
        final handler = MonsterPub(tx: Endpoint.generic0, outputCount: 1);
        final cmds = handler.handleOutputOscillateCmd(
          featureIndex: 0,
          featureId: 'feature-0',
          speed: 7,
        );

        expect(cmds.length, 1);
        final cmd = cmds.first as HardwareWriteCmd;
        expect(cmd.endpoint, Endpoint.generic0);
        expect(cmd.data, Uint8List.fromList([3, 7]));
      });

      test('constrict maps level to output speed', () {
        final handler = MonsterPub(tx: Endpoint.tx, outputCount: 1);
        final cmds = handler.handleOutputConstrictCmd(
          featureIndex: 0,
          featureId: 'feature-0',
          level: 9,
        );

        expect(cmds.length, 1);
        final cmd = cmds.first as HardwareWriteCmd;
        expect(cmd.endpoint, Endpoint.tx);
        expect(cmd.writeWithResponse, isFalse);
        expect(cmd.data, Uint8List.fromList([9]));
      });
    });
  });
}
