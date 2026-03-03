/// Semantic version (major.minor) of a Buttplug device configuration file.
library configuration.device_configuration_version;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_configuration_version.freezed.dart';
part 'device_configuration_version.g.dart';

@freezed
abstract class DeviceConfigurationVersion with _$DeviceConfigurationVersion {
  /// Device configuration version.
  /// [major] is the major version.
  /// [minor] is the minor version.
  const factory DeviceConfigurationVersion({
    required int major,
    required int minor,
  }) = _DeviceConfigurationVersion;

  factory DeviceConfigurationVersion.fromJson(Map<String, dynamic> json) =>
      _$DeviceConfigurationVersionFromJson(json);
}
