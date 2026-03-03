# Remote Toy Kit

A Flutter/Dart SDK for discovering, connecting to, and controlling BLE remote-toy devices. Supports both **mobile** (iOS / Android via Flutter Blue Plus) and **web** (via Web Bluetooth) platforms. Ported from the [Buttplug](https://buttplug.io) protocol with support for V3 and V4 device config specs.

## Features

- Cross-platform BLE communication (mobile + web)
- Automatic platform selection via factory constructor
- Stream-based device discovery
- V3 and V4 device configuration specs
- Output commands: vibrate, rotate, oscillate, constrict, position, LED, spray, temperature
- Input commands: battery, RSSI, button, pressure sensor reads and subscriptions
- Built-in protocol support for Lovense, Svakom, MonsterPub, and more

## Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  remote_toy_kit:
    git:
      url: <repo-url>
      path: remote_toy_kit
```

### Platform setup

#### Android

Add BLE permissions to `AndroidManifest.xml`:

```xml
<uses-feature android:name="android.hardware.bluetooth_le" android:required="true" />
<uses-permission android:name="android.permission.BLUETOOTH_SCAN" />
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
```

#### iOS

Add to `Info.plist`:

```xml
<key>NSBluetoothAlwaysUsageDescription</key>
<string>Used to communicate with BLE remote-toy devices</string>
<key>UIBackgroundModes</key>
<array>
  <string>bluetooth-central</string>
</array>
```

#### Web

No additional setup required. Uses the browser's Web Bluetooth API.

## Getting Started

### 1. Initialize

```dart
import 'package:remote_toy_kit/remote_toy_kit.dart';

final kit = RemoteToyKit(isSpecV4: true); // or false for V3
await kit.initialize();
```

### 2. Search for devices

```dart
kit.search().listen((RemoteToySearchedDevice device) {
  print('Found: ${device.name} (${device.address})');
});
```

### 3. Connect

```dart
final RemoteToyDevice device = await searchedDevice.connector.connect();
```

### 4. Inspect features

```dart
for (final feature in device.features) {
  print('Feature #${feature.featureIndex}: ${feature.featureType}');
}
```

### 5. Send commands

#### Output (V4)

```dart
final outputCmd = OutputCmd.v4(
  featureIndex: 0,
  command: OutputCommand.vibrate(
    outputValue: OutputValue(/* ... */),
  ),
);

await device.executeCommand(
  message: RemoteToyClientMessage.outputCmd(command: outputCmd),
);
```

#### Output (V3 — deprecated)

```dart
await device.executeCommand(
  message: RemoteToyClientMessage.scalarCmd(
    scalars: [
      ScalarSubcommand(
        featureIndex: 0,
        scalar: 0.5,
        outputType: OutputType.vibrate,
      ),
    ],
  ),
);
```

#### Input / Sensor read (V4)

```dart
final response = await device.executeCommand(
  message: RemoteToyClientMessage.inputCmd(
    command: InputCmd.v4(
      featureIndex: 0,
      inputType: InputType.battery,
      inputCommandType: InputCommandType.read,
    ),
  ),
);
```

#### Stop

```dart
await device.executeCommand(
  message: RemoteToyClientMessage.stopDeviceCmd(),
);
```

### 6. Disconnect

```dart
await device.disconnect();
```

### 7. Listen to connection state

```dart
device.connected$.listen((bool isConnected) {
  print('Connected: $isConnected');
});
```

## API Reference

### RemoteToyKit

| Member | Description |
|---|---|
| `factory RemoteToyKit({required bool isSpecV4})` | Creates a platform-appropriate instance (mobile or web) |
| `Future<void> initialize()` | Loads device config and sets up BLE resources |
| `bool get isSearchInProgress` | Whether a scan is currently running |
| `Stream<RemoteToySearchedDevice> search()` | Scans for nearby BLE devices |

### RemoteToySearchedDevice

| Member | Description |
|---|---|
| `String name` | Advertised device name |
| `String address` | Device BLE address |
| `RemoteToyDeviceConnector connector` | Call `.connect()` to establish a connection |

### RemoteToyDevice

| Member | Description |
|---|---|
| `List<RemoteToyDeviceFeature> get features` | Available device features |
| `Stream<bool> get connected$` | Connection state stream |
| `bool get connected` | Current connection state |
| `String name()` | Device display name |
| `String get id` | Unique device identifier |
| `Future<RemoteToyServerMessage> executeCommand({required RemoteToyClientMessage message})` | Send a command to the device |
| `Future<void> disconnect()` | Disconnect from the device |

### RemoteToyClientMessage

| Factory | Description |
|---|---|
| `.outputCmd({required OutputCmd command})` | V4 output command (vibrate, rotate, etc.) |
| `.inputCmd({required InputCmd command})` | V4 input command (sensor read/subscribe) |
| `.scalarCmd(...)` | *(Deprecated)* V3 scalar output |
| `.rotateCmd(...)` | *(Deprecated)* V3 rotation output |
| `.linearCmd(...)` | *(Deprecated)* V3 linear output |
| `.sensorReadCmd(...)` | V3 sensor read |
| `.sensorSubscribeCmd(...)` | V3 sensor subscribe |
| `.sensorUnsubscrubeCmd(...)` | V3 sensor unsubscribe |
| `.stopDeviceCmd()` | Stop the connected device |
| `.stopAllDevices()` | Stop all connected devices |

### Enums

| Enum | Values |
|---|---|
| `OutputType` | `vibrate`, `rotate`, `oscillate`, `constrict`, `position`, `positionWithDuration`, `temperature`, `led`, `spray` |
| `InputType` | `battery`, `rssi`, `button`, `pressure` |
| `FeatureType` | All output + input types combined |
| `DeviceConfigVersion` | `v3`, `v4` |

## Error Handling

The SDK throws two exception types:

### RemoteToyBluetoothException

Thrown during BLE operations (scanning, permissions, adapter state).

| Code | Meaning |
|---|---|
| `not_initialized` | `initialize()` was not called |
| `search_in_progress` | A scan is already running |
| `bluetooth_not_supported` | Device does not support BLE |
| `bluetooth_permission` | Missing BLE permissions |
| `bluetooth_off` | Bluetooth adapter is off |
| `search_error` | Generic scan failure |

### RemoteToyDeviceException

Thrown during device communication and command execution.

| Code | Meaning |
|---|---|
| `device_not_supported` | No matching protocol for this device |
| `command_not_supported` | Device does not support this command type |
| `command_feature_index_error` | Feature index is out of range |
| `command_feature_type_mismatch` | Command type doesn't match the feature |
| `command_payload_invalid` | Invalid command payload |

## Device Config Versions

The SDK ships two bundled JSON configs under `assets/`:

- **V4** (`buttplug-device-config-v4.json`) — preferred, richer feature model with typed output/input definitions and per-feature value ranges.
- **V3** (`buttplug-device-config-v3.json`) — legacy format with actuator/sensor abstractions.

Pass `isSpecV4: true` (recommended) or `false` when constructing `RemoteToyKit`.

## Development

### Code generation

The project uses `freezed` and `json_serializable`. After modifying annotated classes:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Running the example app

```bash
cd example
flutter run
```

### Running tests

```bash
flutter test
```

## Dependencies

| Package | Purpose |
|---|---|
| `flutter_blue_plus` | BLE on iOS/Android |
| `flutter_web_bluetooth` | BLE on web |
| `rxdart` | Reactive stream utilities |
| `freezed_annotation` / `freezed` | Immutable data classes + unions |
| `json_annotation` / `json_serializable` | JSON serialization |
| `fimber` | Logging |
| `synchronized` | Mutex / lock utilities |

## License

See [LICENSE](LICENSE) for details.
