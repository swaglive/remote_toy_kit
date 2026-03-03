import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_output.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_output_properties.dart';
import 'package:remote_toy_kit/src/configuration/attribute/range_inclusive.dart';
import 'package:remote_toy_kit/src/core/message/output_type.dart';

void main() {
  group('DeviceFeatureOutput', () {
    group('fromJson', () {
      group('vibrate output type', () {
        test('should parse vibrate output', () {
          // Example from buttplug-device-config-v4.json:
          // "vibrate": {
          //   "value": [0, 100]
          // }
          final json = {
            'vibrate': {
              'value': [0, 100],
            },
          };

          final result = DeviceFeatureOutput.fromJson(json);

          expect(result.vibrate, isNotNull);
          expect(
            result.vibrate!.value,
            const RangeInclusive(start: 0, end: 100),
          );
        });

        test('should parse vibrate output with different range', () {
          final json = {
            'vibrate': {
              'value': [0, 255],
            },
          };

          final result = DeviceFeatureOutput.fromJson(json);

          expect(result.vibrate, isNotNull);
          expect(
            result.vibrate!.value,
            const RangeInclusive(start: 0, end: 255),
          );
        });
      });

      group('rotate output type', () {
        test('should parse rotate output', () {
          final json = {
            'rotate': {
              'value': [0, 100],
            },
          };

          final result = DeviceFeatureOutput.fromJson(json);

          expect(result.rotate, isNotNull);
          expect(
            result.rotate!.value,
            const RangeInclusive(start: 0, end: 100),
          );
        });
      });

      group('oscillate output type', () {
        test('should parse oscillate output', () {
          final json = {
            'oscillate': {
              'value': [0, 100],
            },
          };

          final result = DeviceFeatureOutput.fromJson(json);

          expect(result.oscillate, isNotNull);
          expect(
            result.oscillate!.value,
            const RangeInclusive(start: 0, end: 100),
          );
        });
      });

      group('constrict output type', () {
        test('should parse constrict output', () {
          final json = {
            'constrict': {
              'value': [0, 100],
            },
          };

          final result = DeviceFeatureOutput.fromJson(json);

          expect(result.constrict, isNotNull);
          expect(
            result.constrict!.value,
            const RangeInclusive(start: 0, end: 100),
          );
        });
      });

      group('temperature output type', () {
        test('should parse temperature output', () {
          final json = {
            'temperature': {
              'value': [0, 100],
            },
          };

          final result = DeviceFeatureOutput.fromJson(json);

          expect(result.temperature, isNotNull);
          expect(
            result.temperature!.value,
            const RangeInclusive(start: 0, end: 100),
          );
        });
      });

      group('led output type', () {
        test('should parse led output', () {
          final json = {
            'led': {
              'value': [0, 255],
            },
          };

          final result = DeviceFeatureOutput.fromJson(json);

          expect(result.led, isNotNull);
          expect(
            result.led!.value,
            const RangeInclusive(start: 0, end: 255),
          );
        });
      });

      group('position output type', () {
        test('should parse position output', () {
          final json = {
            'position': {
              'value': [0, 100],
            },
          };

          final result = DeviceFeatureOutput.fromJson(json);

          expect(result.position, isNotNull);
          expect(
            result.position!.value,
            const RangeInclusive(start: 0, end: 100),
          );
        });
      });

      group('positionWithDuration output type', () {
        test('should parse positionWithDuration output', () {
          // Example from buttplug-device-config-v4.json:
          // "positionWithDuration": {
          //   "value": [0, 100],
          //   "duration": [0, 1000]
          // }
          final json = {
            'positionWithDuration': {
              'value': [0, 100],
              'duration': [0, 1000],
            },
          };

          final result = DeviceFeatureOutput.fromJson(json);

          expect(result.positionWithDuration, isNotNull);
          expect(
            result.positionWithDuration!.value,
            const RangeInclusive(start: 0, end: 100),
          );
          expect(
            result.positionWithDuration!.duration,
            const RangeInclusive(start: 0, end: 1000),
          );
        });

        test('should parse positionWithDuration with different ranges', () {
          final json = {
            'positionWithDuration': {
              'value': [0, 255],
              'duration': [100, 5000],
            },
          };

          final result = DeviceFeatureOutput.fromJson(json);

          expect(result.positionWithDuration, isNotNull);
          expect(
            result.positionWithDuration!.value,
            const RangeInclusive(start: 0, end: 255),
          );
          expect(
            result.positionWithDuration!.duration,
            const RangeInclusive(start: 100, end: 5000),
          );
        });
      });

      group('spray output type', () {
        test('should parse spray output', () {
          final json = {
            'spray': {
              'value': [0, 100],
            },
          };

          final result = DeviceFeatureOutput.fromJson(json);

          expect(result.spray, isNotNull);
          expect(
            result.spray!.value,
            const RangeInclusive(start: 0, end: 100),
          );
        });
      });

      group('multiple output types', () {
        test('should parse multiple output types', () {
          final json = {
            'vibrate': {
              'value': [0, 100],
            },
            'rotate': {
              'value': [0, 100],
            },
          };

          final result = DeviceFeatureOutput.fromJson(json);

          expect(result.vibrate, isNotNull);
          expect(result.rotate, isNotNull);
          expect(result.oscillate, isNull);
          expect(result.constrict, isNull);
          expect(result.temperature, isNull);
          expect(result.led, isNull);
          expect(result.position, isNull);
          expect(result.positionWithDuration, isNull);
          expect(result.spray, isNull);
        });
      });

      group('edge cases', () {
        test('should return null for unknown output type', () {
          final json = {
            'unknown_type': {
              'value': [0, 100],
            },
          };

          final result = DeviceFeatureOutput.fromJson(json);

          expect(result.vibrate, isNull);
          expect(result.rotate, isNull);
          expect(result.oscillate, isNull);
          expect(result.constrict, isNull);
          expect(result.temperature, isNull);
          expect(result.led, isNull);
          expect(result.position, isNull);
          expect(result.positionWithDuration, isNull);
          expect(result.spray, isNull);
        });

        test('should return all null when json is empty', () {
          final json = <String, dynamic>{};

          final result = DeviceFeatureOutput.fromJson(json);

          expect(result.vibrate, isNull);
          expect(result.rotate, isNull);
          expect(result.oscillate, isNull);
          expect(result.constrict, isNull);
          expect(result.temperature, isNull);
          expect(result.led, isNull);
          expect(result.position, isNull);
          expect(result.positionWithDuration, isNull);
          expect(result.spray, isNull);
        });
      });
    });

    group('contains', () {
      test('should return true when output type exists', () {
        const output = DeviceFeatureOutput(
          vibrate: DeviceFeatureOutputValueProperties(
            value: RangeInclusive(start: 0, end: 100),
          ),
        );

        expect(output.contains(OutputType.vibrate), isTrue);
        expect(output.contains(OutputType.rotate), isFalse);
        expect(output.contains(OutputType.oscillate), isFalse);
        expect(output.contains(OutputType.constrict), isFalse);
        expect(output.contains(OutputType.temperature), isFalse);
        expect(output.contains(OutputType.led), isFalse);
        expect(output.contains(OutputType.position), isFalse);
        expect(output.contains(OutputType.positionWithDuration), isFalse);
        expect(output.contains(OutputType.spray), isFalse);
      });

      test('should return false for unknown output type', () {
        const output = DeviceFeatureOutput(
          vibrate: DeviceFeatureOutputValueProperties(
            value: RangeInclusive(start: 0, end: 100),
          ),
        );

        expect(output.contains(OutputType.unknown), isFalse);
      });

      test('should return true for all existing output types', () {
        const output = DeviceFeatureOutput(
          vibrate: DeviceFeatureOutputValueProperties(
            value: RangeInclusive(start: 0, end: 100),
          ),
          rotate: DeviceFeatureOutputValueProperties(
            value: RangeInclusive(start: 0, end: 100),
          ),
          oscillate: DeviceFeatureOutputValueProperties(
            value: RangeInclusive(start: 0, end: 100),
          ),
          constrict: DeviceFeatureOutputValueProperties(
            value: RangeInclusive(start: 0, end: 100),
          ),
          temperature: DeviceFeatureOutputValueProperties(
            value: RangeInclusive(start: 0, end: 100),
          ),
          led: DeviceFeatureOutputValueProperties(
            value: RangeInclusive(start: 0, end: 255),
          ),
          position: DeviceFeatureOutputPositionProperties(
            value: RangeInclusive(start: 0, end: 100),
          ),
          positionWithDuration:
              DeviceFeatureOutputPositionWithDurationProperties(
            value: RangeInclusive(start: 0, end: 100),
            duration: RangeInclusive(start: 0, end: 1000),
          ),
          spray: DeviceFeatureOutputValueProperties(
            value: RangeInclusive(start: 0, end: 100),
          ),
        );

        expect(output.contains(OutputType.vibrate), isTrue);
        expect(output.contains(OutputType.rotate), isTrue);
        expect(output.contains(OutputType.oscillate), isTrue);
        expect(output.contains(OutputType.constrict), isTrue);
        expect(output.contains(OutputType.temperature), isTrue);
        expect(output.contains(OutputType.led), isTrue);
        expect(output.contains(OutputType.position), isTrue);
        expect(output.contains(OutputType.positionWithDuration), isTrue);
        expect(output.contains(OutputType.spray), isTrue);
      });
    });
  });
}
