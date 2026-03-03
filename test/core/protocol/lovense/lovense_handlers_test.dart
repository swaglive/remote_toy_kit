import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/core/hardware/hardware.dart';
import 'package:remote_toy_kit/src/core/protocol/lovense/lovense.dart';
import '../../../support/test_hardware.dart';

String _decodeCmd(HardwareCmd cmd) {
  return utf8.decode((cmd as HardwareWriteCmd).data);
}

void main() {
  group('Lovense handlers', () {
    test('single actuator maps vibrate and oscillate', () {
      final handler = LovenseSingleActuator();

      final vibrateCmds = handler.handleOutputVibrateCmd(
        featureIndex: 0,
        featureId: 'v0',
        speed: 5,
      );
      expect(_decodeCmd(vibrateCmds.single), 'Vibrate:5;');

      final oscillateCmds = handler.handleOutputOscillateCmd(
        featureIndex: 0,
        featureId: 'o0',
        speed: 9,
      );
      expect(_decodeCmd(oscillateCmds.single), 'Vibrate:9;');
    });

    test('dual actuator offsets feature index by 1', () {
      final handler = LovenseDualActuator();

      final vibrateCmds = handler.handleOutputVibrateCmd(
        featureIndex: 0,
        featureId: 'v0',
        speed: 7,
      );
      expect(_decodeCmd(vibrateCmds.single), 'Vibrate1:7;');

      final oscillateCmds = handler.handleOutputOscillateCmd(
        featureIndex: 1,
        featureId: 'o1',
        speed: 3,
      );
      expect(_decodeCmd(oscillateCmds.single), 'Vibrate2:3;');
    });

    test('max handles vibrate, oscillate, and constrict', () {
      final handler = LovenseMax();

      final vibrateCmds = handler.handleOutputVibrateCmd(
        featureIndex: 0,
        featureId: 'v0',
        speed: 4,
      );
      expect(_decodeCmd(vibrateCmds.single), 'Vibrate:4;');

      final oscillateCmds = handler.handleOutputOscillateCmd(
        featureIndex: 0,
        featureId: 'o0',
        speed: 6,
      );
      expect(_decodeCmd(oscillateCmds.single), 'Vibrate:6;');

      final constrictCmds = handler.handleOutputConstrictCmd(
        featureIndex: 0,
        featureId: 'c0',
        level: 2,
      );
      expect(_decodeCmd(constrictCmds.single), 'Air:Level:2;');
    });

    test('multi actuator emits Mply with correct arity', () {
      final handler = LovenseMultiActuator(outputCount: 3);

      final cmds = handler.handleOutputVibrateCmd(
        featureIndex: 1,
        featureId: 'v1',
        speed: 9,
      );
      final cmdString = _decodeCmd(cmds.single);
      final parts = cmdString.replaceAll(';', '').split(':');

      expect(parts.first, 'Mply');
      expect(parts.length, 4);
    });

    test('multi actuator retains per-actuator state across calls', () {
      final handler = LovenseMultiActuator(outputCount: 2);

      handler.handleOutputVibrateCmd(
        featureIndex: 0,
        featureId: 'v0',
        speed: 10,
      );
      final cmds = handler.handleOutputVibrateCmd(
        featureIndex: 1,
        featureId: 'v1',
        speed: 5,
      );

      expect(_decodeCmd(cmds.single), 'Mply:10:5;');
    });

    test('multi actuator sends Mply:0:0 when both actuators stop', () {
      final handler = LovenseMultiActuator(outputCount: 2);

      handler.handleOutputVibrateCmd(
        featureIndex: 0,
        featureId: 'v0',
        speed: 10,
      );
      handler.handleOutputVibrateCmd(
        featureIndex: 1,
        featureId: 'v1',
        speed: 5,
      );
      handler.handleOutputVibrateCmd(
        featureIndex: 0,
        featureId: 'v0',
        speed: 0,
      );
      final cmds = handler.handleOutputVibrateCmd(
        featureIndex: 1,
        featureId: 'v1',
        speed: 0,
      );

      expect(_decodeCmd(cmds.single), 'Mply:0:0;');
    });

    test('rotate vibrator sends rotate change on direction switch', () {
      final handler = LovenseRotateVibrator();

      final cmds = handler.handleOutputRotateCmd(
        featureIndex: 0,
        featureId: 'r0',
        speed: -10,
      );
      expect(cmds.length, 2);
      expect(_decodeCmd(cmds.first), 'RotateChange;');
      expect(_decodeCmd(cmds.last), 'Rotate:10;');

      final noChange = handler.handleOutputRotateCmd(
        featureIndex: 0,
        featureId: 'r0',
        speed: -5,
      );
      expect(noChange.length, 1);
      expect(_decodeCmd(noChange.single), 'Rotate:5;');
    });

    test('stroker maps oscillate and stores linear info', () {
      final hardware = TestHardware(name: 'test-device', connected: false);
      final handler = LovenseStroker(
        hardware: hardware,
        needRangeZerod: true,
      );

      final positionCmds = handler.handleOutputPositionWithDurationCmd(
        featureIndex: 0,
        featureId: 'p0',
        position: 30,
        duration: 400,
      );
      expect(positionCmds, isEmpty);
      expect(handler.linearInfo, (30, 400));

      final oscillateCmds = handler.handleOutputOscillateCmd(
        featureIndex: 0,
        featureId: 'o0',
        speed: 0,
      );
      expect(_decodeCmd(oscillateCmds.single), 'Mply:0:0;');
    });
  });
}
