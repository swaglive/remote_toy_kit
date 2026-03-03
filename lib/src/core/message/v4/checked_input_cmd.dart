/// Checked Input Command
///
/// Represents a validated input command with associated feature index, feature ID,
/// and command type. This is typically constructed after checking device protocol attributes
/// to ensure the command is valid for the specified device feature. Used to encapsulate
/// device commands in a type-safe manner after protocol verification.
///
/// Reference: Buttplug Rust implementation (crates/buttplug_server/src/message/v4/checked_input_cmd.rs)
library core.message.v4.checked_input_cmd;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../message.dart';
import '../../../configuration/configuration.dart';
import 'try_from_device_attributes.dart';

part 'checked_input_cmd.freezed.dart';

/// Checked Output Command Implementation
///
/// This is the implementation of the checked output command for spec 4.0.
@Freezed(fromJson: false, toJson: false)
sealed class CheckedInputCmd
    with _$CheckedInputCmd
    implements TryFromDeviceAttributes<InputCmd, CheckedInputCmd> {
  const CheckedInputCmd._();

  /// V4 Checked Input Command
  /// [featureIndex] is the index of the feature.
  /// [featureId] is the unique identifier string of the feature.
  /// [inputType] is the object of [InputType].
  /// [inputCommandType] is the object of [InputCommandType].
  const factory CheckedInputCmd.v4({
    required int featureIndex,
    required String featureId,
    required InputType inputType,
    required InputCommandType inputCommandType,
  }) = CheckedInputCmdV4;

  /// Try to create a checked input command from the given input command and protocol attributes.
  ///
  /// This is only allowed for spec 4.0. required the protocol attributes's features has to be DeviceFeatureV4.
  ///
  /// [cmd] is unchecked output command from app requested.
  /// [attributes] is the protocol attributes of the device.
  ///
  /// Returns the checked input command [CheckedInputCmd].
  ///
  /// Throws an exception if the output command is not valid for the specified device feature.
  static CheckedInputCmd tryFromDeviceAttributes(
    InputCmd cmd,
    ProtocolAttributes attributes,
  ) {
    final features = attributes.features;
    if (features == null) {
      throw Exception('No features found');
    }

    final inputType = cmd.inputType;

    // Ensure the device feature contains the input type
    // and return the first feature that contains the input type.
    // If not found, throw an exception.
    final feature = features.firstWhere(
      (feature) =>
          (feature as DeviceFeatureV4).input?.contains(inputType) == true,
      orElse: () => throw Exception('Feature not found'),
    ) as DeviceFeatureV4;

    return CheckedInputCmdV4(
      featureIndex: cmd.featureIndex,
      featureId: feature.id,
      inputType: inputType,
      inputCommandType: cmd.inputCommandType,
    );
  }
}
