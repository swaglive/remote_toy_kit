import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/core/message/client/client_device_command_value.dart';

void main() {
  group('ClientDeviceCommandValue', () {
    group('ClientDeviceCommandValueInt (fromInt)', () {
      test('should create an instance with an integer value', () {
        const commandValue = ClientDeviceCommandValue.fromInt(value: 42);

        expect(commandValue, isA<ClientDeviceCommandValueInt>());
        expect((commandValue as ClientDeviceCommandValueInt).value, 42);
      });

      test('should create an instance with zero value', () {
        const commandValue = ClientDeviceCommandValue.fromInt(value: 0);

        expect(commandValue, isA<ClientDeviceCommandValueInt>());
        expect((commandValue as ClientDeviceCommandValueInt).value, 0);
      });

      test('should create an instance with negative value', () {
        const commandValue = ClientDeviceCommandValue.fromInt(value: -10);

        expect(commandValue, isA<ClientDeviceCommandValueInt>());
        expect((commandValue as ClientDeviceCommandValueInt).value, -10);
      });

      test('should create an instance with large positive value', () {
        const commandValue =
            ClientDeviceCommandValue.fromInt(value: 2147483647);

        expect(commandValue, isA<ClientDeviceCommandValueInt>());
        expect((commandValue as ClientDeviceCommandValueInt).value, 2147483647);
      });

      test('should be equal when values are the same', () {
        const commandValue1 = ClientDeviceCommandValue.fromInt(value: 100);
        const commandValue2 = ClientDeviceCommandValue.fromInt(value: 100);

        expect(commandValue1, equals(commandValue2));
        expect(commandValue1.hashCode, equals(commandValue2.hashCode));
      });

      test('should not be equal when values are different', () {
        const commandValue1 = ClientDeviceCommandValue.fromInt(value: 100);
        const commandValue2 = ClientDeviceCommandValue.fromInt(value: 200);

        expect(commandValue1, isNot(equals(commandValue2)));
      });
    });

    group('ClientDeviceCommandValueDouble (fromDouble)', () {
      test('should create an instance with a double value', () {
        const commandValue = ClientDeviceCommandValue.fromDouble(value: 0.5);

        expect(commandValue, isA<ClientDeviceCommandValueDouble>());
        expect((commandValue as ClientDeviceCommandValueDouble).value, 0.5);
      });

      test('should create an instance with zero value', () {
        const commandValue = ClientDeviceCommandValue.fromDouble(value: 0.0);

        expect(commandValue, isA<ClientDeviceCommandValueDouble>());
        expect((commandValue as ClientDeviceCommandValueDouble).value, 0.0);
      });

      test('should create an instance with value 1.0', () {
        const commandValue = ClientDeviceCommandValue.fromDouble(value: 1.0);

        expect(commandValue, isA<ClientDeviceCommandValueDouble>());
        expect((commandValue as ClientDeviceCommandValueDouble).value, 1.0);
      });

      test('should create an instance with negative value', () {
        const commandValue = ClientDeviceCommandValue.fromDouble(value: -0.75);

        expect(commandValue, isA<ClientDeviceCommandValueDouble>());
        expect((commandValue as ClientDeviceCommandValueDouble).value, -0.75);
      });

      test('should create an instance with small decimal value', () {
        const commandValue = ClientDeviceCommandValue.fromDouble(value: 0.001);

        expect(commandValue, isA<ClientDeviceCommandValueDouble>());
        expect((commandValue as ClientDeviceCommandValueDouble).value, 0.001);
      });

      test('should be equal when values are the same', () {
        const commandValue1 = ClientDeviceCommandValue.fromDouble(value: 0.5);
        const commandValue2 = ClientDeviceCommandValue.fromDouble(value: 0.5);

        expect(commandValue1, equals(commandValue2));
        expect(commandValue1.hashCode, equals(commandValue2.hashCode));
      });

      test('should not be equal when values are different', () {
        const commandValue1 = ClientDeviceCommandValue.fromDouble(value: 0.5);
        const commandValue2 = ClientDeviceCommandValue.fromDouble(value: 0.75);

        expect(commandValue1, isNot(equals(commandValue2)));
      });
    });

    group('sealed class behavior', () {
      test(
          'fromInt and fromDouble should not be equal even with same numeric value',
          () {
        const intValue = ClientDeviceCommandValue.fromInt(value: 1);
        const doubleValue = ClientDeviceCommandValue.fromDouble(value: 1.0);

        expect(intValue, isNot(equals(doubleValue)));
      });

      test('should pattern match correctly on fromInt', () {
        const commandValue = ClientDeviceCommandValue.fromInt(value: 42);
        String result;

        switch (commandValue) {
          case ClientDeviceCommandValueInt(:final value):
            result = 'int: $value';
          case ClientDeviceCommandValueDouble(:final value):
            result = 'double: $value';
        }

        expect(result, 'int: 42');
      });

      test('should pattern match correctly on fromDouble', () {
        const commandValue = ClientDeviceCommandValue.fromDouble(value: 0.5);
        String result;

        switch (commandValue) {
          case ClientDeviceCommandValueInt(:final value):
            result = 'int: $value';
          case ClientDeviceCommandValueDouble(:final value):
            result = 'double: $value';
        }

        expect(result, 'double: 0.5');
      });
    });
  });
}
