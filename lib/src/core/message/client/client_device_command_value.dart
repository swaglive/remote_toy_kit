/// Client Device Command Value
///
/// Wraps the command value used when sending device commands. The value can be either
/// an integer or a double, depending on the UI component's range. For example, sliders
/// with a 0.0–1.0 range typically use doubles, while some features like vibrate may use
/// integers in a 0–100 range.
///
/// Reference: Buttplug Rust implementation (crates/buttplug_client/src/device/command.rs)
library core.message.client.client_device_command_value;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_device_command_value.freezed.dart';

@freezed
sealed class ClientDeviceCommandValue with _$ClientDeviceCommandValue {
  const ClientDeviceCommandValue._();

  /// Create a command value from an integer.
  const factory ClientDeviceCommandValue.fromInt({
    required int value,
  }) = ClientDeviceCommandValueInt;

  /// Create a command value from a double.
  const factory ClientDeviceCommandValue.fromDouble({
    required double value,
  }) = ClientDeviceCommandValueDouble;
}
