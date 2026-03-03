library core.message.client.vector_subcommand;

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../util/json/millisecond_duration_json_converter.dart';

part 'vector_subcommand.freezed.dart';
part 'vector_subcommand.g.dart';

@freezed
@Deprecated('Will be deprecated after spec 4.0 is fully released')
abstract class VectorSubcommand with _$VectorSubcommand {
  factory VectorSubcommand({
    required int featureIndex,
    @MillisecondDurationJsonConverter() required Duration duration,
    required double position,
  }) = _VectorSubcommand;

  factory VectorSubcommand.fromJson(Map<String, dynamic> json) =>
      _$VectorSubcommandFromJson(json);
}
