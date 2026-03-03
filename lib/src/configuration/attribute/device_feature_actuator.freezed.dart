// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_feature_actuator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceFeatureActuator {
  @JsonKey(name: 'step-range')
  @RangeInclusiveJsonConverter()
  RangeInclusive get stepRange;
  Set<ActuatorFeatureMessageType> get messages;

  /// Create a copy of DeviceFeatureActuator
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceFeatureActuatorCopyWith<DeviceFeatureActuator> get copyWith =>
      _$DeviceFeatureActuatorCopyWithImpl<DeviceFeatureActuator>(
          this as DeviceFeatureActuator, _$identity);

  /// Serializes this DeviceFeatureActuator to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceFeatureActuator &&
            (identical(other.stepRange, stepRange) ||
                other.stepRange == stepRange) &&
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, stepRange, const DeepCollectionEquality().hash(messages));

  @override
  String toString() {
    return 'DeviceFeatureActuator(stepRange: $stepRange, messages: $messages)';
  }
}

/// @nodoc
abstract mixin class $DeviceFeatureActuatorCopyWith<$Res> {
  factory $DeviceFeatureActuatorCopyWith(DeviceFeatureActuator value,
          $Res Function(DeviceFeatureActuator) _then) =
      _$DeviceFeatureActuatorCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'step-range')
      @RangeInclusiveJsonConverter()
      RangeInclusive stepRange,
      Set<ActuatorFeatureMessageType> messages});

  $RangeInclusiveCopyWith<$Res> get stepRange;
}

/// @nodoc
class _$DeviceFeatureActuatorCopyWithImpl<$Res>
    implements $DeviceFeatureActuatorCopyWith<$Res> {
  _$DeviceFeatureActuatorCopyWithImpl(this._self, this._then);

  final DeviceFeatureActuator _self;
  final $Res Function(DeviceFeatureActuator) _then;

  /// Create a copy of DeviceFeatureActuator
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepRange = null,
    Object? messages = null,
  }) {
    return _then(_self.copyWith(
      stepRange: null == stepRange
          ? _self.stepRange
          : stepRange // ignore: cast_nullable_to_non_nullable
              as RangeInclusive,
      messages: null == messages
          ? _self.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Set<ActuatorFeatureMessageType>,
    ));
  }

  /// Create a copy of DeviceFeatureActuator
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RangeInclusiveCopyWith<$Res> get stepRange {
    return $RangeInclusiveCopyWith<$Res>(_self.stepRange, (value) {
      return _then(_self.copyWith(stepRange: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DeviceFeatureActuator].
extension DeviceFeatureActuatorPatterns on DeviceFeatureActuator {
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
    TResult Function(_DeviceFeatureActuator value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureActuator() when $default != null:
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
    TResult Function(_DeviceFeatureActuator value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureActuator():
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
    TResult? Function(_DeviceFeatureActuator value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureActuator() when $default != null:
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
            @JsonKey(name: 'step-range')
            @RangeInclusiveJsonConverter()
            RangeInclusive stepRange,
            Set<ActuatorFeatureMessageType> messages)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureActuator() when $default != null:
        return $default(_that.stepRange, _that.messages);
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
            @JsonKey(name: 'step-range')
            @RangeInclusiveJsonConverter()
            RangeInclusive stepRange,
            Set<ActuatorFeatureMessageType> messages)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureActuator():
        return $default(_that.stepRange, _that.messages);
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
            @JsonKey(name: 'step-range')
            @RangeInclusiveJsonConverter()
            RangeInclusive stepRange,
            Set<ActuatorFeatureMessageType> messages)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureActuator() when $default != null:
        return $default(_that.stepRange, _that.messages);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeviceFeatureActuator implements DeviceFeatureActuator {
  const _DeviceFeatureActuator(
      {@JsonKey(name: 'step-range')
      @RangeInclusiveJsonConverter()
      required this.stepRange,
      required final Set<ActuatorFeatureMessageType> messages})
      : _messages = messages;
  factory _DeviceFeatureActuator.fromJson(Map<String, dynamic> json) =>
      _$DeviceFeatureActuatorFromJson(json);

  @override
  @JsonKey(name: 'step-range')
  @RangeInclusiveJsonConverter()
  final RangeInclusive stepRange;
  final Set<ActuatorFeatureMessageType> _messages;
  @override
  Set<ActuatorFeatureMessageType> get messages {
    if (_messages is EqualUnmodifiableSetView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_messages);
  }

  /// Create a copy of DeviceFeatureActuator
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeviceFeatureActuatorCopyWith<_DeviceFeatureActuator> get copyWith =>
      __$DeviceFeatureActuatorCopyWithImpl<_DeviceFeatureActuator>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeviceFeatureActuatorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceFeatureActuator &&
            (identical(other.stepRange, stepRange) ||
                other.stepRange == stepRange) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, stepRange, const DeepCollectionEquality().hash(_messages));

  @override
  String toString() {
    return 'DeviceFeatureActuator(stepRange: $stepRange, messages: $messages)';
  }
}

/// @nodoc
abstract mixin class _$DeviceFeatureActuatorCopyWith<$Res>
    implements $DeviceFeatureActuatorCopyWith<$Res> {
  factory _$DeviceFeatureActuatorCopyWith(_DeviceFeatureActuator value,
          $Res Function(_DeviceFeatureActuator) _then) =
      __$DeviceFeatureActuatorCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'step-range')
      @RangeInclusiveJsonConverter()
      RangeInclusive stepRange,
      Set<ActuatorFeatureMessageType> messages});

  @override
  $RangeInclusiveCopyWith<$Res> get stepRange;
}

/// @nodoc
class __$DeviceFeatureActuatorCopyWithImpl<$Res>
    implements _$DeviceFeatureActuatorCopyWith<$Res> {
  __$DeviceFeatureActuatorCopyWithImpl(this._self, this._then);

  final _DeviceFeatureActuator _self;
  final $Res Function(_DeviceFeatureActuator) _then;

  /// Create a copy of DeviceFeatureActuator
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? stepRange = null,
    Object? messages = null,
  }) {
    return _then(_DeviceFeatureActuator(
      stepRange: null == stepRange
          ? _self.stepRange
          : stepRange // ignore: cast_nullable_to_non_nullable
              as RangeInclusive,
      messages: null == messages
          ? _self._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Set<ActuatorFeatureMessageType>,
    ));
  }

  /// Create a copy of DeviceFeatureActuator
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RangeInclusiveCopyWith<$Res> get stepRange {
    return $RangeInclusiveCopyWith<$Res>(_self.stepRange, (value) {
      return _then(_self.copyWith(stepRange: value));
    });
  }
}

// dart format on
