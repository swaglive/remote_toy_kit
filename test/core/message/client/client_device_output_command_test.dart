import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/core/message/client/client_device_command_value.dart';
import 'package:remote_toy_kit/src/core/message/client/client_device_output_command.dart';
import 'package:remote_toy_kit/src/core/message/output_type.dart';

void main() {
  group('ClientDeviceOutputCommand', () {
    const intValue = ClientDeviceCommandValue.fromInt(value: 100);
    const doubleValue = ClientDeviceCommandValue.fromDouble(value: 0.5);
    const durationValue = 500;

    group('factory constructors', () {
      test('should create vibrate command', () {
        const command = ClientDeviceOutputCommand.vibrate(value: intValue);

        expect(command, isA<ClientDeviceOutputVibrateCommand>());
        expect((command as ClientDeviceOutputVibrateCommand).value, intValue);
      });

      test('should create rotate command', () {
        const command = ClientDeviceOutputCommand.rotate(value: intValue);

        expect(command, isA<ClientDeviceOutputRotateCommand>());
        expect((command as ClientDeviceOutputRotateCommand).value, intValue);
      });

      test('should create oscillate command', () {
        const command = ClientDeviceOutputCommand.oscillate(value: intValue);

        expect(command, isA<ClientDeviceOutputOscillateCommand>());
        expect((command as ClientDeviceOutputOscillateCommand).value, intValue);
      });

      test('should create constrict command', () {
        const command = ClientDeviceOutputCommand.constrict(value: intValue);

        expect(command, isA<ClientDeviceOutputConstrictCommand>());
        expect((command as ClientDeviceOutputConstrictCommand).value, intValue);
      });

      test('should create temperature command', () {
        const command = ClientDeviceOutputCommand.temperature(value: intValue);

        expect(command, isA<ClientDeviceOutputTemperatureCommand>());
        expect(
            (command as ClientDeviceOutputTemperatureCommand).value, intValue);
      });

      test('should create led command', () {
        const command = ClientDeviceOutputCommand.led(value: intValue);

        expect(command, isA<ClientDeviceOutputLedCommand>());
        expect((command as ClientDeviceOutputLedCommand).value, intValue);
      });

      test('should create position command', () {
        const command = ClientDeviceOutputCommand.position(value: intValue);

        expect(command, isA<ClientDeviceOutputPositionCommand>());
        expect((command as ClientDeviceOutputPositionCommand).value, intValue);
      });

      test('should create positionWithDuration command', () {
        const command = ClientDeviceOutputCommand.positionWithDuration(
          value: intValue,
          duration: durationValue,
        );

        expect(command, isA<ClientDeviceOutputPositionWithDurationCommand>());
        const typedCommand =
            command as ClientDeviceOutputPositionWithDurationCommand;
        expect(typedCommand.value, intValue);
        expect(typedCommand.duration, durationValue);
      });

      test('should create spray command', () {
        const command = ClientDeviceOutputCommand.spray(value: intValue);

        expect(command, isA<ClientDeviceOutputSprayCommand>());
        expect((command as ClientDeviceOutputSprayCommand).value, intValue);
      });

      test('should accept double values', () {
        const command = ClientDeviceOutputCommand.vibrate(value: doubleValue);

        expect(command, isA<ClientDeviceOutputVibrateCommand>());
        expect(
            (command as ClientDeviceOutputVibrateCommand).value, doubleValue);
      });
    });

    group('output type getter', () {
      test('vibrate command should return OutputType.vibrate', () {
        const command = ClientDeviceOutputCommand.vibrate(value: intValue);
        expect(command.outputType, OutputType.vibrate);
      });

      test('rotate command should return OutputType.rotate', () {
        const command = ClientDeviceOutputCommand.rotate(value: intValue);
        expect(command.outputType, OutputType.rotate);
      });

      test('oscillate command should return OutputType.oscillate', () {
        const command = ClientDeviceOutputCommand.oscillate(value: intValue);
        expect(command.outputType, OutputType.oscillate);
      });

      test('constrict command should return OutputType.constrict', () {
        const command = ClientDeviceOutputCommand.constrict(value: intValue);
        expect(command.outputType, OutputType.constrict);
      });

      test('temperature command should return OutputType.temperature', () {
        const command = ClientDeviceOutputCommand.temperature(value: intValue);
        expect(command.outputType, OutputType.temperature);
      });

      test('led command should return OutputType.led', () {
        const command = ClientDeviceOutputCommand.led(value: intValue);
        expect(command.outputType, OutputType.led);
      });

      test('position command should return OutputType.position', () {
        const command = ClientDeviceOutputCommand.position(value: intValue);
        expect(command.outputType, OutputType.position);
      });

      test(
          'positionWithDuration command should return OutputType.positionWithDuration',
          () {
        const command = ClientDeviceOutputCommand.positionWithDuration(
          value: intValue,
          duration: durationValue,
        );
        expect(command.outputType, OutputType.positionWithDuration);
      });

      test('spray command should return OutputType.spray', () {
        const command = ClientDeviceOutputCommand.spray(value: intValue);
        expect(command.outputType, OutputType.spray);
      });
    });

    group('fromType static method', () {
      test('should create vibrate command from OutputType.vibrate', () {
        final command =
            ClientDeviceOutputCommand.tryFrom(OutputType.vibrate, intValue);

        expect(command, isNotNull);
        expect(command, isA<ClientDeviceOutputVibrateCommand>());
        expect(command!.outputType, OutputType.vibrate);
      });

      test('should create rotate command from OutputType.rotate', () {
        final command =
            ClientDeviceOutputCommand.tryFrom(OutputType.rotate, intValue);

        expect(command, isNotNull);
        expect(command, isA<ClientDeviceOutputRotateCommand>());
        expect(command!.outputType, OutputType.rotate);
      });

      test('should create oscillate command from OutputType.oscillate', () {
        final command =
            ClientDeviceOutputCommand.tryFrom(OutputType.oscillate, intValue);

        expect(command, isNotNull);
        expect(command, isA<ClientDeviceOutputOscillateCommand>());
        expect(command!.outputType, OutputType.oscillate);
      });

      test('should create constrict command from OutputType.constrict', () {
        final command =
            ClientDeviceOutputCommand.tryFrom(OutputType.constrict, intValue);

        expect(command, isNotNull);
        expect(command, isA<ClientDeviceOutputConstrictCommand>());
        expect(command!.outputType, OutputType.constrict);
      });

      test('should create temperature command from OutputType.temperature', () {
        final command =
            ClientDeviceOutputCommand.tryFrom(OutputType.temperature, intValue);

        expect(command, isNotNull);
        expect(command, isA<ClientDeviceOutputTemperatureCommand>());
        expect(command!.outputType, OutputType.temperature);
      });

      test('should create led command from OutputType.led', () {
        final command =
            ClientDeviceOutputCommand.tryFrom(OutputType.led, intValue);

        expect(command, isNotNull);
        expect(command, isA<ClientDeviceOutputLedCommand>());
        expect(command!.outputType, OutputType.led);
      });

      test('should create position command from OutputType.position', () {
        final command =
            ClientDeviceOutputCommand.tryFrom(OutputType.position, intValue);

        expect(command, isNotNull);
        expect(command, isA<ClientDeviceOutputPositionCommand>());
        expect(command!.outputType, OutputType.position);
      });

      test('should create spray command from OutputType.spray', () {
        final command =
            ClientDeviceOutputCommand.tryFrom(OutputType.spray, intValue);

        expect(command, isNotNull);
        expect(command, isA<ClientDeviceOutputSprayCommand>());
        expect(command!.outputType, OutputType.spray);
      });

      test('should return null for OutputType.unknown', () {
        try {
          final command =
              ClientDeviceOutputCommand.tryFrom(OutputType.unknown, intValue);
          expect(command, isNull);
        } catch (e) {
          expect(e, isA<UnsupportedError>());
        }
      });

      test(
          'should return null for OutputType.positionWithDuration (requires duration)',
          () {
        try {
          final command = ClientDeviceOutputCommand.tryFrom(
              OutputType.positionWithDuration, intValue);
          expect(command, isNull);
        } catch (e) {
          expect(e, isA<UnsupportedError>());
        }
      });
    });

    group('equality', () {
      test('same command type and value should be equal', () {
        const command1 = ClientDeviceOutputCommand.vibrate(value: intValue);
        const command2 = ClientDeviceOutputCommand.vibrate(value: intValue);

        expect(command1, equals(command2));
        expect(command1.hashCode, equals(command2.hashCode));
      });

      test('same command type but different value should not be equal', () {
        const command1 = ClientDeviceOutputCommand.vibrate(value: intValue);
        const command2 = ClientDeviceOutputCommand.vibrate(value: doubleValue);

        expect(command1, isNot(equals(command2)));
      });

      test('different command types should not be equal', () {
        const command1 = ClientDeviceOutputCommand.vibrate(value: intValue);
        const command2 = ClientDeviceOutputCommand.rotate(value: intValue);

        expect(command1, isNot(equals(command2)));
      });

      test('positionWithDuration commands with same values should be equal',
          () {
        const command1 = ClientDeviceOutputCommand.positionWithDuration(
          value: intValue,
          duration: durationValue,
        );
        const command2 = ClientDeviceOutputCommand.positionWithDuration(
          value: intValue,
          duration: durationValue,
        );

        expect(command1, equals(command2));
        expect(command1.hashCode, equals(command2.hashCode));
      });

      test(
          'positionWithDuration commands with different duration should not be equal',
          () {
        const command1 = ClientDeviceOutputCommand.positionWithDuration(
          value: intValue,
          duration: durationValue,
        );
        const command2 = ClientDeviceOutputCommand.positionWithDuration(
          value: intValue,
          duration: 1000,
        );

        expect(command1, isNot(equals(command2)));
      });
    });

    group('pattern matching', () {
      test('should pattern match correctly on vibrate', () {
        const command = ClientDeviceOutputCommand.vibrate(value: intValue);
        String result;

        switch (command) {
          case ClientDeviceOutputVibrateCommand(:final value):
            result = 'vibrate: $value';
          case ClientDeviceOutputRotateCommand():
            result = 'rotate';
          case ClientDeviceOutputOscillateCommand():
            result = 'oscillate';
          case ClientDeviceOutputConstrictCommand():
            result = 'constrict';
          case ClientDeviceOutputTemperatureCommand():
            result = 'temperature';
          case ClientDeviceOutputLedCommand():
            result = 'led';
          case ClientDeviceOutputPositionCommand():
            result = 'position';
          case ClientDeviceOutputPositionWithDurationCommand():
            result = 'positionWithDuration';
          case ClientDeviceOutputSprayCommand():
            result = 'spray';
        }

        expect(result, contains('vibrate'));
      });

      test('should pattern match correctly on positionWithDuration', () {
        const command = ClientDeviceOutputCommand.positionWithDuration(
          value: intValue,
          duration: durationValue,
        );
        ClientDeviceCommandValue? extractedValue;
        int? extractedDuration;

        switch (command) {
          case ClientDeviceOutputPositionWithDurationCommand(
              :final value,
              :final duration
            ):
            extractedValue = value;
            extractedDuration = duration;
          default:
            break;
        }

        expect(extractedValue, intValue);
        expect(extractedDuration, durationValue);
      });
    });
  });
}
