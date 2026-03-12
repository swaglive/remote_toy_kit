import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/core/hardware/hardware.dart';
import 'package:remote_toy_kit/src/core/protocol/svakom/svakom_v5.dart';

Uint8List _dataFromCmd(List<HardwareCmd> cmds) {
  final cmd = cmds.single as HardwareWriteCmd;
  return cmd.data;
}

void main() {
  group('SvakomV5 handlers', () {
    test('vibrate single channel builds correct command', () {
      final handler = SvakomV5();

      final data = _dataFromCmd(
        handler.handleOutputVibrateCmd(
          featureIndex: 0,
          featureId: 'v0',
          speed: 10,
        ),
      );

      expect(
        data,
        orderedEquals([0x55, 0x03, 0x01, 0x00, 0x01, 10]),
      );
    });

    test('vibrate second channel builds correct command', () {
      final handler = SvakomV5();

      final data = _dataFromCmd(
        handler.handleOutputVibrateCmd(
          featureIndex: 1,
          featureId: 'v1',
          speed: 20,
        ),
      );

      expect(
        data,
        orderedEquals([0x55, 0x03, 0x02, 0x00, 0x01, 20]),
      );
    });

    test('vibrate uses mode 0x00 when both channels active', () {
      final handler = SvakomV5();

      handler.handleOutputVibrateCmd(
        featureIndex: 0,
        featureId: 'v0',
        speed: 5,
      );
      final data = _dataFromCmd(
        handler.handleOutputVibrateCmd(
          featureIndex: 1,
          featureId: 'v1',
          speed: 8,
        ),
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
