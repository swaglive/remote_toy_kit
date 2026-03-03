// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_feature_input_properties.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceFeatureInputProperties {
  @RangeInclusiveJsonConverter()
  List<RangeInclusive> get value;
  Set<InputCommandType> get command;

  /// Create a copy of DeviceFeatureInputProperties
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceFeatureInputPropertiesCopyWith<DeviceFeatureInputProperties>
      get copyWith => _$DeviceFeatureInputPropertiesCopyWithImpl<
              DeviceFeatureInputProperties>(
          this as DeviceFeatureInputProperties, _$identity);

  /// Serializes this DeviceFeatureInputProperties to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceFeatureInputProperties &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.command, command));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(command));

  @override
  String toString() {
    return 'DeviceFeatureInputProperties(value: $value, command: $command)';
  }
}

/// @nodoc
abstract mixin class $DeviceFeatureInputPropertiesCopyWith<$Res> {
  factory $DeviceFeatureInputPropertiesCopyWith(
          DeviceFeatureInputProperties value,
          $Res Function(DeviceFeatureInputProperties) _then) =
      _$DeviceFeatureInputPropertiesCopyWithImpl;
  @useResult
  $Res call(
      {@RangeInclusiveJsonConverter() List<RangeInclusive> value,
      Set<InputCommandType> command});
}

/// @nodoc
class _$DeviceFeatureInputPropertiesCopyWithImpl<$Res>
    implements $DeviceFeatureInputPropertiesCopyWith<$Res> {
  _$DeviceFeatureInputPropertiesCopyWithImpl(this._self, this._then);

  final DeviceFeatureInputProperties _self;
  final $Res Function(DeviceFeatureInputProperties) _then;

  /// Create a copy of DeviceFeatureInputProperties
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? command = null,
  }) {
    return _then(_self.copyWith(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<RangeInclusive>,
      command: null == command
          ? _self.command
          : command // ignore: cast_nullable_to_non_nullable
              as Set<InputCommandType>,
    ));
  }
}

/// Adds pattern-matching-related methods to [DeviceFeatureInputProperties].
extension DeviceFeatureInputPropertiesPatterns on DeviceFeatureInputProperties {
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
    TResult Function(_DeviceFeatureInputProperties value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureInputProperties() when $default != null:
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
    TResult Function(_DeviceFeatureInputProperties value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureInputProperties():
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
    TResult? Function(_DeviceFeatureInputProperties value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureInputProperties() when $default != null:
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
    TResult Function(@RangeInclusiveJsonConverter() List<RangeInclusive> value,
            Set<InputCommandType> command)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureInputProperties() when $default != null:
        return $default(_that.value, _that.command);
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
    TResult Function(@RangeInclusiveJsonConverter() List<RangeInclusive> value,
            Set<InputCommandType> command)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureInputProperties():
        return $default(_that.value, _that.command);
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
    TResult? Function(@RangeInclusiveJsonConverter() List<RangeInclusive> value,
            Set<InputCommandType> command)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureInputProperties() when $default != null:
        return $default(_that.value, _that.command);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeviceFeatureInputProperties implements DeviceFeatureInputProperties {
  const _DeviceFeatureInputProperties(
      {@RangeInclusiveJsonConverter() required final List<RangeInclusive> value,
      required final Set<InputCommandType> command})
      : _value = value,
        _command = command;
  factory _DeviceFeatureInputProperties.fromJson(Map<String, dynamic> json) =>
      _$DeviceFeatureInputPropertiesFromJson(json);

  final List<RangeInclusive> _value;
  @override
  @RangeInclusiveJsonConverter()
  List<RangeInclusive> get value {
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_value);
  }

  final Set<InputCommandType> _command;
  @override
  Set<InputCommandType> get command {
    if (_command is EqualUnmodifiableSetView) return _command;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_command);
  }

  /// Create a copy of DeviceFeatureInputProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeviceFeatureInputPropertiesCopyWith<_DeviceFeatureInputProperties>
      get copyWith => __$DeviceFeatureInputPropertiesCopyWithImpl<
          _DeviceFeatureInputProperties>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeviceFeatureInputPropertiesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceFeatureInputProperties &&
            const DeepCollectionEquality().equals(other._value, _value) &&
            const DeepCollectionEquality().equals(other._command, _command));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_value),
      const DeepCollectionEquality().hash(_command));

  @override
  String toString() {
    return 'DeviceFeatureInputProperties(value: $value, command: $command)';
  }
}

/// @nodoc
abstract mixin class _$DeviceFeatureInputPropertiesCopyWith<$Res>
    implements $DeviceFeatureInputPropertiesCopyWith<$Res> {
  factory _$DeviceFeatureInputPropertiesCopyWith(
          _DeviceFeatureInputProperties value,
          $Res Function(_DeviceFeatureInputProperties) _then) =
      __$DeviceFeatureInputPropertiesCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@RangeInclusiveJsonConverter() List<RangeInclusive> value,
      Set<InputCommandType> command});
}

/// @nodoc
class __$DeviceFeatureInputPropertiesCopyWithImpl<$Res>
    implements _$DeviceFeatureInputPropertiesCopyWith<$Res> {
  __$DeviceFeatureInputPropertiesCopyWithImpl(this._self, this._then);

  final _DeviceFeatureInputProperties _self;
  final $Res Function(_DeviceFeatureInputProperties) _then;

  /// Create a copy of DeviceFeatureInputProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
    Object? command = null,
  }) {
    return _then(_DeviceFeatureInputProperties(
      value: null == value
          ? _self._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<RangeInclusive>,
      command: null == command
          ? _self._command
          : command // ignore: cast_nullable_to_non_nullable
              as Set<InputCommandType>,
    ));
  }
}

// dart format on
