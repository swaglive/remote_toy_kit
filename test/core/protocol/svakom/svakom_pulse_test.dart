import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/core/hardware/hardware.dart';
import 'package:remote_toy_kit/src/core/protocol/svakom_pulse.dart';

Uint8List _dataFromCmd(List<HardwareCmd> cmds) {
  final cmd = cmds.single as HardwareWriteCmd;
  return cmd.data;
}

void main() {
  group('SvakomPulse handlers', () {
    test('vibrate builds mode and level from scalar', () {
      final handler = SvakomPulse();

      final data = _dataFromCmd(
        handler.handleScalarVibrateCmd(index: 0, scalar: 10),
      );

      expect(
        data,
        orderedEquals([0x55, 0x03, 0x03, 0x00, 0x01, 11]),
      );
    });

    test('vibrate turns off with zero speed', () {
      final handler = SvakomPulse();

      final data = _dataFromCmd(
        handler.handleOutputVibrateCmd(
          featureIndex: 0,
          featureId: 'v0',
          speed: 0,
        ),
      );

      expect(
        data,
        orderedEquals([0x55, 0x03, 0x03, 0x00, 0x00, 0x01]),
      );
    });

    test('vibrate wraps level at max speed', () {
      final handler = SvakomPulse();

      final data = _dataFromCmd(
        handler.handleScalarVibrateCmd(index: 0, scalar: 255),
      );

      expect(
        data,
        orderedEquals([0x55, 0x03, 0x03, 0x00, 0x01, 0x00]),
      );
    });

    test('vibrate clamps negative speed', () {
      final handler = SvakomPulse();

      final data = _dataFromCmd(
        handler.handleScalarVibrateCmd(index: 0, scalar: -5),
      );

      expect(
        data,
        orderedEquals([0x55, 0x03, 0x03, 0x00, 0x00, 0x01]),
      );
    });
  });
}
