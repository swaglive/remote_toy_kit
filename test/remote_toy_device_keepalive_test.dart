import 'dart:async';
import 'dart:typed_data';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/configuration/configuration.dart';
import 'package:remote_toy_kit/src/core/hardware/hardware.dart';
import 'package:remote_toy_kit/src/core/message/message.dart';
import 'package:remote_toy_kit/src/core/protocol/protocol.dart';
import 'package:remote_toy_kit/src/remote_toy_device.dart';

import 'support/test_hardware.dart';

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

class _KeepaliveHandler extends ProtocolHandler {
  _KeepaliveHandler({
    required this.strategy,
    required this.keepaliveData,
  });

  final ProtocolKeepaliveStrategy strategy;
  final Uint8List keepaliveData;

  final StreamController<RemoteToyServerMessage> _events$ =
      StreamController.broadcast();

  @override
  Stream<RemoteToyServerMessage> get events$ => _events$.stream;

  @override
  ProtocolKeepaliveStrategy get keepaliveStrategy => strategy;

  @override
  List<HardwareCmd> buildKeepalive() => [
        HardwareWriteCmd(
          endpoint: Endpoint.tx,
          data: keepaliveData,
          writeWithResponse: false,
        ),
      ];

  @override
  List<HardwareCmd> handleOutputVibrateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) =>
      [
        HardwareWriteCmd(
          endpoint: Endpoint.tx,
          data: Uint8List.fromList([speed, speed, speed, speed]),
          writeWithResponse: false,
        ),
      ];
}

class _NoKeepaliveHandler extends ProtocolHandler {
  final StreamController<RemoteToyServerMessage> _events$ =
      StreamController.broadcast();

  @override
  Stream<RemoteToyServerMessage> get events$ => _events$.stream;
}

ProtocolAttributes _attrs({int outputs = 1}) {
  final features = List<DeviceFeature>.generate(
    outputs,
    (i) => DeviceFeature(
      id: 'f-$i',
      index: i,
      output: const DeviceFeatureOutput(
        vibrate: DeviceFeatureOutputValueProperties(
          value: RangeInclusive(start: 0, end: 100),
        ),
      ),
    ),
  );
  return ProtocolAttributes(
    id: 'test',
    name: 'Test Device',
    features: features,
  );
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  group('RemoteToyDevice keepalive', () {
    late TestHardware hardware;

    setUp(() {
      hardware = TestHardware(name: 'Test', connected: true);
    });

    test('sends seed packet on build when strategy is RepeatLastPacket', () {
      final handler = _KeepaliveHandler(
        strategy: const ProtocolKeepaliveStrategyRepeatLastPacket(
          interval: Duration(seconds: 1),
        ),
        keepaliveData: Uint8List.fromList([0, 0, 0, 0]),
      );

      RemoteToyDevice.build(
        hardware: hardware,
        protocolHandler: handler,
        protocolAttributes: _attrs(),
      );

      expect(hardware.writes, isNotEmpty);
      expect(hardware.writes.last.endpoint, Endpoint.tx);
      expect(hardware.writes.last.data, Uint8List.fromList([0, 0, 0, 0]));
    });

    test('does not send seed when strategy is None', () {
      final handler = _NoKeepaliveHandler();

      RemoteToyDevice.build(
        hardware: hardware,
        protocolHandler: handler,
        protocolAttributes: _attrs(),
      );

      expect(hardware.writes, isEmpty);
    });

    test('replays last user write on keepalive timer', () async {
      final handler = _KeepaliveHandler(
        strategy: const ProtocolKeepaliveStrategyRepeatLastPacket(
          interval: Duration(milliseconds: 100),
        ),
        keepaliveData: Uint8List.fromList([0, 0, 0, 0]),
      );

      final device = RemoteToyDevice.build(
        hardware: hardware,
        protocolHandler: handler,
        protocolAttributes: _attrs(),
      );
      await Future<void>.delayed(Duration.zero);
      hardware.writes.clear();

      await device.executeCommand(
        message: const OutputCmdClientMessage(
          command: OutputCmd.v4(
            featureIndex: 0,
            command: OutputCommand.vibrate(
              outputValue: OutputValue(value: 50),
            ),
          ),
        ),
      );

      final userWriteData =
          Uint8List.fromList(hardware.writes.last.data.toList());
      hardware.writes.clear();

      await Future<void>.delayed(const Duration(milliseconds: 250));

      expect(hardware.writes, isNotEmpty);
      expect(hardware.writes.last.data, userWriteData);

      await device.disconnect();
    });

    test('skips keepalive when a recent user write occurred', () {
      FakeAsync().run((async) {
        final handler = _KeepaliveHandler(
          strategy: const ProtocolKeepaliveStrategyRepeatLastPacket(
            interval: Duration(seconds: 1),
          ),
          keepaliveData: Uint8List.fromList([0, 0, 0, 0]),
        );

        final device = RemoteToyDevice.build(
          hardware: hardware,
          protocolHandler: handler,
          protocolAttributes: _attrs(),
        );
        async.flushMicrotasks();

        hardware.writes.clear();

        // Write at 500ms — well within the 1s keepalive window
        async.elapse(const Duration(milliseconds: 500));
        device.executeCommand(
          message: const OutputCmdClientMessage(
            command: OutputCmd.v4(
              featureIndex: 0,
              command: OutputCommand.vibrate(
                outputValue: OutputValue(value: 80),
              ),
            ),
          ),
        );
        async.flushMicrotasks();
        hardware.writes.clear();

        // Timer fires at 1s mark (500ms after write) — should skip
        async.elapse(const Duration(milliseconds: 500));
        expect(hardware.writes, isEmpty);

        device.disconnect();
        async.flushMicrotasks();
      });
    });

    test('cancels timer on disconnect', () {
      FakeAsync().run((async) {
        final handler = _KeepaliveHandler(
          strategy: const ProtocolKeepaliveStrategyRepeatLastPacket(
            interval: Duration(seconds: 1),
          ),
          keepaliveData: Uint8List.fromList([0, 0, 0, 0]),
        );

        final device = RemoteToyDevice.build(
          hardware: hardware,
          protocolHandler: handler,
          protocolAttributes: _attrs(),
        );
        async.flushMicrotasks();

        hardware.writes.clear();

        device.disconnect();
        async.flushMicrotasks();

        async.elapse(const Duration(seconds: 5));

        expect(hardware.writes, isEmpty);
      });
    });

    test('does not write keepalive when device is disconnected', () {
      FakeAsync().run((async) {
        final handler = _KeepaliveHandler(
          strategy: const ProtocolKeepaliveStrategyRepeatLastPacket(
            interval: Duration(seconds: 1),
          ),
          keepaliveData: Uint8List.fromList([0, 0, 0, 0]),
        );

        RemoteToyDevice.build(
          hardware: hardware,
          protocolHandler: handler,
          protocolAttributes: _attrs(),
        );
        async.flushMicrotasks();

        hardware.writes.clear();
        hardware.connected = false;

        async.elapse(const Duration(seconds: 2));

        expect(hardware.writes, isEmpty);
      });
    });
  });
}
