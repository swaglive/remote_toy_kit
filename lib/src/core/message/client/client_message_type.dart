/// Discriminator enum for [RemoteToyClientMessage] variants.
library core.message.client.client_message_type;

enum RemoteToyClientMessageType {
  stopDeviceCmd,
  stopAllDevices, // Spec 4.0
  @Deprecated('Will be deprecated after spec 4.0 is fully released')
  scalarCmd,
  @Deprecated('Will be deprecated after spec 4.0 is fully released')
  linearCmd,
  @Deprecated('Will be deprecated after spec 4.0 is fully released')
  rotateCmd,
  sensorReadCmd,
  sensorSubscribeCmd,
  sensorUnsubscribeCmd,
  inputCmd, // Spec 4.0
  outputCmd, // Spec 4.0
}
