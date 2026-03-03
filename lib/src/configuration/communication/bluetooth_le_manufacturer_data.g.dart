// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluetooth_le_manufacturer_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BluetoothLEManufacturerData _$BluetoothLEManufacturerDataFromJson(
        Map<String, dynamic> json) =>
    _BluetoothLEManufacturerData(
      company: (json['company'] as num).toInt(),
      data: const Uint8ListOptionalJsonConverter()
          .fromJson(json['data'] as List?),
    );

Map<String, dynamic> _$BluetoothLEManufacturerDataToJson(
        _BluetoothLEManufacturerData instance) =>
    <String, dynamic>{
      'company': instance.company,
      'data': const Uint8ListOptionalJsonConverter().toJson(instance.data),
    };
