// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'output_cmd.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OutputValue {
  int get value;

  /// Create a copy of OutputValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OutputValueCopyWith<OutputValue> get copyWith =>
      _$OutputValueCopyWithImpl<OutputValue>(this as OutputValue, _$identity);

  /// Serializes this OutputValue to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OutputValue &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'OutputValue(value: $value)';
  }
}

/// @nodoc
abstract mixin class $OutputValueCopyWith<$Res> {
  factory $OutputValueCopyWith(
          OutputValue value, $Res Function(OutputValue) _then) =
      _$OutputValueCopyWithImpl;
  @useResult
  $Res call({int value});
}

/// @nodoc
class _$OutputValueCopyWithImpl<$Res> implements $OutputValueCopyWith<$Res> {
  _$OutputValueCopyWithImpl(this._self, this._then);

  final OutputValue _self;
  final $Res Function(OutputValue) _then;

  /// Create a copy of OutputValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_self.copyWith(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [OutputValue].
extension OutputValuePatterns on OutputValue {
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
    TResult Function(_OutputValue value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OutputValue() when $default != null:
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
    TResult Function(_OutputValue value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OutputValue():
        return $default(_that);
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
    TResult? Function(_OutputValue value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OutputValue() when $default != null:
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
    TResult Function(int value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OutputValue() when $default != null:
        return $default(_that.value);
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
    TResult Function(int value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OutputValue():
        return $default(_that.value);
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
    TResult? Function(int value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OutputValue() when $default != null:
        return $default(_that.value);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OutputValue extends OutputValue {
  const _OutputValue({required this.value}) : super._();
  factory _OutputValue.fromJson(Map<String, dynamic> json) =>
      _$OutputValueFromJson(json);

  @override
  final int value;

  /// Create a copy of OutputValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OutputValueCopyWith<_OutputValue> get copyWith =>
      __$OutputValueCopyWithImpl<_OutputValue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OutputValueToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OutputValue &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'OutputValue(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$OutputValueCopyWith<$Res>
    implements $OutputValueCopyWith<$Res> {
  factory _$OutputValueCopyWith(
          _OutputValue value, $Res Function(_OutputValue) _then) =
      __$OutputValueCopyWithImpl;
  @override
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$OutputValueCopyWithImpl<$Res> implements _$OutputValueCopyWith<$Res> {
  __$OutputValueCopyWithImpl(this._self, this._then);

  final _OutputValue _self;
  final $Res Function(_OutputValue) _then;

  /// Create a copy of OutputValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(_OutputValue(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$OutputPositionWithDuration {
  int get value;
  int get duration;

  /// Create a copy of OutputPositionWithDuration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OutputPositionWithDurationCopyWith<OutputPositionWithDuration>
      get copyWith =>
          _$OutputPositionWithDurationCopyWithImpl<OutputPositionWithDuration>(
              this as OutputPositionWithDuration, _$identity);

  /// Serializes this OutputPositionWithDuration to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OutputPositionWithDuration &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, duration);

  @override
  String toString() {
    return 'OutputPositionWithDuration(value: $value, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $OutputPositionWithDurationCopyWith<$Res> {
  factory $OutputPositionWithDurationCopyWith(OutputPositionWithDuration value,
          $Res Function(OutputPositionWithDuration) _then) =
      _$OutputPositionWithDurationCopyWithImpl;
  @useResult
  $Res call({int value, int duration});
}

/// @nodoc
class _$OutputPositionWithDurationCopyWithImpl<$Res>
    implements $OutputPositionWithDurationCopyWith<$Res> {
  _$OutputPositionWithDurationCopyWithImpl(this._self, this._then);

  final OutputPositionWithDuration _self;
  final $Res Function(OutputPositionWithDuration) _then;

  /// Create a copy of OutputPositionWithDuration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? duration = null,
  }) {
    return _then(_self.copyWith(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [OutputPositionWithDuration].
extension OutputPositionWithDurationPatterns on OutputPositionWithDuration {
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
    TResult Function(_OutputPositionWithDuration value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OutputPositionWithDuration() when $default != null:
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
    TResult Function(_OutputPositionWithDuration value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OutputPositionWithDuration():
        return $default(_that);
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
    TResult? Function(_OutputPositionWithDuration value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OutputPositionWithDuration() when $default != null:
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
    TResult Function(int value, int duration)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OutputPositionWithDuration() when $default != null:
        return $default(_that.value, _that.duration);
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
    TResult Function(int value, int duration) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OutputPositionWithDuration():
        return $default(_that.value, _that.duration);
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
    TResult? Function(int value, int duration)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OutputPositionWithDuration() when $default != null:
        return $default(_that.value, _that.duration);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OutputPositionWithDuration extends OutputPositionWithDuration {
  const _OutputPositionWithDuration(
      {required this.value, required this.duration})
      : super._();
  factory _OutputPositionWithDuration.fromJson(Map<String, dynamic> json) =>
      _$OutputPositionWithDurationFromJson(json);

  @override
  final int value;
  @override
  final int duration;

  /// Create a copy of OutputPositionWithDuration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OutputPositionWithDurationCopyWith<_OutputPositionWithDuration>
      get copyWith => __$OutputPositionWithDurationCopyWithImpl<
          _OutputPositionWithDuration>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OutputPositionWithDurationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OutputPositionWithDuration &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, duration);

  @override
  String toString() {
    return 'OutputPositionWithDuration(value: $value, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class _$OutputPositionWithDurationCopyWith<$Res>
    implements $OutputPositionWithDurationCopyWith<$Res> {
  factory _$OutputPositionWithDurationCopyWith(
          _OutputPositionWithDuration value,
          $Res Function(_OutputPositionWithDuration) _then) =
      __$OutputPositionWithDurationCopyWithImpl;
  @override
  @useResult
  $Res call({int value, int duration});
}

/// @nodoc
class __$OutputPositionWithDurationCopyWithImpl<$Res>
    implements _$OutputPositionWithDurationCopyWith<$Res> {
  __$OutputPositionWithDurationCopyWithImpl(this._self, this._then);

  final _OutputPositionWithDuration _self;
  final $Res Function(_OutputPositionWithDuration) _then;

  /// Create a copy of OutputPositionWithDuration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
    Object? duration = null,
  }) {
    return _then(_OutputPositionWithDuration(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

OutputCommand _$OutputCommandFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'vibrate':
      return OutputCommandVibrate.fromJson(json);
    case 'rotate':
      return OutputCommandRotate.fromJson(json);
    case 'oscillate':
      return OutputCommandOscillate.fromJson(json);
    case 'constrict':
      return OutputCommandConstrict.fromJson(json);
    case 'temperature':
      return OutputCommandTemperature.fromJson(json);
    case 'led':
      return OutputCommandLed.fromJson(json);
    case 'position':
      return OutputCommandPosition.fromJson(json);
    case 'positionWithDuration':
      return OutputCommandPositionWithDuration.fromJson(json);
    case 'spray':
      return OutputCommandSpray.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'OutputCommand',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$OutputCommand {
  Object get outputValue;

  /// Serializes this OutputCommand to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OutputCommand &&
            const DeepCollectionEquality()
                .equals(other.outputValue, outputValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(outputValue));

  @override
  String toString() {
    return 'OutputCommand(outputValue: $outputValue)';
  }
}

/// @nodoc
class $OutputCommandCopyWith<$Res> {
  $OutputCommandCopyWith(OutputCommand _, $Res Function(OutputCommand) __);
}

/// Adds pattern-matching-related methods to [OutputCommand].
extension OutputCommandPatterns on OutputCommand {
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
    TResult Function(OutputCommandVibrate value)? vibrate,
    TResult Function(OutputCommandRotate value)? rotate,
    TResult Function(OutputCommandOscillate value)? oscillate,
    TResult Function(OutputCommandConstrict value)? constrict,
    TResult Function(OutputCommandTemperature value)? temperature,
    TResult Function(OutputCommandLed value)? led,
    TResult Function(OutputCommandPosition value)? position,
    TResult Function(OutputCommandPositionWithDuration value)?
        positionWithDuration,
    TResult Function(OutputCommandSpray value)? spray,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case OutputCommandVibrate() when vibrate != null:
        return vibrate(_that);
      case OutputCommandRotate() when rotate != null:
        return rotate(_that);
      case OutputCommandOscillate() when oscillate != null:
        return oscillate(_that);
      case OutputCommandConstrict() when constrict != null:
        return constrict(_that);
      case OutputCommandTemperature() when temperature != null:
        return temperature(_that);
      case OutputCommandLed() when led != null:
        return led(_that);
      case OutputCommandPosition() when position != null:
        return position(_that);
      case OutputCommandPositionWithDuration()
          when positionWithDuration != null:
        return positionWithDuration(_that);
      case OutputCommandSpray() when spray != null:
        return spray(_that);
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
    required TResult Function(OutputCommandVibrate value) vibrate,
    required TResult Function(OutputCommandRotate value) rotate,
    required TResult Function(OutputCommandOscillate value) oscillate,
    required TResult Function(OutputCommandConstrict value) constrict,
    required TResult Function(OutputCommandTemperature value) temperature,
    required TResult Function(OutputCommandLed value) led,
    required TResult Function(OutputCommandPosition value) position,
    required TResult Function(OutputCommandPositionWithDuration value)
        positionWithDuration,
    required TResult Function(OutputCommandSpray value) spray,
  }) {
    final _that = this;
    switch (_that) {
      case OutputCommandVibrate():
        return vibrate(_that);
      case OutputCommandRotate():
        return rotate(_that);
      case OutputCommandOscillate():
        return oscillate(_that);
      case OutputCommandConstrict():
        return constrict(_that);
      case OutputCommandTemperature():
        return temperature(_that);
      case OutputCommandLed():
        return led(_that);
      case OutputCommandPosition():
        return position(_that);
      case OutputCommandPositionWithDuration():
        return positionWithDuration(_that);
      case OutputCommandSpray():
        return spray(_that);
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
    TResult? Function(OutputCommandVibrate value)? vibrate,
    TResult? Function(OutputCommandRotate value)? rotate,
    TResult? Function(OutputCommandOscillate value)? oscillate,
    TResult? Function(OutputCommandConstrict value)? constrict,
    TResult? Function(OutputCommandTemperature value)? temperature,
    TResult? Function(OutputCommandLed value)? led,
    TResult? Function(OutputCommandPosition value)? position,
    TResult? Function(OutputCommandPositionWithDuration value)?
        positionWithDuration,
    TResult? Function(OutputCommandSpray value)? spray,
  }) {
    final _that = this;
    switch (_that) {
      case OutputCommandVibrate() when vibrate != null:
        return vibrate(_that);
      case OutputCommandRotate() when rotate != null:
        return rotate(_that);
      case OutputCommandOscillate() when oscillate != null:
        return oscillate(_that);
      case OutputCommandConstrict() when constrict != null:
        return constrict(_that);
      case OutputCommandTemperature() when temperature != null:
        return temperature(_that);
      case OutputCommandLed() when led != null:
        return led(_that);
      case OutputCommandPosition() when position != null:
        return position(_that);
      case OutputCommandPositionWithDuration()
          when positionWithDuration != null:
        return positionWithDuration(_that);
      case OutputCommandSpray() when spray != null:
        return spray(_that);
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
    TResult Function(OutputValue outputValue)? vibrate,
    TResult Function(OutputValue outputValue)? rotate,
    TResult Function(OutputValue outputValue)? oscillate,
    TResult Function(OutputValue outputValue)? constrict,
    TResult Function(OutputValue outputValue)? temperature,
    TResult Function(OutputValue outputValue)? led,
    TResult Function(OutputValue outputValue)? position,
    TResult Function(OutputPositionWithDuration outputValue)?
        positionWithDuration,
    TResult Function(OutputValue outputValue)? spray,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case OutputCommandVibrate() when vibrate != null:
        return vibrate(_that.outputValue);
      case OutputCommandRotate() when rotate != null:
        return rotate(_that.outputValue);
      case OutputCommandOscillate() when oscillate != null:
        return oscillate(_that.outputValue);
      case OutputCommandConstrict() when constrict != null:
        return constrict(_that.outputValue);
      case OutputCommandTemperature() when temperature != null:
        return temperature(_that.outputValue);
      case OutputCommandLed() when led != null:
        return led(_that.outputValue);
      case OutputCommandPosition() when position != null:
        return position(_that.outputValue);
      case OutputCommandPositionWithDuration()
          when positionWithDuration != null:
        return positionWithDuration(_that.outputValue);
      case OutputCommandSpray() when spray != null:
        return spray(_that.outputValue);
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
    required TResult Function(OutputValue outputValue) vibrate,
    required TResult Function(OutputValue outputValue) rotate,
    required TResult Function(OutputValue outputValue) oscillate,
    required TResult Function(OutputValue outputValue) constrict,
    required TResult Function(OutputValue outputValue) temperature,
    required TResult Function(OutputValue outputValue) led,
    required TResult Function(OutputValue outputValue) position,
    required TResult Function(OutputPositionWithDuration outputValue)
        positionWithDuration,
    required TResult Function(OutputValue outputValue) spray,
  }) {
    final _that = this;
    switch (_that) {
      case OutputCommandVibrate():
        return vibrate(_that.outputValue);
      case OutputCommandRotate():
        return rotate(_that.outputValue);
      case OutputCommandOscillate():
        return oscillate(_that.outputValue);
      case OutputCommandConstrict():
        return constrict(_that.outputValue);
      case OutputCommandTemperature():
        return temperature(_that.outputValue);
      case OutputCommandLed():
        return led(_that.outputValue);
      case OutputCommandPosition():
        return position(_that.outputValue);
      case OutputCommandPositionWithDuration():
        return positionWithDuration(_that.outputValue);
      case OutputCommandSpray():
        return spray(_that.outputValue);
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
    TResult? Function(OutputValue outputValue)? vibrate,
    TResult? Function(OutputValue outputValue)? rotate,
    TResult? Function(OutputValue outputValue)? oscillate,
    TResult? Function(OutputValue outputValue)? constrict,
    TResult? Function(OutputValue outputValue)? temperature,
    TResult? Function(OutputValue outputValue)? led,
    TResult? Function(OutputValue outputValue)? position,
    TResult? Function(OutputPositionWithDuration outputValue)?
        positionWithDuration,
    TResult? Function(OutputValue outputValue)? spray,
  }) {
    final _that = this;
    switch (_that) {
      case OutputCommandVibrate() when vibrate != null:
        return vibrate(_that.outputValue);
      case OutputCommandRotate() when rotate != null:
        return rotate(_that.outputValue);
      case OutputCommandOscillate() when oscillate != null:
        return oscillate(_that.outputValue);
      case OutputCommandConstrict() when constrict != null:
        return constrict(_that.outputValue);
      case OutputCommandTemperature() when temperature != null:
        return temperature(_that.outputValue);
      case OutputCommandLed() when led != null:
        return led(_that.outputValue);
      case OutputCommandPosition() when position != null:
        return position(_that.outputValue);
      case OutputCommandPositionWithDuration()
          when positionWithDuration != null:
        return positionWithDuration(_that.outputValue);
      case OutputCommandSpray() when spray != null:
        return spray(_that.outputValue);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class OutputCommandVibrate extends OutputCommand {
  const OutputCommandVibrate({required this.outputValue, final String? $type})
      : $type = $type ?? 'vibrate',
        super._();
  factory OutputCommandVibrate.fromJson(Map<String, dynamic> json) =>
      _$OutputCommandVibrateFromJson(json);

  @override
  final OutputValue outputValue;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OutputCommandVibrateCopyWith<OutputCommandVibrate> get copyWith =>
      _$OutputCommandVibrateCopyWithImpl<OutputCommandVibrate>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OutputCommandVibrateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OutputCommandVibrate &&
            (identical(other.outputValue, outputValue) ||
                other.outputValue == outputValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, outputValue);

  @override
  String toString() {
    return 'OutputCommand.vibrate(outputValue: $outputValue)';
  }
}

/// @nodoc
abstract mixin class $OutputCommandVibrateCopyWith<$Res>
    implements $OutputCommandCopyWith<$Res> {
  factory $OutputCommandVibrateCopyWith(OutputCommandVibrate value,
          $Res Function(OutputCommandVibrate) _then) =
      _$OutputCommandVibrateCopyWithImpl;
  @useResult
  $Res call({OutputValue outputValue});

  $OutputValueCopyWith<$Res> get outputValue;
}

/// @nodoc
class _$OutputCommandVibrateCopyWithImpl<$Res>
    implements $OutputCommandVibrateCopyWith<$Res> {
  _$OutputCommandVibrateCopyWithImpl(this._self, this._then);

  final OutputCommandVibrate _self;
  final $Res Function(OutputCommandVibrate) _then;

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? outputValue = null,
  }) {
    return _then(OutputCommandVibrate(
      outputValue: null == outputValue
          ? _self.outputValue
          : outputValue // ignore: cast_nullable_to_non_nullable
              as OutputValue,
    ));
  }

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutputValueCopyWith<$Res> get outputValue {
    return $OutputValueCopyWith<$Res>(_self.outputValue, (value) {
      return _then(_self.copyWith(outputValue: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class OutputCommandRotate extends OutputCommand {
  const OutputCommandRotate({required this.outputValue, final String? $type})
      : $type = $type ?? 'rotate',
        super._();
  factory OutputCommandRotate.fromJson(Map<String, dynamic> json) =>
      _$OutputCommandRotateFromJson(json);

  @override
  final OutputValue outputValue;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OutputCommandRotateCopyWith<OutputCommandRotate> get copyWith =>
      _$OutputCommandRotateCopyWithImpl<OutputCommandRotate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OutputCommandRotateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OutputCommandRotate &&
            (identical(other.outputValue, outputValue) ||
                other.outputValue == outputValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, outputValue);

  @override
  String toString() {
    return 'OutputCommand.rotate(outputValue: $outputValue)';
  }
}

/// @nodoc
abstract mixin class $OutputCommandRotateCopyWith<$Res>
    implements $OutputCommandCopyWith<$Res> {
  factory $OutputCommandRotateCopyWith(
          OutputCommandRotate value, $Res Function(OutputCommandRotate) _then) =
      _$OutputCommandRotateCopyWithImpl;
  @useResult
  $Res call({OutputValue outputValue});

  $OutputValueCopyWith<$Res> get outputValue;
}

/// @nodoc
class _$OutputCommandRotateCopyWithImpl<$Res>
    implements $OutputCommandRotateCopyWith<$Res> {
  _$OutputCommandRotateCopyWithImpl(this._self, this._then);

  final OutputCommandRotate _self;
  final $Res Function(OutputCommandRotate) _then;

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? outputValue = null,
  }) {
    return _then(OutputCommandRotate(
      outputValue: null == outputValue
          ? _self.outputValue
          : outputValue // ignore: cast_nullable_to_non_nullable
              as OutputValue,
    ));
  }

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutputValueCopyWith<$Res> get outputValue {
    return $OutputValueCopyWith<$Res>(_self.outputValue, (value) {
      return _then(_self.copyWith(outputValue: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class OutputCommandOscillate extends OutputCommand {
  const OutputCommandOscillate({required this.outputValue, final String? $type})
      : $type = $type ?? 'oscillate',
        super._();
  factory OutputCommandOscillate.fromJson(Map<String, dynamic> json) =>
      _$OutputCommandOscillateFromJson(json);

  @override
  final OutputValue outputValue;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OutputCommandOscillateCopyWith<OutputCommandOscillate> get copyWith =>
      _$OutputCommandOscillateCopyWithImpl<OutputCommandOscillate>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OutputCommandOscillateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OutputCommandOscillate &&
            (identical(other.outputValue, outputValue) ||
                other.outputValue == outputValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, outputValue);

  @override
  String toString() {
    return 'OutputCommand.oscillate(outputValue: $outputValue)';
  }
}

/// @nodoc
abstract mixin class $OutputCommandOscillateCopyWith<$Res>
    implements $OutputCommandCopyWith<$Res> {
  factory $OutputCommandOscillateCopyWith(OutputCommandOscillate value,
          $Res Function(OutputCommandOscillate) _then) =
      _$OutputCommandOscillateCopyWithImpl;
  @useResult
  $Res call({OutputValue outputValue});

  $OutputValueCopyWith<$Res> get outputValue;
}

/// @nodoc
class _$OutputCommandOscillateCopyWithImpl<$Res>
    implements $OutputCommandOscillateCopyWith<$Res> {
  _$OutputCommandOscillateCopyWithImpl(this._self, this._then);

  final OutputCommandOscillate _self;
  final $Res Function(OutputCommandOscillate) _then;

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? outputValue = null,
  }) {
    return _then(OutputCommandOscillate(
      outputValue: null == outputValue
          ? _self.outputValue
          : outputValue // ignore: cast_nullable_to_non_nullable
              as OutputValue,
    ));
  }

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutputValueCopyWith<$Res> get outputValue {
    return $OutputValueCopyWith<$Res>(_self.outputValue, (value) {
      return _then(_self.copyWith(outputValue: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class OutputCommandConstrict extends OutputCommand {
  const OutputCommandConstrict({required this.outputValue, final String? $type})
      : $type = $type ?? 'constrict',
        super._();
  factory OutputCommandConstrict.fromJson(Map<String, dynamic> json) =>
      _$OutputCommandConstrictFromJson(json);

  @override
  final OutputValue outputValue;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OutputCommandConstrictCopyWith<OutputCommandConstrict> get copyWith =>
      _$OutputCommandConstrictCopyWithImpl<OutputCommandConstrict>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OutputCommandConstrictToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OutputCommandConstrict &&
            (identical(other.outputValue, outputValue) ||
                other.outputValue == outputValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, outputValue);

  @override
  String toString() {
    return 'OutputCommand.constrict(outputValue: $outputValue)';
  }
}

/// @nodoc
abstract mixin class $OutputCommandConstrictCopyWith<$Res>
    implements $OutputCommandCopyWith<$Res> {
  factory $OutputCommandConstrictCopyWith(OutputCommandConstrict value,
          $Res Function(OutputCommandConstrict) _then) =
      _$OutputCommandConstrictCopyWithImpl;
  @useResult
  $Res call({OutputValue outputValue});

  $OutputValueCopyWith<$Res> get outputValue;
}

/// @nodoc
class _$OutputCommandConstrictCopyWithImpl<$Res>
    implements $OutputCommandConstrictCopyWith<$Res> {
  _$OutputCommandConstrictCopyWithImpl(this._self, this._then);

  final OutputCommandConstrict _self;
  final $Res Function(OutputCommandConstrict) _then;

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? outputValue = null,
  }) {
    return _then(OutputCommandConstrict(
      outputValue: null == outputValue
          ? _self.outputValue
          : outputValue // ignore: cast_nullable_to_non_nullable
              as OutputValue,
    ));
  }

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutputValueCopyWith<$Res> get outputValue {
    return $OutputValueCopyWith<$Res>(_self.outputValue, (value) {
      return _then(_self.copyWith(outputValue: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class OutputCommandTemperature extends OutputCommand {
  const OutputCommandTemperature(
      {required this.outputValue, final String? $type})
      : $type = $type ?? 'temperature',
        super._();
  factory OutputCommandTemperature.fromJson(Map<String, dynamic> json) =>
      _$OutputCommandTemperatureFromJson(json);

  @override
  final OutputValue outputValue;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OutputCommandTemperatureCopyWith<OutputCommandTemperature> get copyWith =>
      _$OutputCommandTemperatureCopyWithImpl<OutputCommandTemperature>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OutputCommandTemperatureToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OutputCommandTemperature &&
            (identical(other.outputValue, outputValue) ||
                other.outputValue == outputValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, outputValue);

  @override
  String toString() {
    return 'OutputCommand.temperature(outputValue: $outputValue)';
  }
}

/// @nodoc
abstract mixin class $OutputCommandTemperatureCopyWith<$Res>
    implements $OutputCommandCopyWith<$Res> {
  factory $OutputCommandTemperatureCopyWith(OutputCommandTemperature value,
          $Res Function(OutputCommandTemperature) _then) =
      _$OutputCommandTemperatureCopyWithImpl;
  @useResult
  $Res call({OutputValue outputValue});

  $OutputValueCopyWith<$Res> get outputValue;
}

/// @nodoc
class _$OutputCommandTemperatureCopyWithImpl<$Res>
    implements $OutputCommandTemperatureCopyWith<$Res> {
  _$OutputCommandTemperatureCopyWithImpl(this._self, this._then);

  final OutputCommandTemperature _self;
  final $Res Function(OutputCommandTemperature) _then;

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? outputValue = null,
  }) {
    return _then(OutputCommandTemperature(
      outputValue: null == outputValue
          ? _self.outputValue
          : outputValue // ignore: cast_nullable_to_non_nullable
              as OutputValue,
    ));
  }

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutputValueCopyWith<$Res> get outputValue {
    return $OutputValueCopyWith<$Res>(_self.outputValue, (value) {
      return _then(_self.copyWith(outputValue: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class OutputCommandLed extends OutputCommand {
  const OutputCommandLed({required this.outputValue, final String? $type})
      : $type = $type ?? 'led',
        super._();
  factory OutputCommandLed.fromJson(Map<String, dynamic> json) =>
      _$OutputCommandLedFromJson(json);

  @override
  final OutputValue outputValue;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OutputCommandLedCopyWith<OutputCommandLed> get copyWith =>
      _$OutputCommandLedCopyWithImpl<OutputCommandLed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OutputCommandLedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OutputCommandLed &&
            (identical(other.outputValue, outputValue) ||
                other.outputValue == outputValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, outputValue);

  @override
  String toString() {
    return 'OutputCommand.led(outputValue: $outputValue)';
  }
}

/// @nodoc
abstract mixin class $OutputCommandLedCopyWith<$Res>
    implements $OutputCommandCopyWith<$Res> {
  factory $OutputCommandLedCopyWith(
          OutputCommandLed value, $Res Function(OutputCommandLed) _then) =
      _$OutputCommandLedCopyWithImpl;
  @useResult
  $Res call({OutputValue outputValue});

  $OutputValueCopyWith<$Res> get outputValue;
}

/// @nodoc
class _$OutputCommandLedCopyWithImpl<$Res>
    implements $OutputCommandLedCopyWith<$Res> {
  _$OutputCommandLedCopyWithImpl(this._self, this._then);

  final OutputCommandLed _self;
  final $Res Function(OutputCommandLed) _then;

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? outputValue = null,
  }) {
    return _then(OutputCommandLed(
      outputValue: null == outputValue
          ? _self.outputValue
          : outputValue // ignore: cast_nullable_to_non_nullable
              as OutputValue,
    ));
  }

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutputValueCopyWith<$Res> get outputValue {
    return $OutputValueCopyWith<$Res>(_self.outputValue, (value) {
      return _then(_self.copyWith(outputValue: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class OutputCommandPosition extends OutputCommand {
  const OutputCommandPosition({required this.outputValue, final String? $type})
      : $type = $type ?? 'position',
        super._();
  factory OutputCommandPosition.fromJson(Map<String, dynamic> json) =>
      _$OutputCommandPositionFromJson(json);

  @override
  final OutputValue outputValue;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OutputCommandPositionCopyWith<OutputCommandPosition> get copyWith =>
      _$OutputCommandPositionCopyWithImpl<OutputCommandPosition>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OutputCommandPositionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OutputCommandPosition &&
            (identical(other.outputValue, outputValue) ||
                other.outputValue == outputValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, outputValue);

  @override
  String toString() {
    return 'OutputCommand.position(outputValue: $outputValue)';
  }
}

/// @nodoc
abstract mixin class $OutputCommandPositionCopyWith<$Res>
    implements $OutputCommandCopyWith<$Res> {
  factory $OutputCommandPositionCopyWith(OutputCommandPosition value,
          $Res Function(OutputCommandPosition) _then) =
      _$OutputCommandPositionCopyWithImpl;
  @useResult
  $Res call({OutputValue outputValue});

  $OutputValueCopyWith<$Res> get outputValue;
}

/// @nodoc
class _$OutputCommandPositionCopyWithImpl<$Res>
    implements $OutputCommandPositionCopyWith<$Res> {
  _$OutputCommandPositionCopyWithImpl(this._self, this._then);

  final OutputCommandPosition _self;
  final $Res Function(OutputCommandPosition) _then;

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? outputValue = null,
  }) {
    return _then(OutputCommandPosition(
      outputValue: null == outputValue
          ? _self.outputValue
          : outputValue // ignore: cast_nullable_to_non_nullable
              as OutputValue,
    ));
  }

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutputValueCopyWith<$Res> get outputValue {
    return $OutputValueCopyWith<$Res>(_self.outputValue, (value) {
      return _then(_self.copyWith(outputValue: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class OutputCommandPositionWithDuration extends OutputCommand {
  const OutputCommandPositionWithDuration(
      {required this.outputValue, final String? $type})
      : $type = $type ?? 'positionWithDuration',
        super._();
  factory OutputCommandPositionWithDuration.fromJson(
          Map<String, dynamic> json) =>
      _$OutputCommandPositionWithDurationFromJson(json);

  @override
  final OutputPositionWithDuration outputValue;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OutputCommandPositionWithDurationCopyWith<OutputCommandPositionWithDuration>
      get copyWith => _$OutputCommandPositionWithDurationCopyWithImpl<
          OutputCommandPositionWithDuration>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OutputCommandPositionWithDurationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OutputCommandPositionWithDuration &&
            (identical(other.outputValue, outputValue) ||
                other.outputValue == outputValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, outputValue);

  @override
  String toString() {
    return 'OutputCommand.positionWithDuration(outputValue: $outputValue)';
  }
}

/// @nodoc
abstract mixin class $OutputCommandPositionWithDurationCopyWith<$Res>
    implements $OutputCommandCopyWith<$Res> {
  factory $OutputCommandPositionWithDurationCopyWith(
          OutputCommandPositionWithDuration value,
          $Res Function(OutputCommandPositionWithDuration) _then) =
      _$OutputCommandPositionWithDurationCopyWithImpl;
  @useResult
  $Res call({OutputPositionWithDuration outputValue});

  $OutputPositionWithDurationCopyWith<$Res> get outputValue;
}

/// @nodoc
class _$OutputCommandPositionWithDurationCopyWithImpl<$Res>
    implements $OutputCommandPositionWithDurationCopyWith<$Res> {
  _$OutputCommandPositionWithDurationCopyWithImpl(this._self, this._then);

  final OutputCommandPositionWithDuration _self;
  final $Res Function(OutputCommandPositionWithDuration) _then;

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? outputValue = null,
  }) {
    return _then(OutputCommandPositionWithDuration(
      outputValue: null == outputValue
          ? _self.outputValue
          : outputValue // ignore: cast_nullable_to_non_nullable
              as OutputPositionWithDuration,
    ));
  }

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutputPositionWithDurationCopyWith<$Res> get outputValue {
    return $OutputPositionWithDurationCopyWith<$Res>(_self.outputValue,
        (value) {
      return _then(_self.copyWith(outputValue: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class OutputCommandSpray extends OutputCommand {
  const OutputCommandSpray({required this.outputValue, final String? $type})
      : $type = $type ?? 'spray',
        super._();
  factory OutputCommandSpray.fromJson(Map<String, dynamic> json) =>
      _$OutputCommandSprayFromJson(json);

  @override
  final OutputValue outputValue;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OutputCommandSprayCopyWith<OutputCommandSpray> get copyWith =>
      _$OutputCommandSprayCopyWithImpl<OutputCommandSpray>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OutputCommandSprayToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OutputCommandSpray &&
            (identical(other.outputValue, outputValue) ||
                other.outputValue == outputValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, outputValue);

  @override
  String toString() {
    return 'OutputCommand.spray(outputValue: $outputValue)';
  }
}

/// @nodoc
abstract mixin class $OutputCommandSprayCopyWith<$Res>
    implements $OutputCommandCopyWith<$Res> {
  factory $OutputCommandSprayCopyWith(
          OutputCommandSpray value, $Res Function(OutputCommandSpray) _then) =
      _$OutputCommandSprayCopyWithImpl;
  @useResult
  $Res call({OutputValue outputValue});

  $OutputValueCopyWith<$Res> get outputValue;
}

/// @nodoc
class _$OutputCommandSprayCopyWithImpl<$Res>
    implements $OutputCommandSprayCopyWith<$Res> {
  _$OutputCommandSprayCopyWithImpl(this._self, this._then);

  final OutputCommandSpray _self;
  final $Res Function(OutputCommandSpray) _then;

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? outputValue = null,
  }) {
    return _then(OutputCommandSpray(
      outputValue: null == outputValue
          ? _self.outputValue
          : outputValue // ignore: cast_nullable_to_non_nullable
              as OutputValue,
    ));
  }

  /// Create a copy of OutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutputValueCopyWith<$Res> get outputValue {
    return $OutputValueCopyWith<$Res>(_self.outputValue, (value) {
      return _then(_self.copyWith(outputValue: value));
    });
  }
}

OutputCmd _$OutputCmdFromJson(Map<String, dynamic> json) {
  return OutputCmdV4.fromJson(json);
}

/// @nodoc
mixin _$OutputCmd {
  int get featureIndex;
  OutputCommand get command;

  /// Create a copy of OutputCmd
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OutputCmdCopyWith<OutputCmd> get copyWith =>
      _$OutputCmdCopyWithImpl<OutputCmd>(this as OutputCmd, _$identity);

  /// Serializes this OutputCmd to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OutputCmd &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.command, command) || other.command == command));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, featureIndex, command);

  @override
  String toString() {
    return 'OutputCmd(featureIndex: $featureIndex, command: $command)';
  }
}

/// @nodoc
abstract mixin class $OutputCmdCopyWith<$Res> {
  factory $OutputCmdCopyWith(OutputCmd value, $Res Function(OutputCmd) _then) =
      _$OutputCmdCopyWithImpl;
  @useResult
  $Res call({int featureIndex, OutputCommand command});

  $OutputCommandCopyWith<$Res> get command;
}

/// @nodoc
class _$OutputCmdCopyWithImpl<$Res> implements $OutputCmdCopyWith<$Res> {
  _$OutputCmdCopyWithImpl(this._self, this._then);

  final OutputCmd _self;
  final $Res Function(OutputCmd) _then;

  /// Create a copy of OutputCmd
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featureIndex = null,
    Object? command = null,
  }) {
    return _then(_self.copyWith(
      featureIndex: null == featureIndex
          ? _self.featureIndex
          : featureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      command: null == command
          ? _self.command
          : command // ignore: cast_nullable_to_non_nullable
              as OutputCommand,
    ));
  }

  /// Create a copy of OutputCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutputCommandCopyWith<$Res> get command {
    return $OutputCommandCopyWith<$Res>(_self.command, (value) {
      return _then(_self.copyWith(command: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OutputCmd].
extension OutputCmdPatterns on OutputCmd {
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
    TResult Function(OutputCmdV4 value)? v4,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case OutputCmdV4() when v4 != null:
        return v4(_that);
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
    required TResult Function(OutputCmdV4 value) v4,
  }) {
    final _that = this;
    switch (_that) {
      case OutputCmdV4():
        return v4(_that);
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
    TResult? Function(OutputCmdV4 value)? v4,
  }) {
    final _that = this;
    switch (_that) {
      case OutputCmdV4() when v4 != null:
        return v4(_that);
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
    TResult Function(int featureIndex, OutputCommand command)? v4,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case OutputCmdV4() when v4 != null:
        return v4(_that.featureIndex, _that.command);
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
    required TResult Function(int featureIndex, OutputCommand command) v4,
  }) {
    final _that = this;
    switch (_that) {
      case OutputCmdV4():
        return v4(_that.featureIndex, _that.command);
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
    TResult? Function(int featureIndex, OutputCommand command)? v4,
  }) {
    final _that = this;
    switch (_that) {
      case OutputCmdV4() when v4 != null:
        return v4(_that.featureIndex, _that.command);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class OutputCmdV4 extends OutputCmd {
  const OutputCmdV4({required this.featureIndex, required this.command})
      : super._();
  factory OutputCmdV4.fromJson(Map<String, dynamic> json) =>
      _$OutputCmdV4FromJson(json);

  @override
  final int featureIndex;
  @override
  final OutputCommand command;

  /// Create a copy of OutputCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OutputCmdV4CopyWith<OutputCmdV4> get copyWith =>
      _$OutputCmdV4CopyWithImpl<OutputCmdV4>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OutputCmdV4ToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OutputCmdV4 &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.command, command) || other.command == command));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, featureIndex, command);

  @override
  String toString() {
    return 'OutputCmd.v4(featureIndex: $featureIndex, command: $command)';
  }
}

/// @nodoc
abstract mixin class $OutputCmdV4CopyWith<$Res>
    implements $OutputCmdCopyWith<$Res> {
  factory $OutputCmdV4CopyWith(
          OutputCmdV4 value, $Res Function(OutputCmdV4) _then) =
      _$OutputCmdV4CopyWithImpl;
  @override
  @useResult
  $Res call({int featureIndex, OutputCommand command});

  @override
  $OutputCommandCopyWith<$Res> get command;
}

/// @nodoc
class _$OutputCmdV4CopyWithImpl<$Res> implements $OutputCmdV4CopyWith<$Res> {
  _$OutputCmdV4CopyWithImpl(this._self, this._then);

  final OutputCmdV4 _self;
  final $Res Function(OutputCmdV4) _then;

  /// Create a copy of OutputCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? featureIndex = null,
    Object? command = null,
  }) {
    return _then(OutputCmdV4(
      featureIndex: null == featureIndex
          ? _self.featureIndex
          : featureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      command: null == command
          ? _self.command
          : command // ignore: cast_nullable_to_non_nullable
              as OutputCommand,
    ));
  }

  /// Create a copy of OutputCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutputCommandCopyWith<$Res> get command {
    return $OutputCommandCopyWith<$Res>(_self.command, (value) {
      return _then(_self.copyWith(command: value));
    });
  }
}

// dart format on
