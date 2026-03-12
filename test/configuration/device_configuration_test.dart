import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_output.dart';
import 'package:remote_toy_kit/src/configuration/attribute/device_feature_output_properties.dart';
import 'package:remote_toy_kit/src/configuration/attribute/protocol_attributes.dart';
import 'package:remote_toy_kit/src/configuration/attribute/range_inclusive.dart';
import 'package:remote_toy_kit/src/configuration/communication/bluetooth_le_specifier.dart';
import 'package:remote_toy_kit/src/configuration/device_configuration.dart';
import 'package:remote_toy_kit/src/configuration/device_configuration_version.dart';
import 'package:remote_toy_kit/src/configuration/protocol_definition.dart';
import 'package:remote_toy_kit/src/core/message/endpoint.dart';

const _version = DeviceConfigurationVersion(major: 4, minor: 0);

final _defaultFeatures = <DeviceFeature>[
  const DeviceFeature(
    id: 'default-vibrate',
    index: 0,
    output: DeviceFeatureOutput(
      vibrate: DeviceFeatureOutputValueProperties(
        value: RangeInclusive(start: 0, end: 20),
      ),
    ),
  ),
];

ProtocolDefinition _definition({
  BluetoothLESpecifier? communication,
  ProtocolAttributes? defaults,
  List<ProtocolAttributes>? configurations,
}) =>
    ProtocolDefinition(
      communication: communication,
      defaults: defaults ??
          ProtocolAttributes(
            name: 'Default Device',
            features: _defaultFeatures,
          ),
      configurations: configurations,
    );

void main() {
  group('DeviceConfiguration.findProtocolAttributes', () {
    test('returns matching model attributes when identifier is found', () {
      // Arrange
      final config = DeviceConfiguration(
        version: _version,
        protocols: {
          'lovense': _definition(
            configurations: [
              const ProtocolAttributes(
                name: 'Lovense Nora',
                identifier: ['P', 'Q'],
                features: [],
              ),
            ],
          ),
        },
      );

      // Act
      final result = config.findProtocolAttributes(
        protocolName: 'lovense',
        modelIdentifier: 'P',
      );

      // Assert
      expect(result, isNotNull);
      expect(result!.name, 'Lovense Nora');
    });

    test('merges default features when model attributes have null features',
        () {
      // Arrange
      final config = DeviceConfiguration(
        version: _version,
        protocols: {
          'lovense': _definition(
            configurations: [
              const ProtocolAttributes(
                name: 'Lovense Generic',
                identifier: ['X'],
                features: null,
              ),
            ],
          ),
        },
      );

      // Act
      final result = config.findProtocolAttributes(
        protocolName: 'lovense',
        modelIdentifier: 'X',
      );

      // Assert
      expect(result, isNotNull);
      expect(result!.name, 'Lovense Generic');
      expect(result.features, isNotNull);
      expect(result.features, _defaultFeatures);
    });

    test('falls back to defaults when identifier not found', () {
      // Arrange
      final config = DeviceConfiguration(
        version: _version,
        protocols: {
          'lovense': _definition(
            configurations: [
              const ProtocolAttributes(
                name: 'Lovense Nora',
                identifier: ['P'],
                features: [],
              ),
            ],
          ),
        },
      );

      // Act
      final result = config.findProtocolAttributes(
        protocolName: 'lovense',
        modelIdentifier: 'Z',
      );

      // Assert
      expect(result, isNotNull);
      expect(result!.name, 'Default Device');
    });

    test('falls back to defaults when modelIdentifier is null', () {
      // Arrange
      final config = DeviceConfiguration(
        version: _version,
        protocols: {
          'lovense': _definition(),
        },
      );

      // Act
      final result = config.findProtocolAttributes(
        protocolName: 'lovense',
        modelIdentifier: null,
      );

      // Assert
      expect(result, isNotNull);
      expect(result!.name, 'Default Device');
    });

    test('returns null for unknown protocol', () {
      // Arrange
      final config = DeviceConfiguration(
        version: _version,
        protocols: {
          'lovense': _definition(),
        },
      );

      // Act
      final result = config.findProtocolAttributes(
        protocolName: 'unknown-protocol',
      );

      // Assert
      expect(result, isNull);
    });
  });

  group('DeviceConfiguration.specifiers', () {
    test('extracts BLE specifiers from protocols with communication', () {
      // Arrange
      const specifier = BluetoothLESpecifier(
        names: {'LVS-*'},
        manufacturerData: [],
        advertisedServices: {},
        services: {
          'service-uuid': {Endpoint.tx: 'char-tx', Endpoint.rx: 'char-rx'}
        },
      );
      final config = DeviceConfiguration(
        version: _version,
        protocols: {
          'lovense': _definition(communication: specifier),
          'nocommunication': _definition(communication: null),
        },
      );

      // Act
      final specifiers = config.specifiers;

      // Assert
      expect(specifiers.length, 1);
      expect(specifiers.containsKey('lovense'), isTrue);
      expect(specifiers['lovense']!.names, {'LVS-*'});
    });

    test('returns empty map when no protocols have communication', () {
      // Arrange
      final config = DeviceConfiguration(
        version: _version,
        protocols: {
          'proto1': _definition(communication: null),
        },
      );

      // Act
      final specifiers = config.specifiers;

      // Assert
      expect(specifiers, isEmpty);
    });
  });
}
