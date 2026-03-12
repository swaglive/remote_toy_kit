import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/configuration/communication/bluetooth_le_manufacturer_data.dart';
import 'package:remote_toy_kit/src/configuration/communication/bluetooth_le_specifier.dart';

BluetoothLESpecifier _specifier({
  Set<String> names = const {},
  List<BluetoothLEManufacturerData> manufacturerData = const [],
  Set<String> advertisedServices = const {},
}) =>
    BluetoothLESpecifier(
      names: names,
      manufacturerData: manufacturerData,
      advertisedServices: advertisedServices,
      services: const {},
    );

void main() {
  group('BluetoothLESpecifier equality', () {
    group('name matching', () {
      test('matches on exact name intersection', () {
        // Arrange
        final a = _specifier(names: {'LVS-A011'});
        final b = _specifier(names: {'LVS-A011', 'LVS-B022'});

        // Assert
        expect(a == b, isTrue);
      });

      test('does not match different names', () {
        // Arrange
        final a = _specifier(names: {'LVS-A011'});
        final b = _specifier(names: {'LVS-B022'});

        // Assert
        expect(a == b, isFalse);
      });

      test('matches wildcard suffix in first specifier', () {
        // Arrange: config has "LVS-*", device has "LVS-A011"
        final config = _specifier(names: {'LVS-*'});
        final device = _specifier(names: {'LVS-A011'});

        // Assert
        expect(config == device, isTrue);
      });

      test('matches wildcard suffix in second specifier', () {
        // Arrange
        final device = _specifier(names: {'LVS-A011'});
        final config = _specifier(names: {'LVS-*'});

        // Assert
        expect(device == config, isTrue);
      });

      test('wildcard does not match unrelated prefix', () {
        // Arrange
        final a = _specifier(names: {'LVS-*'});
        final b = _specifier(names: {'MON-1234'});

        // Assert
        expect(a == b, isFalse);
      });
    });

    group('manufacturer data matching', () {
      test('matches on overlapping manufacturer data', () {
        // Arrange
        final a = _specifier(
          manufacturerData: [
            const BluetoothLEManufacturerData(company: 0x1234),
          ],
        );
        final b = _specifier(
          manufacturerData: [
            const BluetoothLEManufacturerData(company: 0x1234),
            const BluetoothLEManufacturerData(company: 0x5678),
          ],
        );

        // Assert
        expect(a == b, isTrue);
      });

      test('does not match when one side has empty manufacturer data', () {
        // Arrange
        final a = _specifier(
          manufacturerData: [
            const BluetoothLEManufacturerData(company: 0x1234),
          ],
        );
        final b = _specifier(manufacturerData: []);

        // Assert
        expect(a == b, isFalse);
      });

      test('matches when config data is null (company-only wildcard)', () {
        // Arrange: config has company only, device has company + payload
        final config = _specifier(
          manufacturerData: [
            const BluetoothLEManufacturerData(company: 93),
          ],
        );
        final device = _specifier(
          manufacturerData: [
            BluetoothLEManufacturerData(
              company: 93,
              data: Uint8List.fromList([0, 0, 40, 67]),
            ),
          ],
        );

        // Assert
        expect(config == device, isTrue);
      });

      test('matches when device data is null (company-only wildcard)', () {
        // Arrange
        final config = _specifier(
          manufacturerData: [
            BluetoothLEManufacturerData(
              company: 93,
              data: Uint8List.fromList([0, 0, 40]),
            ),
          ],
        );
        final device = _specifier(
          manufacturerData: [
            const BluetoothLEManufacturerData(company: 93),
          ],
        );

        // Assert
        expect(config == device, isTrue);
      });

      test(
          'matches when device data is a superset of config data (Satisfyer case)',
          () {
        // Arrange: config has 3-byte prefix, device has 4 bytes
        final config = _specifier(
          manufacturerData: [
            BluetoothLEManufacturerData(
              company: 93,
              data: Uint8List.fromList([0, 0, 40]),
            ),
          ],
        );
        final device = _specifier(
          manufacturerData: [
            BluetoothLEManufacturerData(
              company: 93,
              data: Uint8List.fromList([0, 0, 40, 67]),
            ),
          ],
        );

        // Assert
        expect(config == device, isTrue);
        expect(device == config, isTrue);
      });

      test('does not match when company IDs differ', () {
        // Arrange
        final a = _specifier(
          manufacturerData: [
            BluetoothLEManufacturerData(
              company: 93,
              data: Uint8List.fromList([0, 0, 40]),
            ),
          ],
        );
        final b = _specifier(
          manufacturerData: [
            BluetoothLEManufacturerData(
              company: 99,
              data: Uint8List.fromList([0, 0, 40]),
            ),
          ],
        );

        // Assert
        expect(a == b, isFalse);
      });

      test('does not match when data has no subsequence relationship', () {
        // Arrange
        final a = _specifier(
          manufacturerData: [
            BluetoothLEManufacturerData(
              company: 93,
              data: Uint8List.fromList([0, 0, 39]),
            ),
          ],
        );
        final b = _specifier(
          manufacturerData: [
            BluetoothLEManufacturerData(
              company: 93,
              data: Uint8List.fromList([0, 0, 40, 67]),
            ),
          ],
        );

        // Assert
        expect(a == b, isFalse);
      });

      test('matches exact same data', () {
        // Arrange
        final a = _specifier(
          manufacturerData: [
            BluetoothLEManufacturerData(
              company: 93,
              data: Uint8List.fromList([0, 0, 40]),
            ),
          ],
        );
        final b = _specifier(
          manufacturerData: [
            BluetoothLEManufacturerData(
              company: 93,
              data: Uint8List.fromList([0, 0, 40]),
            ),
          ],
        );

        // Assert
        expect(a == b, isTrue);
      });

      test('does not match same-length different data', () {
        // Arrange
        final a = _specifier(
          manufacturerData: [
            BluetoothLEManufacturerData(
              company: 93,
              data: Uint8List.fromList([0, 0, 39]),
            ),
          ],
        );
        final b = _specifier(
          manufacturerData: [
            BluetoothLEManufacturerData(
              company: 93,
              data: Uint8List.fromList([0, 0, 40]),
            ),
          ],
        );

        // Assert
        expect(a == b, isFalse);
      });
    });

    group('advertised services matching', () {
      test('matches on overlapping service UUIDs', () {
        // Arrange
        final a = _specifier(
          advertisedServices: {'0000fff0-0000-1000-8000-00805f9b34fb'},
        );
        final b = _specifier(
          advertisedServices: {
            '0000fff0-0000-1000-8000-00805f9b34fb',
            '00001800-0000-1000-8000-00805f9b34fb',
          },
        );

        // Assert
        expect(a == b, isTrue);
      });

      test('does not match disjoint service UUIDs', () {
        // Arrange
        final a = _specifier(
          advertisedServices: {'0000fff0-0000-1000-8000-00805f9b34fb'},
        );
        final b = _specifier(
          advertisedServices: {'00001800-0000-1000-8000-00805f9b34fb'},
        );

        // Assert
        expect(a == b, isFalse);
      });
    });

    test('does not match non-BluetoothLESpecifier object', () {
      // Arrange
      final a = _specifier(names: {'LVS-A011'});

      // Assert
      // ignore: unrelated_type_equality_checks
      expect(a == 'not a specifier', isFalse);
    });
  });

  group('BluetoothLESpecifier.fromDevice', () {
    test('constructs specifier from device scan result', () {
      // Arrange & Act
      final specifier = BluetoothLESpecifier.fromDevice(
        name: 'LVS-A011',
        manufactureData: {
          0x1234: Uint8List.fromList([0x01, 0x02]),
        },
        advertisedServices: ['0000fff0-0000-1000-8000-00805f9b34fb'],
      );

      // Assert
      expect(specifier.names, {'LVS-A011'});
      expect(specifier.manufacturerData.length, 1);
      expect(specifier.manufacturerData.first.company, 0x1234);
      expect(specifier.advertisedServices,
          {'0000fff0-0000-1000-8000-00805f9b34fb'});
      expect(specifier.services, isEmpty);
    });

    test('matches against config specifier via wildcard', () {
      // Arrange
      final deviceSpec = BluetoothLESpecifier.fromDevice(
        name: 'LVS-A011',
        manufactureData: {},
        advertisedServices: [],
      );
      final configSpec = _specifier(names: {'LVS-*'});

      // Assert
      expect(deviceSpec == configSpec, isTrue);
    });
  });
}
