// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scalar_subcommand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScalarSubcommand {
  int get featureIndex;
  double get scalar;
  OutputType get outputType;

  /// Create a copy of ScalarSubcommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScalarSubcommandCopyWith<ScalarSubcommand> get copyWith =>
      _$ScalarSubcommandCopyWithImpl<ScalarSubcommand>(
          this as ScalarSubcommand, _$identity);

  /// Serializes this ScalarSubcommand to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScalarSubcommand &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.scalar, scalar) || other.scalar == scalar) &&
            (identical(other.outputType, outputType) ||
                other.outputType == outputType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, featureIndex, scalar, outputType);

  @override
  String toString() {
    return 'ScalarSubcommand(featureIndex: $featureIndex, scalar: $scalar, outputType: $outputType)';
  }
}

/// @nodoc
abstract mixin class $ScalarSubcommandCopyWith<$Res> {
  factory $ScalarSubcommandCopyWith(
          ScalarSubcommand value, $Res Function(ScalarSubcommand) _then) =
      _$ScalarSubcommandCopyWithImpl;
  @useResult
  $Res call({int featureIndex, double scalar, OutputType outputType});
}

/// @nodoc
class _$ScalarSubcommandCopyWithImpl<$Res>
    implements $ScalarSubcommandCopyWith<$Res> {
  _$ScalarSubcommandCopyWithImpl(this._self, this._then);

  final ScalarSubcommand _self;
  final $Res Function(ScalarSubcommand) _then;

  /// Create a copy of ScalarSubcommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featureIndex = null,
    Object? scalar = null,
    Object? outputType = null,
  }) {
    return _then(_self.copyWith(
      featureIndex: null == featureIndex
          ? _self.featureIndex
          : featureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      scalar: null == scalar
          ? _self.scalar
          : scalar // ignore: cast_nullable_to_non_nullable
              as double,
      outputType: null == outputType
          ? _self.outputType
          : outputType // ignore: cast_nullable_to_non_nullable
              as OutputType,
    ));
  }
}

/// Adds pattern-matching-related methods to [ScalarSubcommand].
extension ScalarSubcommandPatterns on ScalarSubcommand {
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
    TResult Function(_ScalarSubcommand value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScalarSubcommand() when $default != null:
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
    TResult Function(_ScalarSubcommand value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScalarSubcommand():
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
    TResult? Function(_ScalarSubcommand value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScalarSubcommand() when $default != null:
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
    TResult Function(int featureIndex, double scalar, OutputType outputType)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScalarSubcommand() when $default != null:
        return $default(_that.featureIndex, _that.scalar, _that.outputType);
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
    TResult Function(int featureIndex, double scalar, OutputType outputType)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScalarSubcommand():
        return $default(_that.featureIndex, _that.scalar, _that.outputType);
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
    TResult? Function(int featureIndex, double scalar, OutputType outputType)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScalarSubcommand() when $default != null:
        return $default(_that.featureIndex, _that.scalar, _that.outputType);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ScalarSubcommand implements ScalarSubcommand {
  const _ScalarSubcommand(
      {required this.featureIndex,
      required this.scalar,
      required this.outputType});
  factory _ScalarSubcommand.fromJson(Map<String, dynamic> json) =>
      _$ScalarSubcommandFromJson(json);

  @override
  final int featureIndex;
  @override
  final double scalar;
  @override
  final OutputType outputType;

  /// Create a copy of ScalarSubcommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScalarSubcommandCopyWith<_ScalarSubcommand> get copyWith =>
      __$ScalarSubcommandCopyWithImpl<_ScalarSubcommand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ScalarSubcommandToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScalarSubcommand &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.scalar, scalar) || other.scalar == scalar) &&
            (identical(other.outputType, outputType) ||
                other.outputType == outputType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, featureIndex, scalar, outputType);

  @override
  String toString() {
    return 'ScalarSubcommand(featureIndex: $featureIndex, scalar: $scalar, outputType: $outputType)';
  }
}

/// @nodoc
abstract mixin class _$ScalarSubcommandCopyWith<$Res>
    implements $ScalarSubcommandCopyWith<$Res> {
  factory _$ScalarSubcommandCopyWith(
          _ScalarSubcommand value, $Res Function(_ScalarSubcommand) _then) =
      __$ScalarSubcommandCopyWithImpl;
  @override
  @useResult
  $Res call({int featureIndex, double scalar, OutputType outputType});
}

/// @nodoc
class __$ScalarSubcommandCopyWithImpl<$Res>
    implements _$ScalarSubcommandCopyWith<$Res> {
  __$ScalarSubcommandCopyWithImpl(this._self, this._then);

  final _ScalarSubcommand _self;
  final $Res Function(_ScalarSubcommand) _then;

  /// Create a copy of ScalarSubcommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? featureIndex = null,
    Object? scalar = null,
    Object? outputType = null,
  }) {
    return _then(_ScalarSubcommand(
      featureIndex: null == featureIndex
          ? _self.featureIndex
          : featureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      scalar: null == scalar
          ? _self.scalar
          : scalar // ignore: cast_nullable_to_non_nullable
              as double,
      outputType: null == outputType
          ? _self.outputType
          : outputType // ignore: cast_nullable_to_non_nullable
              as OutputType,
    ));
  }
}

// dart format on
