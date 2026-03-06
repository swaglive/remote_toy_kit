import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/configuration/configuration.dart';
import 'package:remote_toy_kit/src/core/message/message.dart';
import 'package:remote_toy_kit/src/core/protocol/lovense/lovense.dart';
import '../../../support/test_hardware.dart';

DeviceFeature _feature(FeatureType type) {
  return DeviceFeature.v3(
    description: '',
    featureType: type,
    actuator: const DeviceFeatureActuator(
      stepRange: RangeInclusive(start: 0, end: 100),
      messages: {ActuatorFeatureMessageType.scalarCmd},
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

    test('returns spec v3 handler when not spec v4', () async {
      final attributes = _attributes([_feature(FeatureType.vibrate)]);
      const initializer = LovenseInitializer(deviceType: 'A');

      final handler = await initializer.initialize(
        hardware: hardware,
        protocolAttributes: attributes,
        isSpecV4: false,
      );

      expect(handler, isA<LovenseSpecV3>());
      final spec = handler as LovenseSpecV3;
      expect(spec.deviceType, 'A');
    });

    test('returns stroker for H device type', () async {
      final attributes = _attributes([]);
      const initializer = LovenseInitializer(deviceType: 'H');

      final handler = await initializer.initialize(
        hardware: hardware,
        protocolAttributes: attributes,
        isSpecV4: true,
      );

      expect(handler, isA<LovenseStroker>());
    });

    test('returns single actuator for one output', () async {
      final attributes = _attributes([_feature(FeatureType.vibrate)]);
      const initializer = LovenseInitializer(deviceType: 'X');

      final handler = await initializer.initialize(
        hardware: hardware,
        protocolAttributes: attributes,
        isSpecV4: true,
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
        isSpecV4: true,
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
        isSpecV4: true,
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
        isSpecV4: true,
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
        isSpecV4: true,
      );

      expect(handler, isA<LovenseDualActuator>());
    });
  });
}
