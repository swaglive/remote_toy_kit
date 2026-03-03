/// BLE GATT characteristic endpoint identifiers.
///
/// Each value maps to a named endpoint in the device configuration
/// and resolves to a single characteristic UUID at connection time.
library core.message.endpoint;

import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(valueField: 'jsonKey')
enum Endpoint {
  /// Expect to take commands, when multiple receive endpoints may be available
  command(jsonKey: 'command'),

  /// Firmware updates (Buttplug does not update firmware, but some firmware endpoints are used for
  /// mode setting)
  firmware(jsonKey: 'firmware'),

  // Common receive endpoint name
  rx(jsonKey: 'rx'),

  /// Receive endpoint for accelerometer data
  rxAccel(jsonKey: 'rxaccel'),

  /// Receive endpoint for battery levels (usually expected to be BLE standard profile)
  rxBleBattery(jsonKey: 'rxblebattery'),

  /// Receive endpoint for BLE model (usually expected to be BLE standard profile)
  rxBleModel(jsonKey: 'rxblemodel'),

  /// Receive endpoint for pressure sensors
  rxPressure(jsonKey: 'rxpressure'),

  /// Receive endpoint for touch sensors
  rxTouch(jsonKey: 'rxtouch'),

  /// Common transmit endpoint name
  tx(jsonKey: 'tx'),

  /// Transmit endpoint for hardware mode setting.
  txMode(jsonKey: 'txmode'),

  /// Transmit endpoint for shock setting (unused)
  txShock(jsonKey: 'txshock'),

  /// Transmit endpoint for vibration setting
  txVibrate(jsonKey: 'txvibrate'),

  /// Transmit endpoint for vendor (proprietary) control
  txVendorControl(jsonKey: 'txvendorcontrol'),

  /// Transmit endpoint for whitelist updating
  whitelist(jsonKey: 'whitelist'),

  /// Generic endpoint (available for user configurations)
  generic0(jsonKey: 'generic0');

  const Endpoint({required this.jsonKey});

  final String jsonKey;
}
