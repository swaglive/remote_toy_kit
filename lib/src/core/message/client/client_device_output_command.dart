/// Client Device Output Command
///
/// Represents a client output command for a device feature, such as vibrate, rotate, or constrict.
/// Each command carries a value, which can be an integer or double, to control the corresponding feature.
/// This is the main command from ui -> sextoy sdk
///
/// Reference: Buttplug Rust implementation (crates/buttplug_client/src/device/command.rs)
library core.message.client.client_device_output_command;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../message/output_type.dart';
import 'client_device_command_value.dart';

part 'client_device_output_command.freezed.dart';

@freezed
sealed class ClientDeviceOutputCommand with _$ClientDeviceOutputCommand {
  const ClientDeviceOutputCommand._();

  /// Create a vibrate command with a value.
  const factory ClientDeviceOutputCommand.vibrate({
    required ClientDeviceCommandValue value,
  }) = ClientDeviceOutputVibrateCommand;

  /// Create a rotate command with a value.
  const factory ClientDeviceOutputCommand.rotate({
    required ClientDeviceCommandValue value,
  }) = ClientDeviceOutputRotateCommand;

  /// Create an oscillate command with a value.
  const factory ClientDeviceOutputCommand.oscillate({
    required ClientDeviceCommandValue value,
  }) = ClientDeviceOutputOscillateCommand;

  /// Create a constrict command with a value.
  const factory ClientDeviceOutputCommand.constrict({
    required ClientDeviceCommandValue value,
  }) = ClientDeviceOutputConstrictCommand;

  /// Create a temperature command with a value.
  const factory ClientDeviceOutputCommand.temperature({
    required ClientDeviceCommandValue value,
  }) = ClientDeviceOutputTemperatureCommand;

  /// Create a led command with a value.
  const factory ClientDeviceOutputCommand.led({
    required ClientDeviceCommandValue value,
  }) = ClientDeviceOutputLedCommand;

  /// Create a position command with a value.
  const factory ClientDeviceOutputCommand.position({
    required ClientDeviceCommandValue value,
  }) = ClientDeviceOutputPositionCommand;

  /// Create a position with duration command with a value and duration.
  const factory ClientDeviceOutputCommand.positionWithDuration({
    required ClientDeviceCommandValue value,
    required int duration, // duration in milliseconds
  }) = ClientDeviceOutputPositionWithDurationCommand;

  /// Create a spray command with a value.
  const factory ClientDeviceOutputCommand.spray({
    required ClientDeviceCommandValue value,
  }) = ClientDeviceOutputSprayCommand;

  /// Returns the output type of the command.
  OutputType get outputType => switch (this) {
        ClientDeviceOutputVibrateCommand() => OutputType.vibrate,
        ClientDeviceOutputRotateCommand() => OutputType.rotate,
        ClientDeviceOutputOscillateCommand() => OutputType.oscillate,
        ClientDeviceOutputConstrictCommand() => OutputType.constrict,
        ClientDeviceOutputTemperatureCommand() => OutputType.temperature,
        ClientDeviceOutputLedCommand() => OutputType.led,
        ClientDeviceOutputPositionCommand() => OutputType.position,
        ClientDeviceOutputPositionWithDurationCommand() =>
          OutputType.positionWithDuration,
        ClientDeviceOutputSprayCommand() => OutputType.spray,
      };

  /// Creates a [ClientDeviceOutputCommand] from [OutputType] and [ClientDeviceCommandValue].
  ///
  /// [outputType] is the value of [OutputType].
  /// [value] is the value of [ClientDeviceCommandValue].
  ///
  /// Returns the [ClientDeviceOutputCommand] if the output type is supported.
  /// Returns null if the output type is not supported.
  ///
  /// Throws [UnsupportedError] for [OutputType.positionWithDuration] and [OutputType.unknown].
  static ClientDeviceOutputCommand? tryFrom(
    OutputType type,
    ClientDeviceCommandValue value,
  ) {
    return switch (type) {
      OutputType.vibrate => ClientDeviceOutputCommand.vibrate(value: value),
      OutputType.rotate => ClientDeviceOutputCommand.rotate(value: value),
      OutputType.oscillate => ClientDeviceOutputCommand.oscillate(value: value),
      OutputType.constrict => ClientDeviceOutputCommand.constrict(value: value),
      OutputType.temperature =>
        ClientDeviceOutputCommand.temperature(value: value),
      OutputType.led => ClientDeviceOutputCommand.led(value: value),
      OutputType.position => ClientDeviceOutputCommand.position(value: value),
      OutputType.spray => ClientDeviceOutputCommand.spray(value: value),
      OutputType.positionWithDuration => throw UnsupportedError(
          'Cannot use PositionWithDuration with this method'),
      OutputType.unknown => throw UnsupportedError('Unknown output type')
    };
  }
}
