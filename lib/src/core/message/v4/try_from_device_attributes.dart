/// Interface for constructing a validated command from raw command data
/// and [ProtocolAttributes].
library core.message.v4.try_from_device_attributes;

import '../../../configuration/attribute/protocol_attributes.dart';

/// Generic interface for creating a validated command from an
/// unchecked command and [ProtocolAttributes].
abstract class TryFromDeviceAttributes<T, Self> {
  static Self tryFromDeviceAttributes<T, Self>(
    T cmd,
    ProtocolAttributes attributes,
  ) {
    throw UnimplementedError('Must be implemented by subclass');
  }
}
