import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_output_properties.dart';
import 'package:remote_toy_kit/src/configuration/attribute/range_inclusive.dart';

void main() {
  group('DeviceFeatureOutputValueProperties', () {
    group('fromJson', () {
      test('should parse with value range', () {
        final json = {
          'value': [0, 100],
        };

        final result = DeviceFeatureOutputValueProperties.fromJson(json);

        expect(result.value, const RangeInclusive(start: 0, end: 100));
      });

      test('should parse with different value range', () {
        final json = {
          'value': [0, 255],
        };

        final result = DeviceFeatureOutputValueProperties.fromJson(json);

        expect(result.value, const RangeInclusive(start: 0, end: 255));
      });

      test('should parse vibrator output example from config', () {
        // Example from buttplug-device-config-v4.json:
        // "vibrate": {
        //   "value": [0, 100]
        // }
        final json = {
          'value': [0, 100],
        };

        final result = DeviceFeatureOutputValueProperties.fromJson(json);

        expect(result.value.start, 0);
        expect(result.value.end, 100);
      });
    });

    group('toJson', () {
      test('should serialize to JSON correctly', () {
        const properties = DeviceFeatureOutputValueProperties(
          value: RangeInclusive(start: 0, end: 100),
        );

        final json = properties.toJson();

        expect(json['value'], [0, 100]);
      });

      test('should serialize different value range', () {
        const properties = DeviceFeatureOutputValueProperties(
          value: RangeInclusive(start: 0, end: 255),
        );

        final json = properties.toJson();

        expect(json['value'], [0, 255]);
      });
    });
  });

  group('DeviceFeatureOutputPropertiesWithDurationProperties', () {
    group('fromJson', () {
      test('should parse with value and duration ranges', () {
        final json = {
          'value': [0, 100],
          'duration': [0, 1000],
        };

        final result =
            DeviceFeatureOutputPositionWithDurationProperties.fromJson(json);

        expect(result.value, const RangeInclusive(start: 0, end: 100));
        expect(result.duration, const RangeInclusive(start: 0, end: 1000));
      });

      test('should parse with different value and duration ranges', () {
        final json = {
          'value': [0, 255],
          'duration': [100, 5000],
        };

        final result =
            DeviceFeatureOutputPositionWithDurationProperties.fromJson(json);

        expect(result.value, const RangeInclusive(start: 0, end: 255));
        expect(result.duration, const RangeInclusive(start: 100, end: 5000));
      });

      test('should parse position output example from config', () {
        // Example from buttplug-device-config-v4.json:
        // "position": {
        //   "value": [0, 100],
        //   "duration": [0, 1000]
        // }
        final json = {
          'value': [0, 100],
          'duration': [0, 1000],
        };

        final result =
            DeviceFeatureOutputPositionWithDurationProperties.fromJson(json);

        expect(result.value.start, 0);
        expect(result.value.end, 100);
        expect(result.duration.start, 0);
        expect(result.duration.end, 1000);
      });
    });

    group('toJson', () {
      test('should serialize to JSON correctly', () {
        const properties = DeviceFeatureOutputPositionWithDurationProperties(
          value: RangeInclusive(start: 0, end: 100),
          duration: RangeInclusive(start: 0, end: 1000),
        );

        final json = properties.toJson();

        expect(json['value'], [0, 100]);
        expect(json['duration'], [0, 1000]);
      });

      test('should serialize different value and duration ranges', () {
        const properties = DeviceFeatureOutputPositionWithDurationProperties(
          value: RangeInclusive(start: 0, end: 255),
          duration: RangeInclusive(start: 100, end: 5000),
        );

        final json = properties.toJson();

        expect(json['value'], [0, 255]);
        expect(json['duration'], [100, 5000]);
      });
    });
  });
}
