import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/configuration/configuration.dart';
import 'package:remote_toy_kit/src/core/message/message.dart';
import 'package:remote_toy_kit/src/core/protocol/lovense/lovense.dart';
import '../../../support/test_hardware.dart';

DeviceFeature _feature(FeatureType type) {
  return DeviceFeature(
    id: type.name,
    index: 0,
    output: DeviceFeatureOutput(
      vibrate: type == FeatureType.vibrate
          ? const DeviceFeatureOutputValueProperties(
              value: RangeInclusive(start: 0, end: 100),
            )
          : null,
      rotate: type == FeatureType.rotate
          ? const DeviceFeatureOutputValueProperties(
              value: RangeInclusive(start: 0, end: 100),
            )
          : null,
      oscillate: type == FeatureType.oscillate
          ? const DeviceFeatureOutputValueProperties(
              value: RangeInclusive(start: 0, end: 100),
            )
          : null,
      constrict: type == FeatureType.constrict
          ? const DeviceFeatureOutputValueProperties(
              value: RangeInclusive(start: 0, end: 100),
            )
          : null,
    ),
  );
}

ProtocolAttributes _attributes(List<DeviceFeature> features) {
  return ProtocolAttributes(
    name: 'TestDevice',
    features: features,
  );
}

void main() {
  group('LovenseInitializer', () {
    late TestHardware hardware;

    setUp(() {
      hardware = TestHardware(name: 'test-device', connected: false);
    });

    test('returns stroker for H device type', () async {
      final attributes = _attributes([]);
      const initializer = LovenseInitializer(deviceType: 'H');

      final handler = await initializer.initialize(
        hardware: hardware,
        protocolAttributes: attributes,
      );

      expect(handler, isA<LovenseStroker>());
    });

    test('returns single actuator for one output', () async {
      final attributes = _attributes([_feature(FeatureType.vibrate)]);
      const initializer = LovenseInitializer(deviceType: 'X');

      final handler = await initializer.initialize(
        hardware: hardware,
        protocolAttributes: attributes,
      );

      expect(handler, isA<LovenseSingleActuator>());
    });

    test('returns Lovense Max when vibrate + constrict', () async {
      final attributes = _attributes(
        [_feature(FeatureType.vibrate), _feature(FeatureType.constrict)],
      );
      const initializer = LovenseInitializer(deviceType: 'MX');

      final handler = await initializer.initialize(
        hardware: hardware,
        protocolAttributes: attributes,
      );

      expect(handler, isA<LovenseMax>());
    });

    test('returns rotate vibrator when vibrate + rotate', () async {
      final attributes = _attributes(
        [_feature(FeatureType.vibrate), _feature(FeatureType.rotate)],
      );
      const initializer = LovenseInitializer(deviceType: 'RV');

      final handler = await initializer.initialize(
        hardware: hardware,
        protocolAttributes: attributes,
      );

      expect(handler, isA<LovenseRotateVibrator>());
    });

    test('returns multi actuator when useMply is true', () async {
      final attributes = _attributes(
        [
          _feature(FeatureType.vibrate),
          _feature(FeatureType.vibrate),
          _feature(FeatureType.rotate),
        ],
      );
      const initializer = LovenseInitializer(deviceType: 'A');

      final handler = await initializer.initialize(
        hardware: hardware,
        protocolAttributes: attributes,
      );

      expect(handler, isA<LovenseMultiActuator>());
    });

    test('returns dual actuator by default', () async {
      final attributes = _attributes(
        [
          _feature(FeatureType.vibrate),
          _feature(FeatureType.oscillate),
        ],
      );
      const initializer = LovenseInitializer(deviceType: 'A');

      final handler = await initializer.initialize(
        hardware: hardware,
        protocolAttributes: attributes,
      );

      expect(handler, isA<LovenseDualActuator>());
    });
  });
}
