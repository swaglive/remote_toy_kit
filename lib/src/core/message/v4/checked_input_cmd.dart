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
import '../../exceptions.dart';
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
      throw RemoteToyDeviceException(
        code: RemoteToyDeviceException.codeDeviceNoFeatures,
        message: 'Device has no features configured in protocol attributes',
      );
    }

    final inputType = cmd.inputType;

    final feature = features.firstWhere(
      (feature) => feature.input?.contains(inputType) == true,
      orElse: () => throw RemoteToyDeviceException(
        code: RemoteToyDeviceException.codeDeviceFeatureNotFound,
        message: 'No feature found supporting input type $inputType',
      ),
    );

    return CheckedInputCmdV4(
      featureIndex: cmd.featureIndex,
      featureId: feature.id,
      inputType: inputType,
      inputCommandType: cmd.inputCommandType,
    );
  }
}
