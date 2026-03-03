// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vector_subcommand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VectorSubcommand {
  int get featureIndex;
  @MillisecondDurationJsonConverter()
  Duration get duration;
  double get position;

  /// Create a copy of VectorSubcommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VectorSubcommandCopyWith<VectorSubcommand> get copyWith =>
      _$VectorSubcommandCopyWithImpl<VectorSubcommand>(
          this as VectorSubcommand, _$identity);

  /// Serializes this VectorSubcommand to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VectorSubcommand &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, featureIndex, duration, position);

  @override
  String toString() {
    return 'VectorSubcommand(featureIndex: $featureIndex, duration: $duration, position: $position)';
  }
}

/// @nodoc
abstract mixin class $VectorSubcommandCopyWith<$Res> {
  factory $VectorSubcommandCopyWith(
          VectorSubcommand value, $Res Function(VectorSubcommand) _then) =
      _$VectorSubcommandCopyWithImpl;
  @useResult
  $Res call(
      {int featureIndex,
      @MillisecondDurationJsonConverter() Duration duration,
      double position});
}

/// @nodoc
class _$VectorSubcommandCopyWithImpl<$Res>
    implements $VectorSubcommandCopyWith<$Res> {
  _$VectorSubcommandCopyWithImpl(this._self, this._then);

  final VectorSubcommand _self;
  final $Res Function(VectorSubcommand) _then;

  /// Create a copy of VectorSubcommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featureIndex = null,
    Object? duration = null,
    Object? position = null,
  }) {
    return _then(_self.copyWith(
      featureIndex: null == featureIndex
          ? _self.featureIndex
          : featureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [VectorSubcommand].
extension VectorSubcommandPatterns on VectorSubcommand {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VectorSubcommand value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VectorSubcommand() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_VectorSubcommand value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VectorSubcommand():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VectorSubcommand value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VectorSubcommand() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int featureIndex,
            @MillisecondDurationJsonConverter() Duration duration,
            double position)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VectorSubcommand() when $default != null:
        return $default(_that.featureIndex, _that.duration, _that.position);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            int featureIndex,
            @MillisecondDurationJsonConverter() Duration duration,
            double position)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VectorSubcommand():
        return $default(_that.featureIndex, _that.duration, _that.position);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int featureIndex,
            @MillisecondDurationJsonConverter() Duration duration,
            double position)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VectorSubcommand() when $default != null:
        return $default(_that.featureIndex, _that.duration, _that.position);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VectorSubcommand implements VectorSubcommand {
  _VectorSubcommand(
      {required this.featureIndex,
      @MillisecondDurationJsonConverter() required this.duration,
      required this.position});
  factory _VectorSubcommand.fromJson(Map<String, dynamic> json) =>
      _$VectorSubcommandFromJson(json);

  @override
  final int featureIndex;
  @override
  @MillisecondDurationJsonConverter()
  final Duration duration;
  @override
  final double position;

  /// Create a copy of VectorSubcommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VectorSubcommandCopyWith<_VectorSubcommand> get copyWith =>
      __$VectorSubcommandCopyWithImpl<_VectorSubcommand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VectorSubcommandToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VectorSubcommand &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, featureIndex, duration, position);

  @override
  String toString() {
    return 'VectorSubcommand(featureIndex: $featureIndex, duration: $duration, position: $position)';
  }
}

/// @nodoc
abstract mixin class _$VectorSubcommandCopyWith<$Res>
    implements $VectorSubcommandCopyWith<$Res> {
  factory _$VectorSubcommandCopyWith(
          _VectorSubcommand value, $Res Function(_VectorSubcommand) _then) =
      __$VectorSubcommandCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int featureIndex,
      @MillisecondDurationJsonConverter() Duration duration,
      double position});
}

/// @nodoc
class __$VectorSubcommandCopyWithImpl<$Res>
    implements _$VectorSubcommandCopyWith<$Res> {
  __$VectorSubcommandCopyWithImpl(this._self, this._then);

  final _VectorSubcommand _self;
  final $Res Function(_VectorSubcommand) _then;

  /// Create a copy of VectorSubcommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? featureIndex = null,
    Object? duration = null,
    Object? position = null,
  }) {
    return _then(_VectorSubcommand(
      featureIndex: null == featureIndex
          ? _self.featureIndex
          : featureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
