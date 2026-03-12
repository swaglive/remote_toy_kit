import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_output.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_output_properties.dart';
import 'package:remote_toy_kit/src/configuration/attribute/protocol_attributes.dart';
import 'package:remote_toy_kit/src/configuration/attribute/range_inclusive.dart';
import 'package:remote_toy_kit/src/core/exceptions.dart';
import 'package:remote_toy_kit/src/core/message/v4/checked_output_cmd.dart';
import 'package:remote_toy_kit/src/core/message/v4/output_cmd.dart';

ProtocolAttributes _attributes({
  List<DeviceFeature>? features,
}) =>
    ProtocolAttributes(name: 'test-device', features: features);

DeviceFeature _vibrateFeature({
  RangeInclusive range = const RangeInclusive(start: 0, end: 20),
}) =>
    DeviceFeature(
      id: 'vibrate-0',
      index: 0,
      output: DeviceFeatureOutput(
        vibrate: DeviceFeatureOutputValueProperties(value: range),
      ),
    );

void main() {
  group('CheckedOutputCmd.tryFromDeviceAttributes', () {
    test('creates checked command for matching vibrate feature', () {
      // Arrange
      final attributes = _attributes(features: [_vibrateFeature()]);
      const cmd = OutputCmd.v4(
        featureIndex: 0,
        command: OutputCommand.vibrate(
          outputValue: OutputValue(value: 10),
        ),
      );

      // Act
      final checked = CheckedOutputCmd.tryFromDeviceAttributes(
        cmd,
        attributes,
      );

      // Assert
      expect(checked, isA<CheckedOutputCmdV4>());
      expect(checked.featureIndex, 0);
      expect(checked.featureId, 'vibrate-0');
      expect(checked.command, isA<OutputCommandVibrate>());
      expect(checked.command.value, 10);
    });

    test('calculates scaled value through output properties', () {
      // Arrange: range 1..20, input value 5 => calculateScaledValue(5) => 5
      final attributes = _attributes(features: [
        _vibrateFeature(range: const RangeInclusive(start: 1, end: 20)),
      ]);
      const cmd = OutputCmd.v4(
        featureIndex: 0,
        command: OutputCommand.vibrate(
          outputValue: OutputValue(value: 5),
        ),
      );

      // Act
      final checked = CheckedOutputCmd.tryFromDeviceAttributes(
        cmd,
        attributes,
      );

      // Assert
      expect(checked.command.value, 5);
    });

    test('throws when features list is null', () {
      // Arrange
      final attributes = _attributes(features: null);
      const cmd = OutputCmd.v4(
        featureIndex: 0,
        command: OutputCommand.vibrate(
          outputValue: OutputValue(value: 5),
        ),
      );

      // Act & Assert
      expect(
        () => CheckedOutputCmd.tryFromDeviceAttributes(cmd, attributes),
        throwsA(
          isA<RemoteToyDeviceException>().having(
            (e) => e.code,
            'code',
            RemoteToyDeviceException.codeDeviceNoFeatures,
          ),
        ),
      );
    });

    test('throws when no feature supports the output type', () {
      // Arrange: feature has vibrate, but command is rotate
      final attributes = _attributes(features: [_vibrateFeature()]);
      const cmd = OutputCmd.v4(
        featureIndex: 0,
        command: OutputCommand.rotate(
          outputValue: OutputValue(value: 5),
        ),
      );

      // Act & Assert
      expect(
        () => CheckedOutputCmd.tryFromDeviceAttributes(cmd, attributes),
        throwsA(
          isA<RemoteToyDeviceException>().having(
            (e) => e.code,
            'code',
            RemoteToyDeviceException.codeDeviceFeatureNotFound,
          ),
        ),
      );
    });

    test('value of zero produces zero output', () {
      // Arrange
      final attributes = _attributes(features: [_vibrateFeature()]);
      const cmd = OutputCmd.v4(
        featureIndex: 0,
        command: OutputCommand.vibrate(
          outputValue: OutputValue(value: 0),
        ),
      );

      // Act
      final checked = CheckedOutputCmd.tryFromDeviceAttributes(
        cmd,
        attributes,
      );

      // Assert
      expect(checked.command.value, 0);
    });
  });
}
