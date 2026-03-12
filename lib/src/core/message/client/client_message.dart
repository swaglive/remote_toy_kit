/// Sealed union of all client-to-device command messages.
///
/// Each variant maps to a specific protocol command (stop, output, input,
/// sensor subscribe/unsubscribe).
library core.message.client.client_message;

import 'package:freezed_annotation/freezed_annotation.dart';

import '../input_type.dart';
import '../v4/input_cmd.dart';
import '../v4/output_cmd.dart';

part 'client_message.freezed.dart';
part 'client_message.g.dart';

@freezed
sealed class RemoteToyClientMessage with _$RemoteToyClientMessage {
  const RemoteToyClientMessage._();

  const factory RemoteToyClientMessage.stopDeviceCmd() =
      StopDeviceCmdClientMessage;

  const factory RemoteToyClientMessage.stopAllDevices() =
      StopAllDevicesClientMessage;

  const factory RemoteToyClientMessage.sensorSubscribeCmd({
    required int featureIndex,
    required InputType inputType,
  }) = SensorSubscribeCmdClientMessage;

  const factory RemoteToyClientMessage.sensorUnsubscrubeCmd({
    required int featureIndex,
    required InputType inputType,
  }) = SensorUnsubscribeCmdClientMessage;

  /// Input command from client to device.
  const factory RemoteToyClientMessage.inputCmd({
    required InputCmd command,
  }) = InputCmdClientMessage;

  /// Output command from client to device.
  const factory RemoteToyClientMessage.outputCmd({
    required OutputCmd command,
  }) = OutputCmdClientMessage;

  factory RemoteToyClientMessage.fromJson(Map<String, dynamic> json) =>
      _$RemoteToyClientMessageFromJson(json);
}
