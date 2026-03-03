import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/core/hardware/hardware.dart';
import 'package:remote_toy_kit/src/core/message/message.dart';
import 'package:remote_toy_kit/src/core/protocol/lovense/lovense.dart';
import '../../../support/test_hardware.dart';

void main() {
  group('LovenseIdentifier', () {
    late TestHardware hardware;

    setUp(() {
      hardware = TestHardware(name: 'LVS-AB12', connected: true);
    });

    tearDown(() async {
      await hardware.dispose();
    });

    test('identifies EI-FW3 from device type response', () async {
      hardware.onWrite = (_) async {
        hardware.emit(
          HardwareEvent.notification(
            id: 'device-1',
            endpoint: Endpoint.rx,
            data: Uint8List.fromList(utf8.encode('EI:3')),
          ),
        );
      };

      final identifier = LovenseIdentifier();
      final result = await identifier.identify(hardware: hardware);

      expect(result.protocolName, 'lovense');
      expect(result.modelIdentifier, 'EI-FW3');
      final initializer = result.initializer as LovenseInitializer;
      expect(initializer.deviceType, 'EI-FW3');

      final cmd = hardware.writes.single;
      expect(utf8.decode(cmd.data), 'DeviceType;');
    });

    test('falls back to hardware name when device type read fails', () async {
      hardware.name = 'LVS-XY99';
      hardware.onWrite = (_) async => throw Exception('write failed');

      final identifier = LovenseIdentifier();
      final result = await identifier.identify(hardware: hardware);

      expect(result.protocolName, 'lovense');
      expect(result.modelIdentifier, 'XY');
      final initializer = result.initializer as LovenseInitializer;
      expect(initializer.deviceType, 'XY');
    });

    test('returns default device type on invalid response', () async {
      hardware.onWrite = (_) async {
        hardware.emit(
          HardwareEvent.notification(
            id: 'device-2',
            endpoint: Endpoint.rx,
            data: Uint8List.fromList(utf8.encode('InvalidResponse')),
          ),
        );
      };

      final identifier = LovenseIdentifier();
      final result = await identifier.identify(hardware: hardware);

      expect(result.protocolName, 'lovense');
      expect(result.modelIdentifier, 'lovense');
      final initializer = result.initializer as LovenseInitializer;
      expect(initializer.deviceType, 'lovense');
    });
  });
}
