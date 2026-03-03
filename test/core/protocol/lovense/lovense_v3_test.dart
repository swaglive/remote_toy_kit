import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/core/hardware/hardware.dart';
import 'package:remote_toy_kit/src/core/message/message.dart';
import 'package:remote_toy_kit/src/core/protocol/lovense/lovense_v3.dart';

String _decodeCmd(HardwareCmd cmd) {
  return utf8.decode((cmd as HardwareWriteCmd).data);
}

void main() {
  group('LovenseSpecV3', () {
    test('uses Mply with extra range for H devices', () {
      final handler = LovenseSpecV3(
        rotationDirection: false,
        vibratorCount: 1,
        useMply: true,
        deviceType: 'H',
        linearInfo: (0, 0),
      );

      final cmds = handler.handleScalarCmd(
        cmds: [(OutputType.vibrate, 5)],
      );

      expect(cmds.length, 1);
      expect(_decodeCmd(cmds.single), 'Mply:5:20;');
    });

    test('uses shared vibrate command when all speeds match', () {
      final handler = LovenseSpecV3(
        rotationDirection: false,
        vibratorCount: 2,
        useMply: false,
        deviceType: 'A',
        linearInfo: (0, 0),
      );

      final cmds = handler.handleScalarCmd(
        cmds: [
          (OutputType.vibrate, 7),
          (OutputType.vibrate, 7),
        ],
      );

      expect(cmds.length, 1);
      expect(_decodeCmd(cmds.single), 'Vibrate:7;');
    });

    test('uses indexed vibrate commands when speeds differ', () {
      final handler = LovenseSpecV3(
        rotationDirection: false,
        vibratorCount: 2,
        useMply: false,
        deviceType: 'A',
        linearInfo: (0, 0),
      );

      final cmds = handler.handleScalarCmd(
        cmds: [
          (OutputType.vibrate, 4),
          (OutputType.vibrate, 9),
        ],
      );

      expect(cmds.length, 2);
      expect(_decodeCmd(cmds[0]), 'Vibrate0:4;');
      expect(_decodeCmd(cmds[1]), 'Vibrate1:9;');
    });

    test('sends rotate change when direction flips', () {
      final handler = LovenseSpecV3(
        rotationDirection: false,
        vibratorCount: 1,
        useMply: false,
        deviceType: 'A',
        linearInfo: (0, 0),
      );

      final cmds = handler.handleRotateCmd(
        cmds: [(5, true)],
      );
      expect(cmds.length, 2);
      expect(_decodeCmd(cmds.first), 'Rotate:5;');
      expect(_decodeCmd(cmds.last), 'RotateChange;');

      final sameDirection = handler.handleRotateCmd(
        cmds: [(3, true)],
      );
      expect(sameDirection.length, 1);
      expect(_decodeCmd(sameDirection.single), 'Rotate:3;');
    });

    test('updates linear info on linear commands', () {
      final handler = LovenseSpecV3(
        rotationDirection: false,
        vibratorCount: 1,
        useMply: false,
        deviceType: 'A',
        linearInfo: (0, 0),
      );

      final message = LinearCmdClientMessage(
        vectors: [
          VectorSubcommand(
            featureIndex: 0,
            duration: const Duration(milliseconds: 200),
            position: 0.5,
          ),
        ],
      );

      final cmds = handler.handleLinearCmd(message: message);
      expect(cmds, isEmpty);
      expect(handler.linearInfo, (50, 200));
    });
  });
}
