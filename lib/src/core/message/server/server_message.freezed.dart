// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
RemoteToyServerMessage _$RemoteToyServerMessageFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'empty':
      return EmptyServerMessage.fromJson(json);
    case 'reading':
      return RemoteToyServerReadingMessage.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'RemoteToyServerMessage',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$RemoteToyServerMessage {
  /// Serializes this RemoteToyServerMessage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RemoteToyServerMessage);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RemoteToyServerMessage()';
  }
}

/// @nodoc
class $RemoteToyServerMessageCopyWith<$Res> {
  $RemoteToyServerMessageCopyWith(
      RemoteToyServerMessage _, $Res Function(RemoteToyServerMessage) __);
}

/// Adds pattern-matching-related methods to [RemoteToyServerMessage].
extension RemoteToyServerMessagePatterns on RemoteToyServerMessage {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyServerMessage value)? empty,
    TResult Function(RemoteToyServerReadingMessage value)? reading,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case EmptyServerMessage() when empty != null:
        return empty(_that);
      case RemoteToyServerReadingMessage() when reading != null:
        return reading(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyServerMessage value) empty,
    required TResult Function(RemoteToyServerReadingMessage value) reading,
  }) {
    final _that = this;
    switch (_that) {
      case EmptyServerMessage():
        return empty(_that);
      case RemoteToyServerReadingMessage():
        return reading(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyServerMessage value)? empty,
    TResult? Function(RemoteToyServerReadingMessage value)? reading,
  }) {
    final _that = this;
    switch (_that) {
      case EmptyServerMessage() when empty != null:
        return empty(_that);
      case RemoteToyServerReadingMessage() when reading != null:
        return reading(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(int featureIndex, InputType inputType,
            @Uint8ListJsonConverter() Uint8List data)?
        reading,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case EmptyServerMessage() when empty != null:
        return empty();
      case RemoteToyServerReadingMessage() when reading != null:
        return reading(_that.featureIndex, _that.inputType, _that.data);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(int featureIndex, InputType inputType,
            @Uint8ListJsonConverter() Uint8List data)
        reading,
  }) {
    final _that = this;
    switch (_that) {
      case EmptyServerMessage():
        return empty();
      case RemoteToyServerReadingMessage():
        return reading(_that.featureIndex, _that.inputType, _that.data);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(int featureIndex, InputType inputType,
            @Uint8ListJsonConverter() Uint8List data)?
        reading,
  }) {
    final _that = this;
    switch (_that) {
      case EmptyServerMessage() when empty != null:
        return empty();
      case RemoteToyServerReadingMessage() when reading != null:
        return reading(_that.featureIndex, _that.inputType, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class EmptyServerMessage implements RemoteToyServerMessage {
  const EmptyServerMessage({final String? $type}) : $type = $type ?? 'empty';
  factory EmptyServerMessage.fromJson(Map<String, dynamic> json) =>
      _$EmptyServerMessageFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$EmptyServerMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EmptyServerMessage);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RemoteToyServerMessage.empty()';
  }
}

/// @nodoc
class $EmptyServerMessageCopyWith<$Res>
    implements $RemoteToyServerMessageCopyWith<$Res> {
  $EmptyServerMessageCopyWith(
      EmptyServerMessage _, $Res Function(EmptyServerMessage) __);
}

/// @nodoc
class _$EmptyServerMessageCopyWithImpl<$Res>
    implements $EmptyServerMessageCopyWith<$Res> {
  _$EmptyServerMessageCopyWithImpl(this._self, this._then);

  final EmptyServerMessage _self;
  final $Res Function(EmptyServerMessage) _then;
}

/// @nodoc
@JsonSerializable()
class RemoteToyServerReadingMessage implements RemoteToyServerMessage {
  const RemoteToyServerReadingMessage(
      {required this.featureIndex,
      required this.inputType,
      @Uint8ListJsonConverter() required this.data,
      final String? $type})
      : $type = $type ?? 'reading';
  factory RemoteToyServerReadingMessage.fromJson(Map<String, dynamic> json) =>
      _$RemoteToyServerReadingMessageFromJson(json);

  final int featureIndex;
  final InputType inputType;
  @Uint8ListJsonConverter()
  final Uint8List data;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of RemoteToyServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RemoteToyServerReadingMessageCopyWith<RemoteToyServerReadingMessage>
      get copyWith => _$RemoteToyServerReadingMessageCopyWithImpl<
          RemoteToyServerReadingMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RemoteToyServerReadingMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemoteToyServerReadingMessage &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.inputType, inputType) ||
                other.inputType == inputType) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, featureIndex, inputType,
      const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'RemoteToyServerMessage.reading(featureIndex: $featureIndex, inputType: $inputType, data: $data)';
  }
}

/// @nodoc
abstract mixin class $RemoteToyServerReadingMessageCopyWith<$Res>
    implements $RemoteToyServerMessageCopyWith<$Res> {
  factory $RemoteToyServerReadingMessageCopyWith(
          RemoteToyServerReadingMessage value,
          $Res Function(RemoteToyServerReadingMessage) _then) =
      _$RemoteToyServerReadingMessageCopyWithImpl;
  @useResult
  $Res call(
      {int featureIndex,
      InputType inputType,
      @Uint8ListJsonConverter() Uint8List data});
}

/// @nodoc
class _$RemoteToyServerReadingMessageCopyWithImpl<$Res>
    implements $RemoteToyServerReadingMessageCopyWith<$Res> {
  _$RemoteToyServerReadingMessageCopyWithImpl(this._self, this._then);

  final RemoteToyServerReadingMessage _self;
  final $Res Function(RemoteToyServerReadingMessage) _then;

  /// Create a copy of RemoteToyServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? featureIndex = null,
    Object? inputType = null,
    Object? data = null,
  }) {
    return _then(RemoteToyServerReadingMessage(
      featureIndex: null == featureIndex
          ? _self.featureIndex
          : featureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      inputType: null == inputType
          ? _self.inputType
          : inputType // ignore: cast_nullable_to_non_nullable
              as InputType,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

// dart format on
