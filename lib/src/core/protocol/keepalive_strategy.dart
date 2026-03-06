/// Keepalive strategies for BLE device protocols.
///
/// Some BLE devices (e.g. Satisfyer) drop their connection when no commands
/// are received for a short period. A [ProtocolKeepaliveStrategy] tells
/// [RemoteToyDevice] how — and how often — to resend the last command
/// packet so the link stays alive during idle periods.
library core.protocol.keepalive_strategy;

/// Determines how a protocol keeps the BLE connection alive during idle
/// periods when no user commands are being sent.
sealed class ProtocolKeepaliveStrategy {
  const ProtocolKeepaliveStrategy();
}

/// No keepalive needed — the device stays connected on its own.
class ProtocolKeepaliveStrategyNone extends ProtocolKeepaliveStrategy {
  const ProtocolKeepaliveStrategyNone();
}

/// Resend the last command packet on a fixed [interval] to prevent the
/// device from dropping the BLE connection.
class ProtocolKeepaliveStrategyRepeatLastPacket
    extends ProtocolKeepaliveStrategy {
  const ProtocolKeepaliveStrategyRepeatLastPacket({required this.interval});

  final Duration interval;
}
