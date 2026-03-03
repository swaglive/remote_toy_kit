/// Sealed union of all client-to-device command messages.
///
/// Each variant maps to a specific protocol command (stop, scalar,
/// rotate, sensor, etc.). Spec 4.0 adds [InputCmdClientMessage]
/// and [OutputCmdClientMessage].
library core.message.client.client_message;

import 'package:freezed_annotation/freezed_annotation.dart';

import '../input_type.dart';
import 'client_message_type.dart';
import 'rotation_subcommand.dart';
import 'scalar_subcommand.dart';
import 'vector_subcommand.dart';
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
      StopAllDevicesClientMessage; // Spec 4.0

  @Deprecated('Will be deprecated after spec 4.0 is fully released')
  const factory RemoteToyClientMessage.scalarCmd({
    required List<ScalarSubcommand> scalars,
  }) = ScalarCmdClientMessage;

  @Deprecated('Will be deprecated after spec 4.0 is fully released')
  const factory RemoteToyClientMessage.linearCmd({
    required List<VectorSubcommand> vectors,
  }) = LinearCmdClientMessage;

  @Deprecated('Will be deprecated after spec 4.0 is fully released')
  const factory RemoteToyClientMessage.rotateCmd({
    required List<RotationSubcommand> rotations,
  }) = RotateCmdClientMessage;

  @Deprecated('Will be deprecated after spec 4.0 is fully released')
  const factory RemoteToyClientMessage.sensorReadCmd({
    required int featureIndex,
    required InputType inputType,
  }) = SensorReadCmdClientMessage;

  const factory RemoteToyClientMessage.sensorSubscribeCmd({
    required int featureIndex,
    required InputType inputType,
  }) = SensorSubscribeCmdClientMessage;

  const factory RemoteToyClientMessage.sensorUnsubscrubeCmd({
    required int featureIndex,
    required InputType inputType,
  }) = SensorUnsubscribeCmdClientMessage;

  /// Input command from client to device.
  /// [InputCmd] is the input command.
  const factory RemoteToyClientMessage.inputCmd({
    required InputCmd command,
  }) = InputCmdClientMessage; // Spec 4.0

  /// Output command from client to device.
  /// [OutputCmd] is the output command.
  const factory RemoteToyClientMessage.outputCmd({
    required OutputCmd command,
  }) = OutputCmdClientMessage; // Spec 4.0

  factory RemoteToyClientMessage.fromJson(Map<String, dynamic> json) =>
      _$RemoteToyClientMessageFromJson(json);

  /// Returns the type of the client message.
  RemoteToyClientMessageType get type => switch (this) {
        StopDeviceCmdClientMessage() =>
          RemoteToyClientMessageType.stopDeviceCmd,
        StopAllDevicesClientMessage() =>
          RemoteToyClientMessageType.stopAllDevices,
        ScalarCmdClientMessage() => RemoteToyClientMessageType.scalarCmd,
        LinearCmdClientMessage() => RemoteToyClientMessageType.linearCmd,
        RotateCmdClientMessage() => RemoteToyClientMessageType.rotateCmd,
        SensorReadCmdClientMessage() =>
          RemoteToyClientMessageType.sensorReadCmd,
        SensorSubscribeCmdClientMessage() =>
          RemoteToyClientMessageType.sensorSubscribeCmd,
        SensorUnsubscribeCmdClientMessage() =>
          RemoteToyClientMessageType.sensorUnsubscribeCmd,
        InputCmdClientMessage() => RemoteToyClientMessageType.inputCmd,
        OutputCmdClientMessage() => RemoteToyClientMessageType.outputCmd,
      };
}
