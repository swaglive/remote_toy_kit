/// Events emitted by hardware when subscribed characteristic values change.
library core.hardware.hardware_event;

import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../message/message.dart';

part 'hardware_event.freezed.dart';

@Freezed(fromJson: false, toJson: false)
sealed class HardwareEvent with _$HardwareEvent {
  const factory HardwareEvent.notification({
    required String id,
    required Endpoint endpoint,
    required Uint8List data,
  }) = NotificationHardwareEvent;
}
