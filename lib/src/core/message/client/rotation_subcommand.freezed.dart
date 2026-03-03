// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rotation_subcommand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RotationSubcommand {
  int get featureIndex;
  double get speed;
  bool get clockwise;

  /// Create a copy of RotationSubcommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RotationSubcommandCopyWith<RotationSubcommand> get copyWith =>
      _$RotationSubcommandCopyWithImpl<RotationSubcommand>(
          this as RotationSubcommand, _$identity);

  /// Serializes this RotationSubcommand to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RotationSubcommand &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.clockwise, clockwise) ||
                other.clockwise == clockwise));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, featureIndex, speed, clockwise);

  @override
  String toString() {
    return 'RotationSubcommand(featureIndex: $featureIndex, speed: $speed, clockwise: $clockwise)';
  }
}

/// @nodoc
abstract mixin class $RotationSubcommandCopyWith<$Res> {
  factory $RotationSubcommandCopyWith(
          RotationSubcommand value, $Res Function(RotationSubcommand) _then) =
      _$RotationSubcommandCopyWithImpl;
  @useResult
  $Res call({int featureIndex, double speed, bool clockwise});
}

/// @nodoc
class _$RotationSubcommandCopyWithImpl<$Res>
    implements $RotationSubcommandCopyWith<$Res> {
  _$RotationSubcommandCopyWithImpl(this._self, this._then);

  final RotationSubcommand _self;
  final $Res Function(RotationSubcommand) _then;

  /// Create a copy of RotationSubcommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featureIndex = null,
    Object? speed = null,
    Object? clockwise = null,
  }) {
    return _then(_self.copyWith(
      featureIndex: null == featureIndex
          ? _self.featureIndex
          : featureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      speed: null == speed
          ? _self.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      clockwise: null == clockwise
          ? _self.clockwise
          : clockwise // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [RotationSubcommand].
extension RotationSubcommandPatterns on RotationSubcommand {
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
    TResult Function(_RotationSubcommand value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RotationSubcommand() when $default != null:
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
    TResult Function(_RotationSubcommand value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RotationSubcommand():
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
    TResult? Function(_RotationSubcommand value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RotationSubcommand() when $default != null:
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
    TResult Function(int featureIndex, double speed, bool clockwise)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RotationSubcommand() when $default != null:
        return $default(_that.featureIndex, _that.speed, _that.clockwise);
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
    TResult Function(int featureIndex, double speed, bool clockwise) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RotationSubcommand():
        return $default(_that.featureIndex, _that.speed, _that.clockwise);
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
    TResult? Function(int featureIndex, double speed, bool clockwise)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RotationSubcommand() when $default != null:
        return $default(_that.featureIndex, _that.speed, _that.clockwise);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RotationSubcommand implements RotationSubcommand {
  const _RotationSubcommand(
      {required this.featureIndex,
      required this.speed,
      required this.clockwise});
  factory _RotationSubcommand.fromJson(Map<String, dynamic> json) =>
      _$RotationSubcommandFromJson(json);

  @override
  final int featureIndex;
  @override
  final double speed;
  @override
  final bool clockwise;

  /// Create a copy of RotationSubcommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RotationSubcommandCopyWith<_RotationSubcommand> get copyWith =>
      __$RotationSubcommandCopyWithImpl<_RotationSubcommand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RotationSubcommandToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RotationSubcommand &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.clockwise, clockwise) ||
                other.clockwise == clockwise));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, featureIndex, speed, clockwise);

  @override
  String toString() {
    return 'RotationSubcommand(featureIndex: $featureIndex, speed: $speed, clockwise: $clockwise)';
  }
}

/// @nodoc
abstract mixin class _$RotationSubcommandCopyWith<$Res>
    implements $RotationSubcommandCopyWith<$Res> {
  factory _$RotationSubcommandCopyWith(
          _RotationSubcommand value, $Res Function(_RotationSubcommand) _then) =
      __$RotationSubcommandCopyWithImpl;
  @override
  @useResult
  $Res call({int featureIndex, double speed, bool clockwise});
}

/// @nodoc
class __$RotationSubcommandCopyWithImpl<$Res>
    implements _$RotationSubcommandCopyWith<$Res> {
  __$RotationSubcommandCopyWithImpl(this._self, this._then);

  final _RotationSubcommand _self;
  final $Res Function(_RotationSubcommand) _then;

  /// Create a copy of RotationSubcommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? featureIndex = null,
    Object? speed = null,
    Object? clockwise = null,
  }) {
    return _then(_RotationSubcommand(
      featureIndex: null == featureIndex
          ? _self.featureIndex
          : featureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      speed: null == speed
          ? _self.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      clockwise: null == clockwise
          ? _self.clockwise
          : clockwise // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
