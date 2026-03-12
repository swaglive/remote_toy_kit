/// Discriminator enum for [RemoteToyClientMessage] variants.
library core.message.client.client_message_type;

enum RemoteToyClientMessageType {
  stopDeviceCmd,
  stopAllDevices,
  sensorSubscribeCmd,
  sensorUnsubscribeCmd,
  inputCmd,
  outputCmd,
}
