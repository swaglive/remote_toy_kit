import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/configuration/configuration.dart';
import 'package:remote_toy_kit/src/core/hardware/hardware.dart';
import 'package:remote_toy_kit/src/core/message/message.dart';
import 'package:remote_toy_kit/src/core/protocol/keepalive_strategy.dart';
import 'package:remote_toy_kit/src/core/protocol/satisfyer.dart';

class _FakeHardware implements Hardware {
  _FakeHardware({
    required this.endpoints,
    Map<Endpoint, Uint8List>? readResponses,
    this.onWrite,
  }) : _readResponses = readResponses ?? {};

  @override
  final String name = 'Satisfyer';

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
  Future<({Endpoint endpoint, Uint8List data})> readValue({
    required HardwareReadCmd cmd,
  }) async {
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
    (index) => DeviceFeature(
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
    id: 'satisfyer',
    name: 'Satisfyer Device',
    features: features,
  );
}

void main() {
  group('Satisfyer', () {
    group('SatisfyerIdentifier', () {
      test('reads model identifier from rxBleModel (u32 big-endian)', () async {
        final hardware = _FakeHardware(
          endpoints: [Endpoint.rxBleModel],
          readResponses: {
            Endpoint.rxBleModel: Uint8List.fromList([0, 0, 0, 42]),
          },
        );

        final identifier = SatisfyerIdentifier();
        final result = await identifier.identify(hardware: hardware);

        expect(result.protocolName, 'satisfyer');
        expect(result.modelIdentifier, '42');
        expect(result.initializer, isA<SatisfyerInitializer>());
      });

      test('returns null modelIdentifier if rxBleModel is missing', () async {
        final hardware = _FakeHardware(endpoints: const []);

        final identifier = SatisfyerIdentifier();
        final result = await identifier.identify(hardware: hardware);

        expect(result.protocolName, 'satisfyer');
        expect(result.modelIdentifier, isNull);
        expect(result.initializer, isA<SatisfyerInitializer>());
      });
    });

    group('SatisfyerInitializer', () {
      test('writes enable byte 0x01 to command when command endpoint exists',
          () async {
        final completer = Completer<HardwareWriteCmd>();

        final hardware = _FakeHardware(
          endpoints: [Endpoint.command],
          onWrite: (cmd) {
            if (!completer.isCompleted) {
              completer.complete(cmd);
            }
          },
        );

        const initializer = SatisfyerInitializer();
        await initializer.initialize(
          hardware: hardware,
          protocolAttributes: _buildAttributes(outputCount: 2),
        );

        final writeCmd =
            await completer.future.timeout(const Duration(seconds: 1));

        expect(writeCmd.endpoint, Endpoint.command);
        expect(writeCmd.writeWithResponse, isTrue);
        expect(writeCmd.data, Uint8List.fromList(const [0x01]));
      });

      test('does not write enable if command endpoint is missing', () async {
        var wrote = false;

        final hardware = _FakeHardware(
          endpoints: const [],
          onWrite: (_) => wrote = true,
        );

        const initializer = SatisfyerInitializer();
        await initializer.initialize(
          hardware: hardware,
          protocolAttributes: _buildAttributes(outputCount: 1),
        );

        expect(wrote, isFalse);
      });
    });

    group('Satisfyer commands', () {
      test('encodes 1 output as [s,s,s,s] and writes to tx', () {
        final handler = Satisfyer(outputCount: 1);

        final cmds = handler.handleOutputVibrateCmd(
          featureIndex: 0,
          featureId: 'feature-0',
          speed: 7,
        );

        expect(cmds.length, 1);
        final cmd = cmds.first as HardwareWriteCmd;
        expect(cmd.endpoint, Endpoint.tx);
        expect(cmd.writeWithResponse, isFalse);
        expect(cmd.data, Uint8List.fromList([7, 7, 7, 7]));
      });

      test('encodes multiple outputs by repeating each speed 4 times', () {
        final handler = Satisfyer(outputCount: 2);

        handler.handleOutputVibrateCmd(
          featureIndex: 0,
          featureId: 'feature-0',
          speed: 3,
        );

        final cmds = handler.handleOutputVibrateCmd(
          featureIndex: 1,
          featureId: 'feature-1',
          speed: 12,
        );

        expect(cmds.length, 1);
        final cmd = cmds.first as HardwareWriteCmd;
        expect(cmd.data, Uint8List.fromList([3, 3, 3, 3, 12, 12, 12, 12]));
      });

      test('clamps speed to 0..255', () {
        final handler = Satisfyer(outputCount: 1);

        final cmds = handler.handleOutputVibrateCmd(
          featureIndex: 0,
          featureId: 'feature-0',
          speed: 999,
        );

        final cmd = cmds.first as HardwareWriteCmd;
        expect(cmd.data, Uint8List.fromList([255, 255, 255, 255]));
      });

      test('returns empty list when featureIndex is out of range', () {
        final handler = Satisfyer(outputCount: 1);

        final cmds = handler.handleOutputVibrateCmd(
          featureIndex: 2,
          featureId: 'feature-2',
          speed: 10,
        );

        expect(cmds, isEmpty);
      });

      test('buildKeepalive returns current full packet', () {
        final handler = Satisfyer(outputCount: 2);

        handler.handleOutputVibrateCmd(
          featureIndex: 0,
          featureId: 'feature-0',
          speed: 9,
        );

        final keepalive = handler.buildKeepalive();
        expect(keepalive.length, 1);

        final cmd = keepalive.first as HardwareWriteCmd;
        expect(cmd.endpoint, Endpoint.tx);
        expect(cmd.data, Uint8List.fromList([9, 9, 9, 9, 0, 0, 0, 0]));
      });
    });

    group('Satisfyer constrict commands', () {
      test('encodes constrict as [l,l,l,l] and writes to tx', () {
        final handler = Satisfyer(outputCount: 1);

        final cmds = handler.handleOutputConstrictCmd(
          featureIndex: 0,
          featureId: 'feature-0',
          level: 7,
        );

        expect(cmds.length, 1);
        final cmd = cmds.first as HardwareWriteCmd;
        expect(cmd.endpoint, Endpoint.tx);
        expect(cmd.writeWithResponse, isFalse);
        expect(cmd.data, Uint8List.fromList([7, 7, 7, 7]));
      });

      test('mixed vibrate + constrict produces correct combined packet', () {
        final handler = Satisfyer(outputCount: 2);

        handler.handleOutputVibrateCmd(
          featureIndex: 0,
          featureId: 'feature-0',
          speed: 3,
        );

        final cmds = handler.handleOutputConstrictCmd(
          featureIndex: 1,
          featureId: 'feature-1',
          level: 12,
        );

        expect(cmds.length, 1);
        final cmd = cmds.first as HardwareWriteCmd;
        expect(cmd.data, Uint8List.fromList([3, 3, 3, 3, 12, 12, 12, 12]));
      });

      test('clamps level to 0..255', () {
        final handler = Satisfyer(outputCount: 1);

        final cmds = handler.handleOutputConstrictCmd(
          featureIndex: 0,
          featureId: 'feature-0',
          level: 999,
        );

        final cmd = cmds.first as HardwareWriteCmd;
        expect(cmd.data, Uint8List.fromList([255, 255, 255, 255]));
      });

      test('returns empty list when featureIndex is out of range', () {
        final handler = Satisfyer(outputCount: 1);

        final cmds = handler.handleOutputConstrictCmd(
          featureIndex: 2,
          featureId: 'feature-2',
          level: 10,
        );

        expect(cmds, isEmpty);
      });
    });

    group('keepalive strategy', () {
      test('uses RepeatLastPacket with 1-second interval', () {
        final handler = Satisfyer(outputCount: 1);

        expect(
          handler.keepaliveStrategy,
          isA<ProtocolKeepaliveStrategyRepeatLastPacket>(),
        );

        final strategy = handler.keepaliveStrategy
            as ProtocolKeepaliveStrategyRepeatLastPacket;
        expect(strategy.interval, const Duration(seconds: 1));
      });

      test('buildKeepalive returns zeros before any command', () {
        final handler = Satisfyer(outputCount: 2);

        final cmds = handler.buildKeepalive();
        expect(cmds.length, 1);

        final cmd = cmds.first as HardwareWriteCmd;
        expect(cmd.data, Uint8List.fromList([0, 0, 0, 0, 0, 0, 0, 0]));
      });

      test('buildKeepalive reflects the latest speeds', () {
        final handler = Satisfyer(outputCount: 2);

        handler.handleOutputVibrateCmd(
          featureIndex: 0,
          featureId: 'f0',
          speed: 100,
        );
        handler.handleOutputVibrateCmd(
          featureIndex: 1,
          featureId: 'f1',
          speed: 50,
        );

        final cmd = handler.buildKeepalive().first as HardwareWriteCmd;
        expect(
          cmd.data,
          Uint8List.fromList([100, 100, 100, 100, 50, 50, 50, 50]),
        );
      });

      test('buildKeepalive returns empty list when outputCount is 0', () {
        final handler = Satisfyer(outputCount: 0);
        expect(handler.buildKeepalive(), isEmpty);
      });
    });
  });
}
