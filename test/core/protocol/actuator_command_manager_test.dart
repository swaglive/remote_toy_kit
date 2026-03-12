import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_output.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_output_properties.dart';
import 'package:remote_toy_kit/src/configuration/attribute/range_inclusive.dart';
import 'package:remote_toy_kit/src/core/message/client/client_message.dart';
import 'package:remote_toy_kit/src/core/message/v4/output_cmd.dart';
import 'package:remote_toy_kit/src/core/protocol/actuator_command_manager.dart';

DeviceFeature _v4Feature({
  DeviceFeatureOutput? output,
  String id = 'f0',
  int index = 0,
}) =>
    DeviceFeature(
      id: id,
      index: index,
      output: output,
    );

void main() {
  group('ActuatorCommandManager factory', () {
    test('generates stop commands for vibrate feature', () {
      final features = [
        _v4Feature(
          output: const DeviceFeatureOutput(
            vibrate: DeviceFeatureOutputValueProperties(
              value: RangeInclusive(start: 0, end: 20),
            ),
          ),
        ),
      ];

      final manager = ActuatorCommandManager(features: features);

      expect(manager.stopCommands, isNotEmpty);
      final stopCmd = manager.stopCommands.first as OutputCmdClientMessage;
      final outputCmd = stopCmd.command as OutputCmdV4;
      expect(outputCmd.command, isA<OutputCommandVibrate>());
      expect(outputCmd.command.value, 0);
    });

    test('skips features without output', () {
      final features = [
        _v4Feature(output: null),
      ];

      final manager = ActuatorCommandManager(features: features);

      expect(manager.stopCommands, isEmpty);
    });

    test('generates multiple stop commands for multi-output features', () {
      final features = [
        _v4Feature(
          output: const DeviceFeatureOutput(
            vibrate: DeviceFeatureOutputValueProperties(
              value: RangeInclusive(start: 0, end: 20),
            ),
          ),
        ),
        _v4Feature(
          id: 'f1',
          index: 1,
          output: const DeviceFeatureOutput(
            rotate: DeviceFeatureOutputValueProperties(
              value: RangeInclusive(start: 0, end: 10),
            ),
          ),
        ),
      ];

      final manager = ActuatorCommandManager(features: features);

      expect(manager.stopCommands.length, 2);
    });
  });
}
