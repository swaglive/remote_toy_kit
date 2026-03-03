/// A single protocol entry in the device configuration, grouping
/// the BLE communication specifier, default attributes, and
/// per-model attribute overrides.
library configuration.protocol_definition;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'attribute/protocol_attributes.dart';
import 'communication/bluetooth_le_specifier.dart';

part 'protocol_definition.freezed.dart';
part 'protocol_definition.g.dart';

@freezed
abstract class ProtocolDefinition with _$ProtocolDefinition {
  /// Protocol definition.
  /// [communication] is the [BluetoothLESpecifier] for the protocol.
  /// [defaults] are the default [ProtocolAttributes]
  /// [configurations] is the list of [ProtocolAttributes].
  const factory ProtocolDefinition({
    @_CommunicationJsonConverter() BluetoothLESpecifier? communication,
    required ProtocolAttributes defaults,
    @JsonKey(defaultValue: <ProtocolAttributes>[])
    List<ProtocolAttributes>? configurations,
  }) = _ProtocolDefinition;

  factory ProtocolDefinition.fromJson(Map<String, dynamic> json) =>
      _$ProtocolDefinitionFromJson(json);
}

/// Converts the Buttplug JSON `communication` array (which wraps a
/// single `btle` object) into a [BluetoothLESpecifier].
class _CommunicationJsonConverter
    extends JsonConverter<BluetoothLESpecifier?, List<dynamic>> {
  const _CommunicationJsonConverter();

  /// Custom JSON converter for [BluetoothLESpecifier] that reads a Buttplug JSON
  /// `communication` list (expected to contain a single `{ "btle": ... }` object)
  /// to/from a [BluetoothLESpecifier] instance.
  @override
  BluetoothLESpecifier? fromJson(List json) {
    final dynamic firstElement = json.firstOrNull;
    if (firstElement == null) {
      throw StateError('Communication list is empty');
    }
    final dynamic btle = firstElement['btle'];
    if (btle == null) {
      return null;
    }
    return BluetoothLESpecifier.fromJson(btle);
  }

  /// Custom JSON converter for [BluetoothLESpecifier] that converts a [BluetoothLESpecifier]
  /// into a Buttplug JSON `communication` list (expected to contain a single `{ "btle": ... }` object).
  @override
  List toJson(BluetoothLESpecifier? object) {
    if (object == null) {
      return [];
    }

    return [
      {'btle': object.toJson()}
    ];
  }
}
