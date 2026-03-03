// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_feature_sensor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceFeatureSensor {
  @JsonKey(name: 'value-range')
  @RangeInclusiveJsonConverter()
  List<RangeInclusive> get valueRange;
  Set<SensorFeatureMessageType> get messages;

  /// Create a copy of DeviceFeatureSensor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceFeatureSensorCopyWith<DeviceFeatureSensor> get copyWith =>
      _$DeviceFeatureSensorCopyWithImpl<DeviceFeatureSensor>(
          this as DeviceFeatureSensor, _$identity);

  /// Serializes this DeviceFeatureSensor to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceFeatureSensor &&
            const DeepCollectionEquality()
                .equals(other.valueRange, valueRange) &&
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(valueRange),
      const DeepCollectionEquality().hash(messages));

  @override
  String toString() {
    return 'DeviceFeatureSensor(valueRange: $valueRange, messages: $messages)';
  }
}

/// @nodoc
abstract mixin class $DeviceFeatureSensorCopyWith<$Res> {
  factory $DeviceFeatureSensorCopyWith(
          DeviceFeatureSensor value, $Res Function(DeviceFeatureSensor) _then) =
      _$DeviceFeatureSensorCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'value-range')
      @RangeInclusiveJsonConverter()
      List<RangeInclusive> valueRange,
      Set<SensorFeatureMessageType> messages});
}

/// @nodoc
class _$DeviceFeatureSensorCopyWithImpl<$Res>
    implements $DeviceFeatureSensorCopyWith<$Res> {
  _$DeviceFeatureSensorCopyWithImpl(this._self, this._then);

  final DeviceFeatureSensor _self;
  final $Res Function(DeviceFeatureSensor) _then;

  /// Create a copy of DeviceFeatureSensor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valueRange = null,
    Object? messages = null,
  }) {
    return _then(_self.copyWith(
      valueRange: null == valueRange
          ? _self.valueRange
          : valueRange // ignore: cast_nullable_to_non_nullable
              as List<RangeInclusive>,
      messages: null == messages
          ? _self.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Set<SensorFeatureMessageType>,
    ));
  }
}

/// Adds pattern-matching-related methods to [DeviceFeatureSensor].
extension DeviceFeatureSensorPatterns on DeviceFeatureSensor {
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
    TResult Function(_DeviceFeatureSensor value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureSensor() when $default != null:
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
    TResult Function(_DeviceFeatureSensor value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureSensor():
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
    TResult? Function(_DeviceFeatureSensor value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureSensor() when $default != null:
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
            @JsonKey(name: 'value-range')
            @RangeInclusiveJsonConverter()
            List<RangeInclusive> valueRange,
            Set<SensorFeatureMessageType> messages)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureSensor() when $default != null:
        return $default(_that.valueRange, _that.messages);
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
            @JsonKey(name: 'value-range')
            @RangeInclusiveJsonConverter()
            List<RangeInclusive> valueRange,
            Set<SensorFeatureMessageType> messages)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureSensor():
        return $default(_that.valueRange, _that.messages);
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
            @JsonKey(name: 'value-range')
            @RangeInclusiveJsonConverter()
            List<RangeInclusive> valueRange,
            Set<SensorFeatureMessageType> messages)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureSensor() when $default != null:
        return $default(_that.valueRange, _that.messages);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeviceFeatureSensor implements DeviceFeatureSensor {
  const _DeviceFeatureSensor(
      {@JsonKey(name: 'value-range')
      @RangeInclusiveJsonConverter()
      required final List<RangeInclusive> valueRange,
      required final Set<SensorFeatureMessageType> messages})
      : _valueRange = valueRange,
        _messages = messages;
  factory _DeviceFeatureSensor.fromJson(Map<String, dynamic> json) =>
      _$DeviceFeatureSensorFromJson(json);

  final List<RangeInclusive> _valueRange;
  @override
  @JsonKey(name: 'value-range')
  @RangeInclusiveJsonConverter()
  List<RangeInclusive> get valueRange {
    if (_valueRange is EqualUnmodifiableListView) return _valueRange;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_valueRange);
  }

  final Set<SensorFeatureMessageType> _messages;
  @override
  Set<SensorFeatureMessageType> get messages {
    if (_messages is EqualUnmodifiableSetView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_messages);
  }

  /// Create a copy of DeviceFeatureSensor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeviceFeatureSensorCopyWith<_DeviceFeatureSensor> get copyWith =>
      __$DeviceFeatureSensorCopyWithImpl<_DeviceFeatureSensor>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeviceFeatureSensorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceFeatureSensor &&
            const DeepCollectionEquality()
                .equals(other._valueRange, _valueRange) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_valueRange),
      const DeepCollectionEquality().hash(_messages));

  @override
  String toString() {
    return 'DeviceFeatureSensor(valueRange: $valueRange, messages: $messages)';
  }
}

/// @nodoc
abstract mixin class _$DeviceFeatureSensorCopyWith<$Res>
    implements $DeviceFeatureSensorCopyWith<$Res> {
  factory _$DeviceFeatureSensorCopyWith(_DeviceFeatureSensor value,
          $Res Function(_DeviceFeatureSensor) _then) =
      __$DeviceFeatureSensorCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'value-range')
      @RangeInclusiveJsonConverter()
      List<RangeInclusive> valueRange,
      Set<SensorFeatureMessageType> messages});
}

/// @nodoc
class __$DeviceFeatureSensorCopyWithImpl<$Res>
    implements _$DeviceFeatureSensorCopyWith<$Res> {
  __$DeviceFeatureSensorCopyWithImpl(this._self, this._then);

  final _DeviceFeatureSensor _self;
  final $Res Function(_DeviceFeatureSensor) _then;

  /// Create a copy of DeviceFeatureSensor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? valueRange = null,
    Object? messages = null,
  }) {
    return _then(_DeviceFeatureSensor(
      valueRange: null == valueRange
          ? _self._valueRange
          : valueRange // ignore: cast_nullable_to_non_nullable
              as List<RangeInclusive>,
      messages: null == messages
          ? _self._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Set<SensorFeatureMessageType>,
    ));
  }
}

// dart format on
