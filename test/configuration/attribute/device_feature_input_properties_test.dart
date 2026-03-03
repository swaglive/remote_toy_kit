import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_input_properties.dart';
import 'package:remote_toy_kit/src/configuration/attribute/range_inclusive.dart';
import 'package:remote_toy_kit/src/core/message/input_cmd_type.dart';

void main() {
  group('DeviceFeatureInputProperties', () {
    group('fromJson', () {
      test('should parse with single Read command', () {
        final json = {
          'command': ['Read'],
          'value': [
            [0, 100]
          ],
        };

        final result = DeviceFeatureInputProperties.fromJson(json);

        expect(result.command, {InputCommandType.read});
        expect(result.value.length, 1);
        expect(result.value[0], const RangeInclusive(start: 0, end: 100));
      });

      test('should parse with Subscribe command', () {
        final json = {
          'command': ['Subscribe'],
          'value': [
            [0, 100]
          ],
        };

        final result = DeviceFeatureInputProperties.fromJson(json);

        expect(result.command, {InputCommandType.subscribe});
      });

      test('should parse with Unsubscribe command', () {
        final json = {
          'command': ['Unsubscribe'],
          'value': [
            [0, 100]
          ],
        };

        final result = DeviceFeatureInputProperties.fromJson(json);

        expect(result.command, {InputCommandType.unsubscribe});
      });

      test('should parse with multiple commands', () {
        final json = {
          'command': ['Read', 'Subscribe', 'Unsubscribe'],
          'value': [
            [0, 100]
          ],
        };

        final result = DeviceFeatureInputProperties.fromJson(json);

        expect(result.command, {
          InputCommandType.read,
          InputCommandType.subscribe,
          InputCommandType.unsubscribe,
        });
      });

      test('should parse with multiple value ranges', () {
        final json = {
          'command': ['Read'],
          'value': [
            [0, 100],
            [-50, 50],
            [0, 255],
          ],
        };

        final result = DeviceFeatureInputProperties.fromJson(json);

        expect(result.value.length, 3);
        expect(result.value[0], const RangeInclusive(start: 0, end: 100));
        expect(result.value[1], const RangeInclusive(start: -50, end: 50));
        expect(result.value[2], const RangeInclusive(start: 0, end: 255));
      });

      test('should parse battery input example from config', () {
        // Example from buttplug-device-config-v4.json:
        // "battery": {
        //   "command": ["Read"],
        //   "value": [[0, 100]]
        // }
        final json = {
          'command': ['Read'],
          'value': [
            [0, 100]
          ],
        };

        final result = DeviceFeatureInputProperties.fromJson(json);

        expect(result.command, {InputCommandType.read});
        expect(result.value.length, 1);
        expect(result.value[0].start, 0);
        expect(result.value[0].end, 100);
      });

      test('should parse rssi input example', () {
        // RSSI typically has negative values
        final json = {
          'command': ['Read', 'Subscribe'],
          'value': [
            [-100, 0]
          ],
        };

        final result = DeviceFeatureInputProperties.fromJson(json);

        expect(result.command,
            {InputCommandType.read, InputCommandType.subscribe});
        expect(result.value[0], const RangeInclusive(start: -100, end: 0));
      });
    });

    group('toJson', () {
      test('should serialize to JSON correctly', () {
        const properties = DeviceFeatureInputProperties(
          command: {InputCommandType.read},
          value: [RangeInclusive(start: 0, end: 100)],
        );

        final json = properties.toJson();

        expect(json['command'], contains('Read'));
        expect(json['value'], [
          [0, 100]
        ]);
      });

      test('should serialize multiple commands', () {
        const properties = DeviceFeatureInputProperties(
          command: {InputCommandType.read, InputCommandType.subscribe},
          value: [RangeInclusive(start: 0, end: 100)],
        );

        final json = properties.toJson();

        expect(json['command'], containsAll(['Read', 'Subscribe']));
      });

      test('should serialize multiple value ranges', () {
        const properties = DeviceFeatureInputProperties(
          command: {InputCommandType.read},
          value: [
            RangeInclusive(start: 0, end: 100),
            RangeInclusive(start: -50, end: 50),
          ],
        );

        final json = properties.toJson();

        expect(json['value'], [
          [0, 100],
          [-50, 50],
        ]);
      });
    });
  });
}
