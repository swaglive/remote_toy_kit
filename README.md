# Remote Toy Kit

A Flutter/Dart SDK for discovering, connecting to, and controlling BLE remote-toy devices. Supports both **mobile** (iOS / Android via Flutter Blue Plus) and **web** (via Web Bluetooth) platforms. Ported from the [Buttplug](https://buttplug.io) protocol with support for V3 and V4 device config specs.

## Features

- Cross-platform BLE communication (mobile + web)
- Automatic platform selection via factory constructor
- Stream-based device discovery
- V3 and V4 device configuration specs
- Output commands: vibrate, rotate, oscillate, constrict, position, LED, spray, temperature
- Input commands: battery, RSSI, button, pressure sensor reads and subscriptions
- Built-in protocol support for Lovense, Svakom (V5 / Pulse), and MonsterPub

## Supported Protocols & Devices

### Communication Protocol

Only **BLE (Bluetooth Low Energy)** is supported:

- Mobile (iOS / Android) via `flutter_blue_plus`
- Web via Web Bluetooth API (`flutter_web_bluetooth`)

No WiFi, HTTP, MQTT, IR, or RF support.

### Implemented Device Protocols

Only 4 of the 120+ protocol entries in the bundled V4 config have Dart implementations. Devices from other config entries will be discovered but rejected as unsupported.

| Protocol | Brand | Device |
|---|---|---|
| `lovense` | Lovense | Max, Nora, Edge, Ambi, Lush, Hush, Domi, Osci, Mission, Mission 2, Ferri, Diamo, Dolce, Osci 3, Gush, Gush 2, Hyphy, Calor, Flexer, Gemini, Gravity, Tenera, Ridge, Lapis, Vulse, Solace, Solace Pro, Sex Machine, Mini Sex Machine, Spinel |
| `lovense` | Loveai | Dolp |
| `monsterpub` | Sistalk | MonsterPub 2 Doctor Whale, MonsterPub Magic Kiss, MonsterPub 2 Mister Devil, MonsterPub Baby Youth Health, MonsterPub KiniCat, MonsterPub BeatHeart, MonsterPub 1P Mister Devil, MonsterPub Sweet, MonsterPub Amazing, MonsterPub Pop, MonsterHub Tornado |
| `monsterpub` | Tracy's Dog | Surreal, Craybit Pro |
| `svakom-v5` | Svakom | Chika, Mora Neo, Trysta Neo, Mini Emma Neo |
| `svakom-pulse` | Svakom | Pulse Lite Neo, Pulse Union, Pulse Galaxie, Mimiki |
| `svakom-pulse` | BeYourLover | Kyukyu |
| `svakom-pulse` | Coleur Dor | VX045A, HX029A |
| `svakom-pulse` | Momonii | Agatha |

## Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  remote_toy_kit:
    git:
      url: git@github.com:swaglive/remote_toy_kit.git
      ref: v0.1.0  # e.g. v0.1.0
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

## Real-World Use Cases

### Dependency injection with GetIt

Register a single `RemoteToyKit` instance and initialize it at app startup:

```dart
import 'package:get_it/get_it.dart';
import 'package:remote_toy_kit/remote_toy_kit.dart';

void setupDependencies() {
  GetIt.instance
      .registerLazySingleton<RemoteToyKit>(() => RemoteToyKit(isSpecV4: true));
}

Future<void> main() async {
  setupDependencies();

  final remoteToyKit = GetIt.instance.get<RemoteToyKit>();
  await remoteToyKit.initialize();

  runApp(const MyApp());
}
```

### BLE device browser with error handling

A reusable browser class that scans for devices, batches updates with debounce, and surfaces BLE errors to the UI:

```dart
class RemoteToyBrowser {
  final RemoteToyKit _kit;
  final _devices = <String, RemoteToySearchedDevice>{};
  final _error$ = PublishSubject<Object>();
  CompositeSubscription? _subscriptions;

  RemoteToyBrowser(this._kit);

  Stream<Object> get onError => _error$.stream;

  void startSearch() {
    if (_kit.isSearchInProgress) return;
    _subscriptions?.dispose();
    _subscriptions = CompositeSubscription();

    try {
      final scanned$ = _kit.search().asBroadcastStream();

      scanned$.listen(
        (device) {
          _devices[device.address] = device;
        },
        onError: (e, s) => _error$.add(e),
        cancelOnError: false,
      ).addTo(_subscriptions!);

      scanned$
          .debounceTime(const Duration(seconds: 1))
          .listen((_) => _onBatchReady());
    } catch (e) {
      if (e is RemoteToyBluetoothException &&
          e.code == RemoteToyBluetoothException.codeCancelSearch) {
        return;
      }
      _error$.add(e);
    }
  }

  void stopSearch() {
    _subscriptions?.dispose();
    _subscriptions = null;
  }

  void _onBatchReady() {
    // Process the collected devices, e.g. update UI state.
  }
}
```

### Handling BLE errors in the UI

Map SDK exceptions to user-facing messages:

```dart
browser.onError.listen((error) {
  if (error is RemoteToyBluetoothException) {
    switch (error.code) {
      case RemoteToyBluetoothException.codeBluetoothPermission:
        showSnackBar('Bluetooth permission is required');
        return;
      case RemoteToyBluetoothException.codeBluetoothOff:
        showSnackBar('Please turn on Bluetooth');
        return;
    }
  }
  showSnackBar('An unexpected error occurred');
});
```

### Connect with state machine pattern

Manage the device lifecycle (idle / connecting / connected) with automatic reconnection:

```dart
class DeviceStateMachine {
  final RemoteToySearchedDevice searchedDevice;
  RemoteToyDevice? _device;
  StreamSubscription? _connectionSub;

  DeviceStateMachine({required this.searchedDevice});

  Future<void> connect() async {
    try {
      _device = await searchedDevice.connector.connect();
      _listenConnectionState();
    } catch (e) {
      // Retry after a delay
      Future.delayed(const Duration(seconds: 5), connect);
    }
  }

  void _listenConnectionState() {
    _connectionSub = _device?.connected$.listen((connected) {
      if (!connected) {
        _device = null;
        _connectionSub?.cancel();
        // Auto-reconnect
        Future.delayed(const Duration(seconds: 3), connect);
      }
    });
  }

  Future<void> disconnect() async {
    _connectionSub?.cancel();
    if (_device != null) {
      await _device!.executeCommand(
        message: const RemoteToyClientMessage.stopDeviceCmd(),
      );
      await Future.delayed(const Duration(milliseconds: 100));
      await _device!.disconnect();
      _device = null;
    }
  }
}
```

### Send output commands per device feature (V4)

Iterate over a device's features and send matching output commands using `convertClientCmdtoOutputCmd`:

```dart
Future<void> sendVibration(RemoteToyDevice device, double intensity) async {
  final commandValue = ClientDeviceCommandValue.fromDouble(value: intensity);
  final command = ClientDeviceOutputCommand.vibrate(value: commandValue);

  final messages = device.features
      .where((f) => f.featureType == FeatureType.vibrate)
      .map((f) => f.convertClientCmdtoOutputCmd(command))
      .map((cmd) => RemoteToyClientMessage.outputCmd(command: cmd));

  for (final message in messages) {
    await device.executeCommand(message: message).catchError((e) {
      if (e is RemoteToyDeviceException &&
          e.code == RemoteToyDeviceException.codeCommandNotSupported) {
        return; // skip unsupported features gracefully
      }
      rethrow;
    });
  }
}
```

### Read battery level

Query the battery sensor for a connected device:

```dart
Future<void> readBattery(RemoteToyDevice device) async {
  final batteryFeature = device.features
      .firstWhereOrNull((f) => f.featureType == FeatureType.battery);
  if (batteryFeature == null) return;

  // V4
  final response = await device.executeCommand(
    message: RemoteToyClientMessage.inputCmd(
      command: InputCmd.v4(
        featureIndex: batteryFeature.featureIndex,
        inputType: InputType.battery,
        inputCommandType: InputCommandType.read,
      ),
    ),
  );

  if (response is RemoteToyServerReadingMessage) {
    print('Battery data: ${response.data}');
  }
}
```

### Throttled slider control

Use `rxdart` to throttle slider value changes so the device isn't flooded with commands:

```dart
class VibrateSlider extends StatefulWidget {
  final RemoteToyDevice device;
  final RemoteToyDeviceFeature feature;
  const VibrateSlider({required this.device, required this.feature, super.key});

  @override
  State<VibrateSlider> createState() => _VibrateSliderState();
}

class _VibrateSliderState extends State<VibrateSlider> {
  final _value$ = BehaviorSubject<double>.seeded(0);
  late final StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    _sub = _value$
        .throttleTime(const Duration(milliseconds: 100), trailing: true)
        .listen((value) {
      final cmdValue = ClientDeviceCommandValue.fromDouble(value: value);
      final command = ClientDeviceOutputCommand.vibrate(value: cmdValue);
      final outputCmd = widget.feature.convertClientCmdtoOutputCmd(command);
      widget.device.executeCommand(
        message: RemoteToyClientMessage.outputCmd(command: outputCmd),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _value$.value,
      onChanged: (v) {
        setState(() => _value$.add(v));
      },
    );
  }

  @override
  void dispose() {
    _sub.cancel();
    _value$.close();
    super.dispose();
  }
}
```

### Graceful stop-then-disconnect

Always stop device output before disconnecting to avoid leaving the device in an active state:

```dart
Future<void> safeDisconnect(RemoteToyDevice device) async {
  await device.executeCommand(
    message: const RemoteToyClientMessage.stopDeviceCmd(),
  );
  await Future.delayed(const Duration(milliseconds: 100));
  await device.disconnect();
}
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

### Commit conventions

This repo enforces [Conventional Commits](https://www.conventionalcommits.org/) via a `commit-msg` pre-commit hook. Every commit message must follow the format:

```
<type>: <description>
```

Allowed types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`.

Install the hooks after cloning:

```bash
pre-commit install
```

### Creating a release

The release workflow runs automatically when a tag matching `v*` is pushed. It generates a changelog from conventional commit messages and creates a GitHub Release.

```bash
git tag v0.1.0
git push origin v0.1.0
```

The workflow will:

1. Collect commits since the previous tag and categorize them (`feat`, `fix`, `docs`, `refactor`, etc.).
2. Open a PR that prepends the new section to `CHANGELOG.md`.
3. Create a GitHub Release with the generated changelog.

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
