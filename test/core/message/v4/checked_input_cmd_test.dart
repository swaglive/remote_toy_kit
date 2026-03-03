import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_input.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_input_properties.dart';
import 'package:remote_toy_kit/src/configuration/attribute/protocol_attributes.dart';
import 'package:remote_toy_kit/src/configuration/attribute/range_inclusive.dart';
import 'package:remote_toy_kit/src/core/exceptions.dart';
import 'package:remote_toy_kit/src/core/message/input_cmd_type.dart';
import 'package:remote_toy_kit/src/core/message/input_type.dart';
import 'package:remote_toy_kit/src/core/message/v4/checked_input_cmd.dart';
import 'package:remote_toy_kit/src/core/message/v4/input_cmd.dart';

ProtocolAttributes _attributes({
  List<DeviceFeature>? features,
}) =>
    ProtocolAttributes(name: 'test-device', features: features);

DeviceFeatureV4 _batteryFeature() => DeviceFeature.v4(
      id: 'battery-0',
      index: 0,
      input: const DeviceFeatureInput(
        battery: DeviceFeatureInputProperties(
          command: {InputCommandType.read},
          value: [RangeInclusive(start: 0, end: 100)],
        ),
      ),
    ) as DeviceFeatureV4;

void main() {
  group('CheckedInputCmd.tryFromDeviceAttributes', () {
    test('creates checked command for matching battery input', () {
      // Arrange
      final attributes = _attributes(features: [_batteryFeature()]);
      const cmd = InputCmd.v4(
        featureIndex: 0,
        inputType: InputType.battery,
        inputCommandType: InputCommandType.read,
      );

      // Act
      final checked = CheckedInputCmd.tryFromDeviceAttributes(
        cmd,
        attributes,
      );

      // Assert
      expect(checked, isA<CheckedInputCmdV4>());
      expect(checked.featureIndex, 0);
      expect(checked.featureId, 'battery-0');
      expect(checked.inputType, InputType.battery);
      expect(checked.inputCommandType, InputCommandType.read);
    });

    test('throws when features list is null', () {
      // Arrange
      final attributes = _attributes(features: null);
      const cmd = InputCmd.v4(
        featureIndex: 0,
        inputType: InputType.battery,
        inputCommandType: InputCommandType.read,
      );

      // Act & Assert
      expect(
        () => CheckedInputCmd.tryFromDeviceAttributes(cmd, attributes),
        throwsA(
          isA<RemoteToyDeviceException>().having(
            (e) => e.code,
            'code',
            RemoteToyDeviceException.codeDeviceNoFeatures,
          ),
        ),
      );
    });

    test('throws when no feature supports the input type', () {
      // Arrange: feature has battery, but command asks for rssi
      final attributes = _attributes(features: [_batteryFeature()]);
      const cmd = InputCmd.v4(
        featureIndex: 0,
        inputType: InputType.rssi,
        inputCommandType: InputCommandType.read,
      );

      // Act & Assert
      expect(
        () => CheckedInputCmd.tryFromDeviceAttributes(cmd, attributes),
        throwsA(
          isA<RemoteToyDeviceException>().having(
            (e) => e.code,
            'code',
            RemoteToyDeviceException.codeDeviceFeatureNotFound,
          ),
        ),
      );
    });

    test('passes through subscribe command type', () {
      // Arrange
      final attributes = _attributes(features: [_batteryFeature()]);
      const cmd = InputCmd.v4(
        featureIndex: 0,
        inputType: InputType.battery,
        inputCommandType: InputCommandType.subscribe,
      );

      // Act
      final checked = CheckedInputCmd.tryFromDeviceAttributes(
        cmd,
        attributes,
      );

      // Assert
      expect(checked.inputCommandType, InputCommandType.subscribe);
    });
  });
}
