/// BLE advertisement specifier used to identify and match devices during
/// a scan by name, manufacturer data, or advertised service UUIDs.
///
/// Equality uses set-intersection semantics: two specifiers are equal if
/// their names (including wildcard suffix), manufacturer data, or
/// advertised services overlap.
library configuration.communication.bluetooth_le_specifier;

import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/message/message.dart';
import 'bluetooth_le_manufacturer_data.dart';

part 'bluetooth_le_specifier.freezed.dart';
part 'bluetooth_le_specifier.g.dart';

typedef BluetoothLeUuid = String;

/// Reads manufacturer data from both v3 ("manufacturer-data") and v4 ("manufacturer_data") formats.
Object? _readManufacturerData(Map<dynamic, dynamic> json, String _) =>
    json['manufacturer-data'] ?? json['manufacturer_data'];

/// Matches two [BluetoothLEManufacturerData] entries using the same
/// semantics as the Rust buttplug SDK (specifier.rs PartialEq):
///
/// 1. Company IDs must match.
/// 2. If either side has null data, match on company alone (wildcard).
/// 3. If lengths are equal, compare byte-for-byte.
/// 4. If lengths differ, check whether the shorter is a contiguous
///    subsequence of the longer.
bool _manufacturerDataMatches(
  BluetoothLEManufacturerData a,
  BluetoothLEManufacturerData b,
) {
  if (a.company != b.company) return false;
  if (a.data == null || b.data == null) return true;

  final Uint8List aData = a.data!;
  final Uint8List bData = b.data!;

  if (aData.length == bData.length) {
    for (int i = 0; i < aData.length; i++) {
      if (aData[i] != bData[i]) return false;
    }
    return true;
  }

  final Uint8List needle = aData.length < bData.length ? aData : bData;
  final Uint8List haystack = aData.length > bData.length ? aData : bData;

  for (int i = 0; i <= haystack.length - needle.length; i++) {
    bool found = true;
    for (int j = 0; j < needle.length; j++) {
      if (haystack[i + j] != needle[j]) {
        found = false;
        break;
      }
    }
    if (found) return true;
  }

  return false;
}

/// Reads advertised services from both v3 ("advertised-services") and v4 ("advertised_services") formats.
Object? _readAdvertisedServices(Map<dynamic, dynamic> json, String _) =>
    json['advertised-services'] ?? json['advertised_services'];

@Freezed(equal: false)
abstract class BluetoothLESpecifier with _$BluetoothLESpecifier {
  const BluetoothLESpecifier._();

  /// Bluetooth LE specifier.
  /// [names] is the name variants of the device or brand.
  /// [manufacturerData] is the list of [BluetoothLEManufacturerData].
  /// [advertisedServices] is the list of advertised service UUIDs.
  /// [services] is the map of service UUIDs to their endpoints.
  const factory BluetoothLESpecifier({
    required Set<String> names,
    @JsonKey(
        readValue: _readManufacturerData,
        defaultValue: <BluetoothLEManufacturerData>[])
    required List<BluetoothLEManufacturerData> manufacturerData,
    @JsonKey(readValue: _readAdvertisedServices, defaultValue: <String>{})
    required Set<BluetoothLeUuid> advertisedServices,
    required Map<BluetoothLeUuid, Map<Endpoint, BluetoothLeUuid>> services,
  }) = _BluetoothLESpecifier;

  /// Creates a Bluetooth LE specifier from a device.
  /// [name] is the name of the device.
  /// [manufactureData] is the manufacturer data of the device.
  /// [advertisedServices] is the advertised services of the device.
  /// Returns the Bluetooth LE specifier.
  factory BluetoothLESpecifier.fromDevice({
    required String name,
    required Map<int, Uint8List> manufactureData,
    required Iterable<BluetoothLeUuid> advertisedServices,
  }) =>
      BluetoothLESpecifier(
        names: <String>{name},
        manufacturerData: manufactureData.entries
            .map((e) =>
                BluetoothLEManufacturerData(company: e.key, data: e.value))
            .toList(),
        advertisedServices: Set<BluetoothLeUuid>.from(advertisedServices),
        services: {},
      );

  factory BluetoothLESpecifier.fromJson(Map<String, dynamic> json) =>
      _$BluetoothLESpecifierFromJson(json);

  /// Custom equality: returns true when any of the following overlap:
  /// 1. names (exact or wildcard match)
  /// 2. manufacturer data
  /// 3. advertised services
  @override
  bool operator ==(Object other) {
    if (other is! BluetoothLESpecifier) return false;
    // If names is found, use those automatically.
    if (names.intersection(other.names).isNotEmpty) {
      return true;
    }
    // Otherwise, try wildcarded names.
    for (final String name in names) {
      for (final String otherName in other.names) {
        String compareName, wildcard;
        if (name.endsWith('*')) {
          wildcard = name;
          compareName = otherName;
        } else if (otherName.endsWith('*')) {
          wildcard = otherName;
          compareName = name;
        } else {
          continue;
        }
        // Remove "*"" from the end of the wildcard
        wildcard = wildcard.substring(0, wildcard.length - 1);
        if (compareName.startsWith(wildcard)) {
          return true;
        }
      }
    }

    if (manufacturerData.isNotEmpty && other.manufacturerData.isNotEmpty) {
      for (final BluetoothLEManufacturerData data in manufacturerData) {
        if (other.manufacturerData
            .any((o) => _manufacturerDataMatches(data, o))) {
          return true;
        }
      }
    }

    if (advertisedServices.intersection(other.advertisedServices).isNotEmpty) {
      return true;
    }

    return false;
  }

  /// Returns the hash code for the Bluetooth LE specifier.
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(names),
      const DeepCollectionEquality().hash(manufacturerData),
      const DeepCollectionEquality().hash(advertisedServices),
      const DeepCollectionEquality().hash(services));
}
