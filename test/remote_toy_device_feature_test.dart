import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_output.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_output_properties.dart';
import 'package:remote_toy_kit/src/configuration/attribute/range_inclusive.dart';
import 'package:remote_toy_kit/src/core/exceptions.dart';
import 'package:remote_toy_kit/src/core/message/client/client_device_command_value.dart';
import 'package:remote_toy_kit/src/core/message/client/client_device_output_command.dart';
import 'package:remote_toy_kit/src/core/message/feature_type.dart';
import 'package:remote_toy_kit/src/core/message/v4/output_cmd.dart';
import 'package:remote_toy_kit/src/remote_toy_device_feature.dart';

DeviceFeatureV4 _v4VibrateFeature({
  RangeInclusive range = const RangeInclusive(start: 0, end: 20),
  int index = 0,
}) =>
    DeviceFeature.v4(
      id: 'vibrate-$index',
      index: index,
      output: DeviceFeatureOutput(
        vibrate: DeviceFeatureOutputValueProperties(value: range),
      ),
    ) as DeviceFeatureV4;

DeviceFeatureV4 _v4PositionWithDurationFeature({
  RangeInclusive valueRange = const RangeInclusive(start: 0, end: 100),
  RangeInclusive durationRange = const RangeInclusive(start: 0, end: 1000),
  int index = 0,
}) =>
    DeviceFeature.v4(
      id: 'poswd-$index',
      index: index,
      output: DeviceFeatureOutput(
        positionWithDuration: DeviceFeatureOutputPositionWithDurationProperties(
          value: valueRange,
          duration: durationRange,
        ),
      ),
    ) as DeviceFeatureV4;

void main() {
  group('RemoteToyDeviceFeature.fromConfig', () {
    test('uses feature own index when present (V4)', () {
      // Arrange
      final feature = _v4VibrateFeature(index: 7);

      // Act
      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 99);

      // Assert
      expect(deviceFeature.featureIndex, 7);
    });

    test('falls back to provided featureIndex for V3', () {
      // Arrange
      final feature = DeviceFeature.v3(featureType: FeatureType.vibrate);

      // Act
      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 3);

      // Assert
      expect(deviceFeature.featureIndex, 3);
    });
  });

  group('RemoteToyDeviceFeature.convertClientCmdtoOutputCmd', () {
    test('converts vibrate command with int value', () {
      // Arrange
      final feature = _v4VibrateFeature();
      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 0);
      const cmd = ClientDeviceOutputCommand.vibrate(
        value: ClientDeviceCommandValue.fromInt(value: 10),
      );

      // Act
      final outputCmd = deviceFeature.convertClientCmdtoOutputCmd(cmd);

      // Assert
      expect(outputCmd, isA<OutputCmdV4>());
      final v4Cmd = outputCmd as OutputCmdV4;
      expect(v4Cmd.command, isA<OutputCommandVibrate>());
      expect(v4Cmd.command.value, 10);
      expect(v4Cmd.featureIndex, 0);
    });

    test('converts vibrate command with double value to step', () {
      // Arrange: range 0..20, double 0.5 => 0.5 * 20 = 10 => ceil => 10
      final feature = _v4VibrateFeature();
      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 0);
      const cmd = ClientDeviceOutputCommand.vibrate(
        value: ClientDeviceCommandValue.fromDouble(value: 0.5),
      );

      // Act
      final outputCmd = deviceFeature.convertClientCmdtoOutputCmd(cmd);

      // Assert
      final v4Cmd = outputCmd as OutputCmdV4;
      expect(v4Cmd.command.value, 10);
    });

    test('double 1.0 maps to max step count', () {
      // Arrange: range 0..20, double 1.0 => 1.0 * 20 = 20
      final feature = _v4VibrateFeature();
      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 0);
      const cmd = ClientDeviceOutputCommand.vibrate(
        value: ClientDeviceCommandValue.fromDouble(value: 1.0),
      );

      // Act
      final outputCmd = deviceFeature.convertClientCmdtoOutputCmd(cmd);

      // Assert
      final v4Cmd = outputCmd as OutputCmdV4;
      expect(v4Cmd.command.value, 20);
    });

    test('double 0.0 maps to zero', () {
      // Arrange
      final feature = _v4VibrateFeature();
      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 0);
      const cmd = ClientDeviceOutputCommand.vibrate(
        value: ClientDeviceCommandValue.fromDouble(value: 0.0),
      );

      // Act
      final outputCmd = deviceFeature.convertClientCmdtoOutputCmd(cmd);

      // Assert
      final v4Cmd = outputCmd as OutputCmdV4;
      expect(v4Cmd.command.value, 0);
    });

    test('handles positionWithDuration preserving duration', () {
      // Arrange
      final feature = _v4PositionWithDurationFeature();
      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 0);
      const cmd = ClientDeviceOutputCommand.positionWithDuration(
        value: ClientDeviceCommandValue.fromInt(value: 50),
        duration: 500,
      );

      // Act
      final outputCmd = deviceFeature.convertClientCmdtoOutputCmd(cmd);

      // Assert
      final v4Cmd = outputCmd as OutputCmdV4;
      expect(v4Cmd.command, isA<OutputCommandPositionWithDuration>());
      final posCmd = v4Cmd.command as OutputCommandPositionWithDuration;
      expect(posCmd.outputValue.duration, 500);
    });

    test('throws when double value is out of range', () {
      // Arrange
      final feature = _v4VibrateFeature();
      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 0);
      const cmd = ClientDeviceOutputCommand.vibrate(
        value: ClientDeviceCommandValue.fromDouble(value: 1.5),
      );

      // Act & Assert
      expect(
        () => deviceFeature.convertClientCmdtoOutputCmd(cmd),
        throwsA(isA<RemoteToyDeviceException>()),
      );
    });

    test('throws when int value exceeds step range', () {
      // Arrange: range 0..20, but sending 25
      final feature = _v4VibrateFeature();
      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 0);
      const cmd = ClientDeviceOutputCommand.vibrate(
        value: ClientDeviceCommandValue.fromInt(value: 25),
      );

      // Act & Assert
      expect(
        () => deviceFeature.convertClientCmdtoOutputCmd(cmd),
        throwsA(isA<RemoteToyDeviceException>()),
      );
    });

    test('throws UnsupportedError for V3 features', () {
      // Arrange
      final feature = DeviceFeature.v3(featureType: FeatureType.vibrate);
      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 0);
      const cmd = ClientDeviceOutputCommand.vibrate(
        value: ClientDeviceCommandValue.fromInt(value: 5),
      );

      // Act & Assert
      expect(
        () => deviceFeature.convertClientCmdtoOutputCmd(cmd),
        throwsA(isA<UnsupportedError>()),
      );
    });

    test('throws UnsupportedError when output type is not present', () {
      // Arrange: feature has vibrate but command is rotate
      final feature = _v4VibrateFeature();
      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 0);
      const cmd = ClientDeviceOutputCommand.rotate(
        value: ClientDeviceCommandValue.fromInt(value: 5),
      );

      // Act & Assert
      expect(
        () => deviceFeature.convertClientCmdtoOutputCmd(cmd),
        throwsA(isA<UnsupportedError>()),
      );
    });
  });
}
