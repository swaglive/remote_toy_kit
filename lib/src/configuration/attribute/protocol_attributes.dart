/// Device attributes for a specific protocol model, including its
/// display name, optional identifier list, and supported features.
library configuration.attribute.protocol_attributes;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/message/message.dart';
import '../configuration.dart';

part 'protocol_attributes.freezed.dart';
part 'protocol_attributes.g.dart';

@freezed
abstract class ProtocolAttributes with _$ProtocolAttributes {
  const ProtocolAttributes._();

  /// Protocol attributes.
  /// [id] is the unique identifier string, used in spec 4.0.
  /// [identifier] is the list of identifier strings.
  /// [name] is the name of the protocol.
  /// [features] is the list of [DeviceFeature].
  const factory ProtocolAttributes({
    String? id,
    List<String>? identifier,
    required String name,
    List<DeviceFeature>? features,
  }) = _ProtocolAttributes;

  factory ProtocolAttributes.fromJson(Map<String, dynamic> json) =>
      _$ProtocolAttributesFromJson(json);

  /// Check if any feature in this attribute set supports the given client [messageType].
  @Deprecated('Will be deprecated after spec 4.0 is fully released')
  bool isAllowedMessage({required RemoteToyClientMessageType messageType}) {
    for (final feature in features ?? []) {
      final actuatorMessageType =
          ActuatorFeatureMessageType.tryFrom(messageType: messageType);
      final DeviceFeatureActuator? actuator = feature.actuator;
      if (actuatorMessageType != null && actuator != null) {
        if (actuator.messages.contains(actuatorMessageType)) {
          return true;
        }
      }
      final sensorMessageType = SensorFeatureMessageType.tryFrom(
        messageType: messageType,
      );
      final DeviceFeatureSensor? sensor = feature.sensor;
      if (sensorMessageType != null && sensor != null) {
        if (sensor.messages.contains(sensorMessageType)) {
          return true;
        }
      }
    }
    return false;
  }
}
