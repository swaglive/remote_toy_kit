/// Sealed command types sent to [Hardware] for BLE operations.
library core.hardware.hardware_cmd;

import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../message/message.dart';

part 'hardware_cmd.freezed.dart';

@Freezed(fromJson: false, toJson: false)
sealed class HardwareCmd with _$HardwareCmd {
  /// Read command to [Hardware].
  /// [endpoint] is the endpoint to read from.
  const factory HardwareCmd.read({
    required Endpoint endpoint,
  }) = HardwareReadCmd;

  /// Write command to [Hardware].
  /// [endpoint] is the endpoint to write to.
  /// [data] is the data to write.
  /// [writeWithResponse] is whether to write with response.
  const factory HardwareCmd.write({
    required Endpoint endpoint,
    required Uint8List data,
    required bool writeWithResponse,
  }) = HardwareWriteCmd;

  /// Subscribe command to [Hardware].
  /// [endpoint] is the endpoint to subscribe to.
  const factory HardwareCmd.subscribe({
    required Endpoint endpoint,
  }) = HardwareSubscribeCmd;

  /// Unsubscribe command from [Hardware].
  /// [endpoint] is the endpoint to unsubscribe from.
  const factory HardwareCmd.unsubscribe({
    required Endpoint endpoint,
  }) = HardwareUnsubscribeCmd;
}
