/// Sensor feature message types that a feature can support (read/subscribe).
///
/// Maps from [RemoteToyClientMessageType] to its configuration-level
/// equivalent for feature-level command validation.
library configuration.attribute.sensor_feature_message_type;

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/message/message.dart';

@JsonEnum(valueField: 'jsonValue')
enum SensorFeatureMessageType {
  /// Read command type.
  sensorReadCmd(jsonValue: 'SensorReadCmd'),

  /// Subscribe command type.
  sensorSubscribeCmd(jsonValue: 'SensorSubscribeCmd');

  const SensorFeatureMessageType({required this.jsonValue});

  /// Tries to get the [SensorFeatureMessageType] from the [RemoteToyClientMessageType].
  /// [messageType] is the message type to get the [SensorFeatureMessageType] for.
  /// Returns the [SensorFeatureMessageType] if successful, otherwise null.
  static SensorFeatureMessageType? tryFrom({
    required RemoteToyClientMessageType messageType,
  }) =>
      switch (messageType) {
        RemoteToyClientMessageType.sensorReadCmd =>
          SensorFeatureMessageType.sensorReadCmd,
        RemoteToyClientMessageType.sensorSubscribeCmd =>
          SensorFeatureMessageType.sensorSubscribeCmd,
        _ => null,
      };

  final String jsonValue;
}
