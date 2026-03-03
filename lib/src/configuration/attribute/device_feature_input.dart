/// V4 input feature configuration listing supported input capabilities
/// (battery, RSSI, button, pressure) and their properties.
library configuration.attribute.device_feature_input;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../remote_toy_kit.dart';

part 'device_feature_input.freezed.dart';
part 'device_feature_input.g.dart';

@freezed
abstract class DeviceFeatureInput with _$DeviceFeatureInput {
  const DeviceFeatureInput._();

  /// Device feature input.
  /// [battery] is the battery input properties.
  /// [rssi] is the rssi input properties.
  /// [button] is the button input properties.
  /// [pressure] is the pressure input properties.
  const factory DeviceFeatureInput({
    @JsonKey(name: 'battery') DeviceFeatureInputProperties? battery,
    @JsonKey(name: 'rssi') DeviceFeatureInputProperties? rssi,
    @JsonKey(name: 'button') DeviceFeatureInputProperties? button,
    @JsonKey(name: 'pressure') DeviceFeatureInputProperties? pressure,
  }) = _DeviceFeatureInput;

  factory DeviceFeatureInput.fromJson(Map<String, dynamic> json) =>
      _$DeviceFeatureInputFromJson(json);

  /// Check if the given input type is contained in this device feature input.
  ///
  /// [inputType] is the input type to check if it is contained in this device feature input.
  ///
  /// Returns [bool] result indicating if the input type is contained in this device feature input.
  bool contains(InputType inputType) {
    return switch (inputType) {
      InputType.battery => battery != null,
      InputType.rssi => rssi != null,
      InputType.button => button != null,
      InputType.pressure => pressure != null,
      _ => false,
    };
  }

  /// Returns the feature type for this device feature input.
  /// If not found, return [FeatureType.unknown].
  FeatureType get featureType {
    if (battery != null) {
      return FeatureType.battery;
    } else if (rssi != null) {
      return FeatureType.rssi;
    } else if (button != null) {
      return FeatureType.button;
    } else if (pressure != null) {
      return FeatureType.pressure;
    } else {
      return FeatureType.unknown;
    }
  }

  /// Try to get the properties for the given input type.
  ///
  /// [inputType] is the input type to get the properties for.
  ///
  /// Returns the [DeviceFeatureInputProperties] for the given input type.
  /// Returns null if the input type is not found.
  DeviceFeatureInputProperties? tryFrom(InputType inputType) {
    return switch (inputType) {
      InputType.battery => battery,
      InputType.rssi => rssi,
      InputType.button => button,
      InputType.pressure => pressure,
      _ => null,
    };
  }
}
