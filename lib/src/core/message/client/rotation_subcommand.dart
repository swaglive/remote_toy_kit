library core.message.client.rotation_subcommand;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'rotation_subcommand.freezed.dart';
part 'rotation_subcommand.g.dart';

@freezed
@Deprecated('Will be deprecated after spec 4.0 is fully released')
abstract class RotationSubcommand with _$RotationSubcommand {
  const factory RotationSubcommand({
    required int featureIndex,
    required double speed,
    required bool clockwise,
  }) = _RotationSubcommand;

  factory RotationSubcommand.fromJson(Map<String, dynamic> json) =>
      _$RotationSubcommandFromJson(json);
}
