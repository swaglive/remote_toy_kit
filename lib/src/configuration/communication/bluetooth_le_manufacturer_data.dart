/// BLE manufacturer-specific advertisement data, consisting of
/// a company identifier and an optional payload.
library configuration.communication.bluetooth_le_manufacturer_data;

import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../util/json/uint8_list_json_converter.dart';

part 'bluetooth_le_manufacturer_data.freezed.dart';
part 'bluetooth_le_manufacturer_data.g.dart';

@freezed
abstract class BluetoothLEManufacturerData with _$BluetoothLEManufacturerData {
  /// Bluetooth LE manufacturer data.
  /// [company] is the company identifier, it integer value here.
  /// [data] is the [Uint8List] of the data.
  const factory BluetoothLEManufacturerData({
    required int company,
    @Uint8ListOptionalJsonConverter() Uint8List? data,
  }) = _BluetoothLEManufacturerData;

  factory BluetoothLEManufacturerData.fromJson(Map<String, dynamic> json) =>
      _$BluetoothLEManufacturerDataFromJson(json);
}
