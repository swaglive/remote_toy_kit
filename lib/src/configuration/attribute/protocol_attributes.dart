/// Device attributes for a specific protocol model, including its
/// display name, optional identifier list, and supported features.
library configuration.attribute.protocol_attributes;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../configuration.dart';

part 'protocol_attributes.freezed.dart';
part 'protocol_attributes.g.dart';

@freezed
abstract class ProtocolAttributes with _$ProtocolAttributes {
  const ProtocolAttributes._();

  /// Protocol attributes.
  /// [id] is the unique identifier string.
  /// [identifier] is the list of identifier strings.
  /// [name] is the name of the protocol.
  /// [features] is the list of [DeviceFeature].
  const factory ProtocolAttributes({
    String? id,
    List<String>? identifier,
    required String name,
    List<DeviceFeature>? features,
  }) = _ProtocolAttributes;

  factory ProtocolAttributes.fromJson(Map<String, dynamic> json) =>
      _$ProtocolAttributesFromJson(json);
}
