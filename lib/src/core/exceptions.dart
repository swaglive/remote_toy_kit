/// Exception types for the remote-toy Bluetooth SDK.
///
/// [RemoteToyBluetoothException] covers BLE adapter and scanning errors.
/// [RemoteToyDeviceException] covers device-level command and feature errors.
/// Both carry a machine-readable [code] and an optional human-readable
/// [message].
library core.exceptions;

/// Exception thrown for Bluetooth adapter or scanning-level errors.
class RemoteToyBluetoothException implements Exception {
  RemoteToyBluetoothException({
    required this.code,
    this.message,
    this.details,
  });

  static const String codeNotInitialized = 'not_initialized';
  static const String codeSearchInProgress = 'search_in_progress';
  static const String codeBluetoothNotSupported = 'bluetooth_not_supported';
  static const String codeBluetoothInternalError = 'bluetooth_internal_error';
  static const String codeBluetoothPermission = 'bluetooth_permission';
  static const String codeBluetoothOff = 'bluetooth_off';
  static const String codeCancelSearch = 'cancel_search';
  static const String codeSearchError = 'search_error';

  final String code;
  final String? message;
  final dynamic details;

  @override
  String toString() =>
      'RemoteToyBluetoothException(code: $code, message: $message, details: $details)';
}

/// Exception thrown for device-level errors (unsupported commands,
/// feature mismatches, invalid endpoints, etc.).
class RemoteToyDeviceException implements Exception {
  RemoteToyDeviceException({
    required this.code,
    this.message,
    this.details,
  });

  static const String codeDeviceNotSupported = 'device_not_supported';
  static const String codeInvalidEndpoint = 'invalid_endpoint';
  static const String codeDeviceSpecificError = 'device_specific_error';
  static const String codeCommandNotSupported = 'command_not_supported';
  static const String codeCommandPayloadInvalid = 'command_payload_invalid';
  static const String codeCommandFeatureIndexError =
      'command_feature_index_error';
  static const String codeCommandFeatureTypeMismatch =
      'command_feature_type_mismatch';

  final String code;
  final String? message;
  final dynamic details;

  static String getFeatureIndexErrorMessage({
    required int count,
    required int index,
  }) =>
      'Device only has $count features, but was given an index of $index';

  static String getFeatureMismatchErrorMessage({
    required int index,
    required dynamic actualType,
    dynamic expectType,
  }) =>
      'Feature type mismatch, index $index got command for $actualType, but expects $expectType';

  @override
  String toString() =>
      'RemoteToyDeviceException(code: $code, message: $message, details: $details)';
}
