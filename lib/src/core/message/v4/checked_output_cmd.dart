/// Checked Output Command
///
/// Represents a validated output command with associated feature index, feature ID,
/// and command type. This is typically constructed after checking device protocol attributes
/// to ensure the command is valid for the specified device feature. Used to encapsulate
/// device commands in a type-safe manner after protocol verification.
///
/// Reference: Buttplug Rust implementation (crates/buttplug_server/src/message/v4/checked_output_cmd.rs)
library core.message.v4.checked_output_cmd;

import '../../../configuration/attribute/protocol_attributes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../v4/output_cmd.dart';
import '../../../configuration/attribute/device_feature.dart';
import 'try_from_device_attributes.dart';

part 'checked_output_cmd.freezed.dart';

/// Checked Output Command Implementation
@Freezed(fromJson: false, toJson: false)
sealed class CheckedOutputCmd
    with _$CheckedOutputCmd
    implements TryFromDeviceAttributes<OutputCmd, CheckedOutputCmd> {
  const CheckedOutputCmd._();

  /// V4 Checked Output Command
  /// [featureIndex] is the index of the feature.
  /// [featureId] is the unique identifier string of the feature.
  /// [command] is the object of [OutputCommand].
  const factory CheckedOutputCmd.v4({
    required int featureIndex,
    required String featureId,
    required OutputCommand command,
  }) = CheckedOutputCmdV4;

  /// Try to create a checked output command from the given output command and protocol attributes.
  ///
  /// This is only allowed for spec 4.0. required the protocol attributes's features has to be DeviceFeatureV4.
  ///
  /// [cmd] is unchecked output command from app requested.
  /// [attributes] is the protocol attributes of the device.
  ///
  /// Returns the checked output command [CheckedOutputCmd].
  ///
  /// Throws an exception if the output command is not valid for the specified device feature.
  ///
  static CheckedOutputCmd tryFromDeviceAttributes(
    OutputCmd cmd,
    ProtocolAttributes attributes,
  ) {
    final features = attributes.features;
    if (features == null) {
      throw Exception('No features found');
    }

    final outputType = cmd.command.outputType;

    // Temporary cast to DeviceFeatureV4 for now due to could be DeviceFeatureV3 or DeviceFeatureV4
    final feature = features.firstWhere(
      (feature) =>
          (feature as DeviceFeatureV4).output?.contains(outputType) == true,
      orElse: () => throw Exception('Feature not found'),
    ) as DeviceFeatureV4;

    final output = feature.output;
    final value = cmd.command.value;
    if (output == null) {
      throw Exception('Output not found');
    }

    // Calculate new value and generate checked command
    final calculatedValue = output.calculateFromValue(outputType, value);
    final checkedCommand = cmd.command.setValue(calculatedValue);

    return CheckedOutputCmdV4(
      featureIndex: cmd.featureIndex,
      featureId: feature.id,
      command: checkedCommand,
    );
  }
}
