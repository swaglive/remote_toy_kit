import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/core/hardware/hardware.dart';
import 'package:remote_toy_kit/src/core/protocol/svakom_v5.dart';

Uint8List _dataFromCmd(List<HardwareCmd> cmds) {
  final cmd = cmds.single as HardwareWriteCmd;
  return cmd.data;
}

void main() {
  group('SvakomV5 handlers', () {
    test('vibrate uses channel 0 for mode 0x01', () {
      final handler = SvakomV5();

      final data = _dataFromCmd(
        handler.handleScalarVibrateCmd(index: 0, scalar: 10),
      );

      expect(
        data,
        orderedEquals([0x55, 0x03, 0x01, 0x00, 0x01, 10]),
      );
    });

    test('vibrate uses channel 1 for mode 0x02', () {
      final handler = SvakomV5();

      final data = _dataFromCmd(
        handler.handleScalarVibrateCmd(index: 1, scalar: 20),
      );

      expect(
        data,
        orderedEquals([0x55, 0x03, 0x02, 0x00, 0x01, 20]),
      );
    });

    test('vibrate uses mode 0x00 when both channels active', () {
      final handler = SvakomV5();

      handler.handleScalarVibrateCmd(index: 0, scalar: 5);
      final data = _dataFromCmd(
        handler.handleScalarVibrateCmd(index: 1, scalar: 8),
      );

      expect(
        data,
        orderedEquals([0x55, 0x03, 0x00, 0x00, 0x01, 8]),
      );
    });

    test('vibrate disables output when all channels stop', () {
      final handler = SvakomV5();

      final data = _dataFromCmd(
        handler.handleOutputVibrateCmd(
          featureIndex: 0,
          featureId: 'v0',
          speed: 0,
        ),
      );

      expect(
        data,
        orderedEquals([0x55, 0x03, 0x00, 0x00, 0x00, 0x00]),
      );
    });

    test('vibrate clamps out-of-range index to previous state', () {
      final handler = SvakomV5();

      final data = _dataFromCmd(
        handler.handleScalarVibrateCmd(index: 2, scalar: 200),
      );

      expect(
        data,
        orderedEquals([0x55, 0x03, 0x00, 0x00, 0x00, 0x00]),
      );
    });

    test('oscillate clamps speed and builds command', () {
      final handler = SvakomV5();

      final data = _dataFromCmd(
        handler.handleOutputOscillateCmd(
          featureIndex: 0,
          featureId: 'o0',
          speed: 300,
        ),
      );

      expect(
        data,
        orderedEquals([0x55, 0x09, 0x00, 0x00, 0xff, 0x00]),
      );
    });
  });
}
