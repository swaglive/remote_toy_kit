import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

class Uint8ListOptionalJsonConverter
    extends JsonConverter<Uint8List?, List<dynamic>?> {
  const Uint8ListOptionalJsonConverter();

  @override
  Uint8List? fromJson(List<dynamic>? json) {
    if (json == null) return null;
    try {
      final List<int> array = json.cast<int>();
      return Uint8List.fromList(array);
    } catch (_) {
      return null;
    }
  }

  @override
  List<dynamic>? toJson(Uint8List? object) {
    if (object == null) return null;
    return object.toList();
  }
}

class Uint8ListJsonConverter extends JsonConverter<Uint8List, List<dynamic>> {
  const Uint8ListJsonConverter();

  @override
  Uint8List fromJson(List<dynamic> json) {
    try {
      final List<int> array = json.cast<int>();
      return Uint8List.fromList(array);
    } catch (_) {
      return Uint8List(0);
    }
  }

  @override
  List<dynamic> toJson(Uint8List object) {
    return object.toList();
  }
}
