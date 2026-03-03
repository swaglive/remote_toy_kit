/// V3 actuator command types that a feature can support.
///
/// Maps from [RemoteToyClientMessageType] to its configuration-level
/// equivalent so that [ProtocolAttributes.isAllowedMessage] can check
/// whether a given command is supported.
library configuration.attribute.actuator_feature_message_type;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/message/message.dart';

@JsonEnum(valueField: 'jsonValue')
@Deprecated('Will be deprecated after spec 4.0 is fully released')
enum ActuatorFeatureMessageType {
  scalarCmd(jsonValue: 'ScalarCmd'),
  rotateCmd(jsonValue: 'RotateCmd'),
  linearCmd(jsonValue: 'LinearCmd');

  const ActuatorFeatureMessageType({required this.jsonValue});

  /// Tries to get the [ActuatorFeatureMessageType] from the [RemoteToyClientMessageType].
  /// [messageType] is the message type to get the [ActuatorFeatureMessageType] for.
  /// Returns the [ActuatorFeatureMessageType] if successful, otherwise null.
  static ActuatorFeatureMessageType? tryFrom({
    required RemoteToyClientMessageType messageType,
  }) =>
      switch (messageType) {
        RemoteToyClientMessageType.scalarCmd =>
          ActuatorFeatureMessageType.scalarCmd,
        RemoteToyClientMessageType.rotateCmd =>
          ActuatorFeatureMessageType.rotateCmd,
        RemoteToyClientMessageType.linearCmd =>
          ActuatorFeatureMessageType.linearCmd,
        _ => null,
      };

  final String jsonValue;
}
