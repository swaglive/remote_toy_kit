import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/core/hardware/hardware.dart';
import 'package:remote_toy_kit/src/core/message/message.dart';
import 'package:remote_toy_kit/src/core/protocol/lovense/lovense_base.dart';
import '../../../support/test_hardware.dart';

void main() {
  group('LovenseBase', () {
    late TestHardware hardware;
    late LovenseBase handler;

    setUp(() {
      hardware = TestHardware(name: 'test-device', connected: true);
      handler = LovenseBase();
    });

    tearDown(() async {
      await hardware.dispose();
    });

    test('reads battery level from notification', () async {
      hardware.onWrite = (_) async {
        hardware.emit(
          HardwareEvent.notification(
            id: 'device-1',
            endpoint: Endpoint.rx,
            data: Uint8List.fromList(utf8.encode('s64;')),
          ),
        );
      };

      final message = await handler.handleInputBatteryLevelCmd(
        hardware: hardware,
        featureIndex: 1,
        featureId: 'battery',
        inputType: InputType.battery,
      );

      expect(message, isA<RemoteToyServerReadingMessage>());
      final reading = message as RemoteToyServerReadingMessage;
      expect(reading.featureIndex, 1);
      expect(reading.inputType, InputType.battery);
      expect(reading.data, Uint8List.fromList([64]));

      final cmd = hardware.writes.single;
      expect(utf8.decode(cmd.data), 'Battery;');
    });

    test('returns empty data when battery parsing fails', () async {
      hardware.onWrite = (_) async {
        hardware.emit(
          HardwareEvent.notification(
            id: 'device-2',
            endpoint: Endpoint.rx,
            data: Uint8List.fromList(utf8.encode('sOK;')),
          ),
        );
      };

      final message = await handler.handleInputBatteryLevelCmd(
        hardware: hardware,
        featureIndex: 0,
        featureId: 'battery',
        inputType: InputType.battery,
      );

      expect(message, isA<RemoteToyServerReadingMessage>());
      final reading = message as RemoteToyServerReadingMessage;
      expect(reading.data, Uint8List(0));
    });
  });
}
