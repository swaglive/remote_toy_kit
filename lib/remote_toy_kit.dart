/// Public entry point for the remote-toy Bluetooth SDK.
///
/// Exports all public API symbols and defines [RemoteToyKit], the
/// top-level interface for initializing, scanning, and connecting to
/// BLE remote-toy devices. Platform selection (web vs mobile) is handled
/// automatically by the factory constructor.
library remote_toy_kit;

import 'package:flutter/foundation.dart';

import 'remote_toy_kit.dart';
import 'src/mobile/remote_toy_kit_mobile.dart';
import 'src/web/remote_toy_kit_web.dart';

export 'src/configuration/configuration.dart';
export 'src/core/exceptions.dart';
export 'src/core/message/message.dart';
export 'src/remote_toy_device.dart';
export 'src/remote_toy_searched_device.dart';
export 'src/remote_toy_device_feature.dart';

/// Top-level SDK interface for BLE remote-toy device discovery and connection.
///
/// The factory constructor selects the platform-specific implementation
/// ([RemoteToyKitWeb] or [RemoteToyKitMobile]) based on [kIsWeb].
abstract interface class RemoteToyKit {
  /// Creates a platform-appropriate [RemoteToyKit] instance.
  ///
  /// Set [isSpecV4] to `true` to use the V4 device config spec,
  /// or `false` for V3.
  factory RemoteToyKit({required bool isSpecV4}) {
    final DeviceConfigVersion deviceConfigVersion =
        isSpecV4 ? DeviceConfigVersion.v4 : DeviceConfigVersion.v3;
    return kIsWeb
        ? RemoteToyKitWeb(deviceConfigVersion: deviceConfigVersion)
        : RemoteToyKitMobile(deviceConfigVersion: deviceConfigVersion);
  }

  /// Initializes the SDK: sets up Bluetooth resources and loads the
  /// supported-device configuration.
  Future<void> initialize();

  bool get isSearchInProgress;

  /// Scans for nearby BLE devices and emits discovered devices.
  ///
  /// - Throws [RemoteToyBluetoothException] on BLE scanning errors.
  /// - Throws [RemoteToyDeviceException] on device identification errors.
  Stream<RemoteToySearchedDevice> search();
}
