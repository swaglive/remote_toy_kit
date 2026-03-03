import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_input.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_input_properties.dart';
import 'package:remote_toy_kit/src/configuration/attribute/range_inclusive.dart';
import 'package:remote_toy_kit/src/core/message/input_type.dart';
import 'package:remote_toy_kit/src/core/message/input_cmd_type.dart';

void main() {
  group('DeviceFeatureInput', () {
    group('fromJson', () {
      group('battery input type', () {
        test('should parse battery input with Read command', () {
          // Example from buttplug-device-config-v4.json:
          // "battery": {
          //   "command": ["Read"],
          //   "value": [[0, 100]]
          // }
          final json = {
            'battery': {
              'command': ['Read'],
              'value': [
                [0, 100]
              ],
            },
          };

          final result = DeviceFeatureInput.fromJson(json);

          expect(result.battery, isNotNull);
          expect(result.battery!.command, {InputCommandType.read});
          expect(result.battery!.value.length, 1);
          expect(
            result.battery!.value[0],
            const RangeInclusive(start: 0, end: 100),
          );
        });

        test('should parse battery input with Subscribe command', () {
          final json = {
            'battery': {
              'command': ['Subscribe'],
              'value': [
                [0, 100]
              ],
            },
          };

          final result = DeviceFeatureInput.fromJson(json);

          expect(result.battery, isNotNull);
          expect(result.battery!.command, {InputCommandType.subscribe});
        });

        test('should parse battery input with multiple commands', () {
          final json = {
            'battery': {
              'command': ['Read', 'Subscribe'],
              'value': [
                [0, 100]
              ],
            },
          };

          final result = DeviceFeatureInput.fromJson(json);

          expect(result.battery, isNotNull);
          expect(result.battery!.command,
              {InputCommandType.read, InputCommandType.subscribe});
        });

        test('should parse battery input with multiple value ranges', () {
          final json = {
            'battery': {
              'command': ['Read'],
              'value': [
                [0, 100],
                [0, 255],
              ],
            },
          };

          final result = DeviceFeatureInput.fromJson(json);

          expect(result.battery, isNotNull);
          expect(result.battery!.value.length, 2);
          expect(
            result.battery!.value[0],
            const RangeInclusive(start: 0, end: 100),
          );
          expect(
            result.battery!.value[1],
            const RangeInclusive(start: 0, end: 255),
          );
        });
      });

      group('rssi input type', () {
        test('should parse rssi input', () {
          final json = {
            'rssi': {
              'command': ['Read'],
              'value': [
                [-100, 0]
              ],
            },
          };

          final result = DeviceFeatureInput.fromJson(json);

          expect(result.rssi, isNotNull);
          expect(result.rssi!.command, {InputCommandType.read});
          expect(result.rssi!.value.length, 1);
          expect(
            result.rssi!.value[0],
            const RangeInclusive(start: -100, end: 0),
          );
        });
      });

      group('button input type', () {
        test('should parse button input', () {
          final json = {
            'button': {
              'command': ['Subscribe'],
              'value': [
                [0, 1]
              ],
            },
          };

          final result = DeviceFeatureInput.fromJson(json);

          expect(result.button, isNotNull);
          expect(result.button!.command, {InputCommandType.subscribe});
          expect(result.button!.value.length, 1);
          expect(
            result.button!.value[0],
            const RangeInclusive(start: 0, end: 1),
          );
        });
      });

      group('pressure input type', () {
        test('should parse pressure input', () {
          final json = {
            'pressure': {
              'command': ['Read', 'Subscribe'],
              'value': [
                [0, 1000]
              ],
            },
          };

          final result = DeviceFeatureInput.fromJson(json);

          expect(result.pressure, isNotNull);
          expect(result.pressure!.command,
              {InputCommandType.read, InputCommandType.subscribe});
          expect(result.pressure!.value.length, 1);
          expect(
            result.pressure!.value[0],
            const RangeInclusive(start: 0, end: 1000),
          );
        });
      });

      group('multiple input types', () {
        test('should parse multiple input types', () {
          final json = {
            'battery': {
              'command': ['Read'],
              'value': [
                [0, 100]
              ],
            },
            'rssi': {
              'command': ['Read'],
              'value': [
                [-100, 0]
              ],
            },
          };

          final result = DeviceFeatureInput.fromJson(json);

          expect(result.battery, isNotNull);
          expect(result.rssi, isNotNull);
          expect(result.button, isNull);
          expect(result.pressure, isNull);
        });
      });

      group('edge cases', () {
        test('should return null for unknown input type', () {
          final json = {
            'unknown_type': {
              'command': ['Read'],
              'value': [
                [0, 100]
              ],
            },
          };

          final result = DeviceFeatureInput.fromJson(json);

          expect(result.battery, isNull);
          expect(result.rssi, isNull);
          expect(result.button, isNull);
          expect(result.pressure, isNull);
        });

        test('should return all null when json is empty', () {
          final json = <String, dynamic>{};

          final result = DeviceFeatureInput.fromJson(json);

          expect(result.battery, isNull);
          expect(result.rssi, isNull);
          expect(result.button, isNull);
          expect(result.pressure, isNull);
        });
      });
    });

    group('contains', () {
      test('should return true when input type exists', () {
        const input = DeviceFeatureInput(
          battery: DeviceFeatureInputProperties(
            command: {InputCommandType.read},
            value: [RangeInclusive(start: 0, end: 100)],
          ),
        );

        expect(input.contains(InputType.battery), isTrue);
        expect(input.contains(InputType.rssi), isFalse);
        expect(input.contains(InputType.button), isFalse);
        expect(input.contains(InputType.pressure), isFalse);
      });

      test('should return false for unknown input type', () {
        const input = DeviceFeatureInput(
          battery: DeviceFeatureInputProperties(
            command: {InputCommandType.read},
            value: [RangeInclusive(start: 0, end: 100)],
          ),
        );

        expect(input.contains(InputType.unknown), isFalse);
      });

      test('should return true for all existing input types', () {
        const input = DeviceFeatureInput(
          battery: DeviceFeatureInputProperties(
            command: {InputCommandType.read},
            value: [RangeInclusive(start: 0, end: 100)],
          ),
          rssi: DeviceFeatureInputProperties(
            command: {InputCommandType.read},
            value: [RangeInclusive(start: -100, end: 0)],
          ),
          button: DeviceFeatureInputProperties(
            command: {InputCommandType.subscribe},
            value: [RangeInclusive(start: 0, end: 1)],
          ),
          pressure: DeviceFeatureInputProperties(
            command: {InputCommandType.read},
            value: [RangeInclusive(start: 0, end: 1000)],
          ),
        );

        expect(input.contains(InputType.battery), isTrue);
        expect(input.contains(InputType.rssi), isTrue);
        expect(input.contains(InputType.button), isTrue);
        expect(input.contains(InputType.pressure), isTrue);
      });
    });

    group('getProperties', () {
      test('should return properties when input type exists', () {
        const batteryProps = DeviceFeatureInputProperties(
          command: {InputCommandType.read},
          value: [RangeInclusive(start: 0, end: 100)],
        );
        const input = DeviceFeatureInput(battery: batteryProps);

        final result = input.tryFrom(InputType.battery);

        expect(result, isNotNull);
        expect(result, equals(batteryProps));
      });

      test('should return null when input type does not exist', () {
        const input = DeviceFeatureInput(
          battery: DeviceFeatureInputProperties(
            command: {InputCommandType.read},
            value: [RangeInclusive(start: 0, end: 100)],
          ),
        );

        expect(input.tryFrom(InputType.rssi), isNull);
        expect(input.tryFrom(InputType.button), isNull);
        expect(input.tryFrom(InputType.pressure), isNull);
      });

      test('should return null for unknown input type', () {
        const input = DeviceFeatureInput(
          battery: DeviceFeatureInputProperties(
            command: {InputCommandType.read},
            value: [RangeInclusive(start: 0, end: 100)],
          ),
        );

        expect(input.tryFrom(InputType.unknown), isNull);
      });

      test('should return correct properties for each input type', () {
        const batteryProps = DeviceFeatureInputProperties(
          command: {InputCommandType.read},
          value: [RangeInclusive(start: 0, end: 100)],
        );
        const rssiProps = DeviceFeatureInputProperties(
          command: {InputCommandType.read},
          value: [RangeInclusive(start: -100, end: 0)],
        );
        const buttonProps = DeviceFeatureInputProperties(
          command: {InputCommandType.subscribe},
          value: [RangeInclusive(start: 0, end: 1)],
        );
        const pressureProps = DeviceFeatureInputProperties(
          command: {InputCommandType.read, InputCommandType.subscribe},
          value: [RangeInclusive(start: 0, end: 1000)],
        );

        const input = DeviceFeatureInput(
          battery: batteryProps,
          rssi: rssiProps,
          button: buttonProps,
          pressure: pressureProps,
        );

        expect(input.tryFrom(InputType.battery), equals(batteryProps));
        expect(input.tryFrom(InputType.rssi), equals(rssiProps));
        expect(input.tryFrom(InputType.button), equals(buttonProps));
        expect(input.tryFrom(InputType.pressure), equals(pressureProps));
      });
    });
  });
}
