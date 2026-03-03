library core.message.client.scalar_subcommand;

import 'package:freezed_annotation/freezed_annotation.dart';

import '../output_type.dart';

part 'scalar_subcommand.freezed.dart';
part 'scalar_subcommand.g.dart';

@freezed
@Deprecated('Will be deprecated after spec 4.0 is fully released')
abstract class ScalarSubcommand with _$ScalarSubcommand {
  const factory ScalarSubcommand({
    required int featureIndex,
    required double scalar,
    required OutputType outputType,
  }) = _ScalarSubcommand;

  factory ScalarSubcommand.fromJson(Map<String, dynamic> json) =>
      _$ScalarSubcommandFromJson(json);
}
