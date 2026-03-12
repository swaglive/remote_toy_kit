import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_output.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_output_properties.dart';
import 'package:remote_toy_kit/src/configuration/attribute/range_inclusive.dart';
import 'package:remote_toy_kit/src/core/exceptions.dart';
import 'package:remote_toy_kit/src/core/message/client/client_device_command_value.dart';
import 'package:remote_toy_kit/src/core/message/client/client_device_output_command.dart';
import 'package:remote_toy_kit/src/core/message/v4/output_cmd.dart';
import 'package:remote_toy_kit/src/remote_toy_device_feature.dart';

DeviceFeature _vibrateFeature({
  RangeInclusive range = const RangeInclusive(start: 0, end: 20),
  int index = 0,
}) =>
    DeviceFeature(
      id: 'vibrate-$index',
      index: index,
      output: DeviceFeatureOutput(
        vibrate: DeviceFeatureOutputValueProperties(value: range),
      ),
    );

DeviceFeature _positionWithDurationFeature({
  RangeInclusive valueRange = const RangeInclusive(start: 0, end: 100),
  RangeInclusive durationRange = const RangeInclusive(start: 0, end: 1000),
  int index = 0,
}) =>
    DeviceFeature(
      id: 'poswd-$index',
      index: index,
      output: DeviceFeatureOutput(
        positionWithDuration: DeviceFeatureOutputPositionWithDurationProperties(
          value: valueRange,
          duration: durationRange,
        ),
      ),
    );

void main() {
  group('RemoteToyDeviceFeature.fromConfig', () {
    test('uses feature own index', () {
      final feature = _vibrateFeature(index: 7);

      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 99);

      expect(deviceFeature.featureIndex, 7);
    });
  });

  group('RemoteToyDeviceFeature.convertClientCmdtoOutputCmd', () {
    test('converts vibrate command with int value', () {
      final feature = _vibrateFeature();
      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 0);
      const cmd = ClientDeviceOutputCommand.vibrate(
        value: ClientDeviceCommandValue.fromInt(value: 10),
      );

      final outputCmd = deviceFeature.convertClientCmdtoOutputCmd(cmd);

      expect(outputCmd, isA<OutputCmdV4>());
      final v4Cmd = outputCmd as OutputCmdV4;
      expect(v4Cmd.command, isA<OutputCommandVibrate>());
      expect(v4Cmd.command.value, 10);
      expect(v4Cmd.featureIndex, 0);
    });

    test('converts vibrate command with double value to step', () {
      final feature = _vibrateFeature();
      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 0);
      const cmd = ClientDeviceOutputCommand.vibrate(
        value: ClientDeviceCommandValue.fromDouble(value: 0.5),
      );

      final outputCmd = deviceFeature.convertClientCmdtoOutputCmd(cmd);

      final v4Cmd = outputCmd as OutputCmdV4;
      expect(v4Cmd.command.value, 10);
    });

    test('double 1.0 maps to max step count', () {
      final feature = _vibrateFeature();
      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 0);
      const cmd = ClientDeviceOutputCommand.vibrate(
        value: ClientDeviceCommandValue.fromDouble(value: 1.0),
      );

      final outputCmd = deviceFeature.convertClientCmdtoOutputCmd(cmd);

      final v4Cmd = outputCmd as OutputCmdV4;
      expect(v4Cmd.command.value, 20);
    });

    test('double 0.0 maps to zero', () {
      final feature = _vibrateFeature();
      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 0);
      const cmd = ClientDeviceOutputCommand.vibrate(
        value: ClientDeviceCommandValue.fromDouble(value: 0.0),
      );

      final outputCmd = deviceFeature.convertClientCmdtoOutputCmd(cmd);

      final v4Cmd = outputCmd as OutputCmdV4;
      expect(v4Cmd.command.value, 0);
    });

    test('handles positionWithDuration preserving duration', () {
      final feature = _positionWithDurationFeature();
      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 0);
      const cmd = ClientDeviceOutputCommand.positionWithDuration(
        value: ClientDeviceCommandValue.fromInt(value: 50),
        duration: 500,
      );

      final outputCmd = deviceFeature.convertClientCmdtoOutputCmd(cmd);

      final v4Cmd = outputCmd as OutputCmdV4;
      expect(v4Cmd.command, isA<OutputCommandPositionWithDuration>());
      final posCmd = v4Cmd.command as OutputCommandPositionWithDuration;
      expect(posCmd.outputValue.duration, 500);
    });

    test('throws when double value is out of range', () {
      final feature = _vibrateFeature();
      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 0);
      const cmd = ClientDeviceOutputCommand.vibrate(
        value: ClientDeviceCommandValue.fromDouble(value: 1.5),
      );

      expect(
        () => deviceFeature.convertClientCmdtoOutputCmd(cmd),
        throwsA(isA<RemoteToyDeviceException>()),
      );
    });

    test('throws when int value exceeds step range', () {
      final feature = _vibrateFeature();
      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 0);
      const cmd = ClientDeviceOutputCommand.vibrate(
        value: ClientDeviceCommandValue.fromInt(value: 25),
      );

      expect(
        () => deviceFeature.convertClientCmdtoOutputCmd(cmd),
        throwsA(isA<RemoteToyDeviceException>()),
      );
    });

    test('throws UnsupportedError when output type is not present', () {
      final feature = _vibrateFeature();
      final deviceFeature =
          RemoteToyDeviceFeature.fromConfig(feature, featureIndex: 0);
      const cmd = ClientDeviceOutputCommand.rotate(
        value: ClientDeviceCommandValue.fromInt(value: 5),
      );

      expect(
        () => deviceFeature.convertClientCmdtoOutputCmd(cmd),
        throwsA(isA<UnsupportedError>()),
      );
    });
  });
}
