// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluetooth_le_specifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BluetoothLESpecifier _$BluetoothLESpecifierFromJson(
        Map<String, dynamic> json) =>
    _BluetoothLESpecifier(
      names: (json['names'] as List<dynamic>).map((e) => e as String).toSet(),
      manufacturerData:
          (_readManufacturerData(json, 'manufacturerData') as List<dynamic>?)
                  ?.map((e) => BluetoothLEManufacturerData.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
      advertisedServices: (_readAdvertisedServices(json, 'advertisedServices')
                  as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          {},
      services: (json['services'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as Map<String, dynamic>).map(
              (k, e) =>
                  MapEntry($enumDecode(_$EndpointEnumMap, k), e as String),
            )),
      ),
    );

Map<String, dynamic> _$BluetoothLESpecifierToJson(
        _BluetoothLESpecifier instance) =>
    <String, dynamic>{
      'names': instance.names.toList(),
      'manufacturerData':
          instance.manufacturerData.map((e) => e.toJson()).toList(),
      'advertisedServices': instance.advertisedServices.toList(),
      'services': instance.services.map((k, e) =>
          MapEntry(k, e.map((k, e) => MapEntry(_$EndpointEnumMap[k]!, e)))),
    };

const _$EndpointEnumMap = {
  Endpoint.command: 'command',
  Endpoint.firmware: 'firmware',
  Endpoint.rx: 'rx',
  Endpoint.rxAccel: 'rxaccel',
  Endpoint.rxBleBattery: 'rxblebattery',
  Endpoint.rxBleModel: 'rxblemodel',
  Endpoint.rxPressure: 'rxpressure',
  Endpoint.rxTouch: 'rxtouch',
  Endpoint.tx: 'tx',
  Endpoint.txMode: 'txmode',
  Endpoint.txShock: 'txshock',
  Endpoint.txVibrate: 'txvibrate',
  Endpoint.txVendorControl: 'txvendorcontrol',
  Endpoint.whitelist: 'whitelist',
  Endpoint.generic0: 'generic0',
};
