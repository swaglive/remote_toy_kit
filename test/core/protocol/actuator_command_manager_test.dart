import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/configuration/attribute/actuator_feature_message_type.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_actuator.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_output.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_output_properties.dart';
import 'package:remote_toy_kit/src/configuration/attribute/range_inclusive.dart';
import 'package:remote_toy_kit/src/core/exceptions.dart';
import 'package:remote_toy_kit/src/core/message/client/client_message.dart';
import 'package:remote_toy_kit/src/core/message/client/rotation_subcommand.dart';
import 'package:remote_toy_kit/src/core/message/client/scalar_subcommand.dart';
import 'package:remote_toy_kit/src/core/message/feature_type.dart';
import 'package:remote_toy_kit/src/core/message/output_type.dart';
import 'package:remote_toy_kit/src/core/message/v4/output_cmd.dart';
import 'package:remote_toy_kit/src/core/protocol/actuator_command_manager.dart';

DeviceFeatureV3 _v3Feature({
  required FeatureType featureType,
  required RangeInclusive stepRange,
  required Set<ActuatorFeatureMessageType> messages,
}) =>
    DeviceFeature.v3(
      featureType: featureType,
      actuator: DeviceFeatureActuator(
        stepRange: stepRange,
        messages: messages,
      ),
    ) as DeviceFeatureV3;

DeviceFeatureV4 _v4Feature({
  DeviceFeatureOutput? output,
  DeviceFeatureOutput? input,
  String id = 'f0',
  int index = 0,
}) =>
    DeviceFeature.v4(
      id: id,
      index: index,
      output: output,
    ) as DeviceFeatureV4;

void main() {
  group('FeatureStatus', () {
    test('first update always returns a value', () {
      // Arrange
      final status = FeatureStatus(
        outputType: OutputType.vibrate,
        actuator: const DeviceFeatureActuator(
          stepRange: RangeInclusive(start: 0, end: 20),
          messages: {ActuatorFeatureMessageType.scalarCmd},
        ),
      );

      // Act
      final result = status.update(value: (0.5, false));

      // Assert
      expect(result, isNotNull);
      expect(result!.$1, 10);
      expect(result.$2, isFalse);
      expect(status.sent, isTrue);
    });

    test('returns null when value has not changed', () {
      // Arrange
      final status = FeatureStatus(
        outputType: OutputType.vibrate,
        actuator: const DeviceFeatureActuator(
          stepRange: RangeInclusive(start: 0, end: 20),
          messages: {ActuatorFeatureMessageType.scalarCmd},
        ),
      );
      status.update(value: (0.5, false));

      // Act
      final result = status.update(value: (0.5, false));

      // Assert
      expect(result, isNull);
    });

    test('returns value when clockwise changes', () {
      // Arrange
      final status = FeatureStatus(
        outputType: OutputType.rotate,
        actuator: const DeviceFeatureActuator(
          stepRange: RangeInclusive(start: 0, end: 20),
          messages: {ActuatorFeatureMessageType.rotateCmd},
        ),
      );
      status.update(value: (0.5, false));

      // Act
      final result = status.update(value: (0.5, true));

      // Assert
      expect(result, isNotNull);
      expect(result!.$2, isTrue);
    });

    test('rounds up using ceil for step values with offset start', () {
      // Arrange: stepRange 1..20, so range=19
      final status = FeatureStatus(
        outputType: OutputType.vibrate,
        actuator: const DeviceFeatureActuator(
          stepRange: RangeInclusive(start: 1, end: 20),
          messages: {ActuatorFeatureMessageType.scalarCmd},
        ),
      );

      // Act: 0.1 * 19 = 1.9 + 1 (rangeStart) = 2.9 => ceil => 3
      final result = status.update(value: (0.1, false));

      // Assert
      expect(result, isNotNull);
      expect(result!.$1, 3);
    });

    test('very small value maps to zero', () {
      // Arrange
      final status = FeatureStatus(
        outputType: OutputType.vibrate,
        actuator: const DeviceFeatureActuator(
          stepRange: RangeInclusive(start: 0, end: 20),
          messages: {ActuatorFeatureMessageType.scalarCmd},
        ),
      );

      // Act: 0.000001 * 20 = 0.00002 < 0.0001 => 0
      final result = status.update(value: (0.000001, false));

      // Assert
      expect(result, isNotNull);
      expect(result!.$1, 0);
    });

    test('returns null when actuator is null', () {
      // Arrange
      final status = FeatureStatus(outputType: OutputType.vibrate);

      // Act
      final result = status.update(value: (0.5, false));

      // Assert
      expect(result, isNull);
    });
  });

  group('ActuatorCommandManager factory', () {
    test('generates stop commands for V4 vibrate feature', () {
      // Arrange
      final features = [
        _v4Feature(
          output: const DeviceFeatureOutput(
            vibrate: DeviceFeatureOutputValueProperties(
              value: RangeInclusive(start: 0, end: 20),
            ),
          ),
        ),
      ];

      // Act
      final manager = ActuatorCommandManager(features: features);

      // Assert
      expect(manager.stopCommands, isNotEmpty);
      final stopCmd = manager.stopCommands.first as OutputCmdClientMessage;
      final outputCmd = stopCmd.command as OutputCmdV4;
      expect(outputCmd.command, isA<OutputCommandVibrate>());
      expect(outputCmd.command.value, 0);
    });

    test('generates stop commands for V3 scalar feature', () {
      // Arrange
      final features = [
        _v3Feature(
          featureType: FeatureType.vibrate,
          stepRange: const RangeInclusive(start: 0, end: 20),
          messages: {ActuatorFeatureMessageType.scalarCmd},
        ),
      ];

      // Act
      final manager = ActuatorCommandManager(features: features);

      // Assert
      expect(manager.stopCommands, isNotEmpty);
      expect(
        manager.stopCommands.whereType<ScalarCmdClientMessage>().isNotEmpty,
        isTrue,
      );
    });

    test('generates stop commands for V3 rotate feature', () {
      // Arrange
      final features = [
        _v3Feature(
          featureType: FeatureType.rotate,
          stepRange: const RangeInclusive(start: 0, end: 20),
          messages: {ActuatorFeatureMessageType.rotateCmd},
        ),
      ];

      // Act
      final manager = ActuatorCommandManager(features: features);

      // Assert
      expect(
        manager.stopCommands.whereType<RotateCmdClientMessage>().isNotEmpty,
        isTrue,
      );
    });

    test('creates feature status for each actuator feature', () {
      // Arrange
      final features = [
        _v3Feature(
          featureType: FeatureType.vibrate,
          stepRange: const RangeInclusive(start: 0, end: 20),
          messages: {ActuatorFeatureMessageType.scalarCmd},
        ),
        _v3Feature(
          featureType: FeatureType.rotate,
          stepRange: const RangeInclusive(start: 0, end: 10),
          messages: {ActuatorFeatureMessageType.rotateCmd},
        ),
      ];

      // Act
      final manager = ActuatorCommandManager(features: features);

      // Assert
      expect(manager.featureStatus.length, 2);
      expect(manager.featureStatus[0].outputType, OutputType.vibrate);
      expect(manager.featureStatus[1].outputType, OutputType.rotate);
    });

    test('skips features without actuator or output', () {
      // Arrange: V4 feature with no output
      final features = [
        _v4Feature(output: null),
      ];

      // Act
      final manager = ActuatorCommandManager(features: features);

      // Assert
      expect(manager.featureStatus, isEmpty);
      expect(manager.stopCommands, isEmpty);
    });
  });

  group('ActuatorCommandManager.updateScalar', () {
    test('converts scalar value to device step using step range', () {
      // Arrange
      final features = [
        _v3Feature(
          featureType: FeatureType.vibrate,
          stepRange: const RangeInclusive(start: 0, end: 20),
          messages: {ActuatorFeatureMessageType.scalarCmd},
        ),
      ];
      final manager = ActuatorCommandManager(features: features);
      final msg = ScalarCmdClientMessage(scalars: [
        ScalarSubcommand(
          featureIndex: 0,
          scalar: 1.0,
          outputType: OutputType.vibrate,
        ),
      ]);

      // Act
      final result = manager.updateScalar(msg: msg, matchAll: false);

      // Assert
      expect(result.length, 1);
      expect(result[0], isNotNull);
      expect(result[0]!.$1, OutputType.vibrate);
      expect(result[0]!.$2, 20);
    });

    test('returns null entries for unchanged values', () {
      // Arrange
      final features = [
        _v3Feature(
          featureType: FeatureType.vibrate,
          stepRange: const RangeInclusive(start: 0, end: 20),
          messages: {ActuatorFeatureMessageType.scalarCmd},
        ),
      ];
      final manager = ActuatorCommandManager(features: features);
      final msg = ScalarCmdClientMessage(scalars: [
        ScalarSubcommand(
          featureIndex: 0,
          scalar: 0.5,
          outputType: OutputType.vibrate,
        ),
      ]);
      manager.updateScalar(msg: msg, matchAll: false);

      // Act: same value again
      final result = manager.updateScalar(msg: msg, matchAll: false);

      // Assert
      expect(result.length, 1);
      expect(result[0], isNull);
    });

    test('matchAll includes unchanged features', () {
      // Arrange
      final features = [
        _v3Feature(
          featureType: FeatureType.vibrate,
          stepRange: const RangeInclusive(start: 0, end: 20),
          messages: {ActuatorFeatureMessageType.scalarCmd},
        ),
      ];
      final manager = ActuatorCommandManager(features: features);
      final msg = ScalarCmdClientMessage(scalars: [
        ScalarSubcommand(
          featureIndex: 0,
          scalar: 0.5,
          outputType: OutputType.vibrate,
        ),
      ]);
      manager.updateScalar(msg: msg, matchAll: false);

      // Act: same value again with matchAll
      final result = manager.updateScalar(msg: msg, matchAll: true);

      // Assert: should still include the feature
      expect(result.length, 1);
      expect(result[0], isNotNull);
    });

    test('throws on empty scalars list', () {
      // Arrange
      final features = [
        _v3Feature(
          featureType: FeatureType.vibrate,
          stepRange: const RangeInclusive(start: 0, end: 20),
          messages: {ActuatorFeatureMessageType.scalarCmd},
        ),
      ];
      final manager = ActuatorCommandManager(features: features);
      final msg = ScalarCmdClientMessage(scalars: []);

      // Act & Assert
      expect(
        () => manager.updateScalar(msg: msg, matchAll: false),
        throwsA(isA<RemoteToyDeviceException>()),
      );
    });
  });

  group('ActuatorCommandManager.updateRotation', () {
    test('converts rotation value to device step with clockwise', () {
      // Arrange
      final features = [
        _v3Feature(
          featureType: FeatureType.rotate,
          stepRange: const RangeInclusive(start: 0, end: 20),
          messages: {ActuatorFeatureMessageType.rotateCmd},
        ),
      ];
      final manager = ActuatorCommandManager(features: features);
      final msg = RotateCmdClientMessage(rotations: [
        RotationSubcommand(featureIndex: 0, speed: 0.5, clockwise: true),
      ]);

      // Act
      final result = manager.updateRotation(msg: msg, matchAll: false);

      // Assert
      expect(result.length, 1);
      expect(result[0], isNotNull);
      expect(result[0]!.$1, 10);
      expect(result[0]!.$2, isTrue);
    });

    test('throws on empty rotations list', () {
      // Arrange
      final features = [
        _v3Feature(
          featureType: FeatureType.rotate,
          stepRange: const RangeInclusive(start: 0, end: 20),
          messages: {ActuatorFeatureMessageType.rotateCmd},
        ),
      ];
      final manager = ActuatorCommandManager(features: features);
      final msg = RotateCmdClientMessage(rotations: []);

      // Act & Assert
      expect(
        () => manager.updateRotation(msg: msg, matchAll: false),
        throwsA(isA<RemoteToyDeviceException>()),
      );
    });
  });

  group('ActuatorCommandManager.update', () {
    test('throws when feature index is out of bounds', () {
      // Arrange
      final features = [
        _v3Feature(
          featureType: FeatureType.vibrate,
          stepRange: const RangeInclusive(start: 0, end: 20),
          messages: {ActuatorFeatureMessageType.scalarCmd},
        ),
      ];
      final manager = ActuatorCommandManager(features: features);

      // Act & Assert
      expect(
        () => manager.update(
          msgType: ActuatorFeatureMessageType.scalarCmd,
          commands: [(5, OutputType.vibrate, (0.5, false))],
          matchAll: false,
        ),
        throwsA(isA<RemoteToyDeviceException>()),
      );
    });
  });
}
