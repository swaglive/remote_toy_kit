// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_feature_output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceFeatureOutput {
  DeviceFeatureOutputValueProperties? get vibrate;
  DeviceFeatureOutputValueProperties? get rotate;
  DeviceFeatureOutputValueProperties? get oscillate;
  DeviceFeatureOutputValueProperties? get constrict;
  DeviceFeatureOutputValueProperties? get temperature;
  DeviceFeatureOutputValueProperties? get led;
  DeviceFeatureOutputPositionProperties? get position;
  DeviceFeatureOutputPositionWithDurationProperties? get positionWithDuration;
  DeviceFeatureOutputValueProperties? get spray;

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputCopyWith<DeviceFeatureOutput> get copyWith =>
      _$DeviceFeatureOutputCopyWithImpl<DeviceFeatureOutput>(
          this as DeviceFeatureOutput, _$identity);

  /// Serializes this DeviceFeatureOutput to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceFeatureOutput &&
            (identical(other.vibrate, vibrate) || other.vibrate == vibrate) &&
            (identical(other.rotate, rotate) || other.rotate == rotate) &&
            (identical(other.oscillate, oscillate) ||
                other.oscillate == oscillate) &&
            (identical(other.constrict, constrict) ||
                other.constrict == constrict) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.led, led) || other.led == led) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.positionWithDuration, positionWithDuration) ||
                other.positionWithDuration == positionWithDuration) &&
            (identical(other.spray, spray) || other.spray == spray));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, vibrate, rotate, oscillate,
      constrict, temperature, led, position, positionWithDuration, spray);

  @override
  String toString() {
    return 'DeviceFeatureOutput(vibrate: $vibrate, rotate: $rotate, oscillate: $oscillate, constrict: $constrict, temperature: $temperature, led: $led, position: $position, positionWithDuration: $positionWithDuration, spray: $spray)';
  }
}

/// @nodoc
abstract mixin class $DeviceFeatureOutputCopyWith<$Res> {
  factory $DeviceFeatureOutputCopyWith(
          DeviceFeatureOutput value, $Res Function(DeviceFeatureOutput) _then) =
      _$DeviceFeatureOutputCopyWithImpl;
  @useResult
  $Res call(
      {DeviceFeatureOutputValueProperties? vibrate,
      DeviceFeatureOutputValueProperties? rotate,
      DeviceFeatureOutputValueProperties? oscillate,
      DeviceFeatureOutputValueProperties? constrict,
      DeviceFeatureOutputValueProperties? temperature,
      DeviceFeatureOutputValueProperties? led,
      DeviceFeatureOutputPositionProperties? position,
      DeviceFeatureOutputPositionWithDurationProperties? positionWithDuration,
      DeviceFeatureOutputValueProperties? spray});

  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get vibrate;
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get rotate;
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get oscillate;
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get constrict;
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get temperature;
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get led;
  $DeviceFeatureOutputPositionPropertiesCopyWith<$Res>? get position;
  $DeviceFeatureOutputPositionWithDurationPropertiesCopyWith<$Res>?
      get positionWithDuration;
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get spray;
}

/// @nodoc
class _$DeviceFeatureOutputCopyWithImpl<$Res>
    implements $DeviceFeatureOutputCopyWith<$Res> {
  _$DeviceFeatureOutputCopyWithImpl(this._self, this._then);

  final DeviceFeatureOutput _self;
  final $Res Function(DeviceFeatureOutput) _then;

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vibrate = freezed,
    Object? rotate = freezed,
    Object? oscillate = freezed,
    Object? constrict = freezed,
    Object? temperature = freezed,
    Object? led = freezed,
    Object? position = freezed,
    Object? positionWithDuration = freezed,
    Object? spray = freezed,
  }) {
    return _then(_self.copyWith(
      vibrate: freezed == vibrate
          ? _self.vibrate
          : vibrate // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutputValueProperties?,
      rotate: freezed == rotate
          ? _self.rotate
          : rotate // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutputValueProperties?,
      oscillate: freezed == oscillate
          ? _self.oscillate
          : oscillate // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutputValueProperties?,
      constrict: freezed == constrict
          ? _self.constrict
          : constrict // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutputValueProperties?,
      temperature: freezed == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutputValueProperties?,
      led: freezed == led
          ? _self.led
          : led // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutputValueProperties?,
      position: freezed == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutputPositionProperties?,
      positionWithDuration: freezed == positionWithDuration
          ? _self.positionWithDuration
          : positionWithDuration // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutputPositionWithDurationProperties?,
      spray: freezed == spray
          ? _self.spray
          : spray // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutputValueProperties?,
    ));
  }

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get vibrate {
    if (_self.vibrate == null) {
      return null;
    }

    return $DeviceFeatureOutputValuePropertiesCopyWith<$Res>(_self.vibrate!,
        (value) {
      return _then(_self.copyWith(vibrate: value));
    });
  }

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get rotate {
    if (_self.rotate == null) {
      return null;
    }

    return $DeviceFeatureOutputValuePropertiesCopyWith<$Res>(_self.rotate!,
        (value) {
      return _then(_self.copyWith(rotate: value));
    });
  }

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get oscillate {
    if (_self.oscillate == null) {
      return null;
    }

    return $DeviceFeatureOutputValuePropertiesCopyWith<$Res>(_self.oscillate!,
        (value) {
      return _then(_self.copyWith(oscillate: value));
    });
  }

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get constrict {
    if (_self.constrict == null) {
      return null;
    }

    return $DeviceFeatureOutputValuePropertiesCopyWith<$Res>(_self.constrict!,
        (value) {
      return _then(_self.copyWith(constrict: value));
    });
  }

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get temperature {
    if (_self.temperature == null) {
      return null;
    }

    return $DeviceFeatureOutputValuePropertiesCopyWith<$Res>(_self.temperature!,
        (value) {
      return _then(_self.copyWith(temperature: value));
    });
  }

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get led {
    if (_self.led == null) {
      return null;
    }

    return $DeviceFeatureOutputValuePropertiesCopyWith<$Res>(_self.led!,
        (value) {
      return _then(_self.copyWith(led: value));
    });
  }

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputPositionPropertiesCopyWith<$Res>? get position {
    if (_self.position == null) {
      return null;
    }

    return $DeviceFeatureOutputPositionPropertiesCopyWith<$Res>(_self.position!,
        (value) {
      return _then(_self.copyWith(position: value));
    });
  }

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputPositionWithDurationPropertiesCopyWith<$Res>?
      get positionWithDuration {
    if (_self.positionWithDuration == null) {
      return null;
    }

    return $DeviceFeatureOutputPositionWithDurationPropertiesCopyWith<$Res>(
        _self.positionWithDuration!, (value) {
      return _then(_self.copyWith(positionWithDuration: value));
    });
  }

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get spray {
    if (_self.spray == null) {
      return null;
    }

    return $DeviceFeatureOutputValuePropertiesCopyWith<$Res>(_self.spray!,
        (value) {
      return _then(_self.copyWith(spray: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DeviceFeatureOutput].
extension DeviceFeatureOutputPatterns on DeviceFeatureOutput {
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
    TResult Function(_DeviceFeatureOutput value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutput() when $default != null:
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
    TResult Function(_DeviceFeatureOutput value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutput():
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
    TResult? Function(_DeviceFeatureOutput value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutput() when $default != null:
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
            DeviceFeatureOutputValueProperties? vibrate,
            DeviceFeatureOutputValueProperties? rotate,
            DeviceFeatureOutputValueProperties? oscillate,
            DeviceFeatureOutputValueProperties? constrict,
            DeviceFeatureOutputValueProperties? temperature,
            DeviceFeatureOutputValueProperties? led,
            DeviceFeatureOutputPositionProperties? position,
            DeviceFeatureOutputPositionWithDurationProperties?
                positionWithDuration,
            DeviceFeatureOutputValueProperties? spray)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutput() when $default != null:
        return $default(
            _that.vibrate,
            _that.rotate,
            _that.oscillate,
            _that.constrict,
            _that.temperature,
            _that.led,
            _that.position,
            _that.positionWithDuration,
            _that.spray);
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
            DeviceFeatureOutputValueProperties? vibrate,
            DeviceFeatureOutputValueProperties? rotate,
            DeviceFeatureOutputValueProperties? oscillate,
            DeviceFeatureOutputValueProperties? constrict,
            DeviceFeatureOutputValueProperties? temperature,
            DeviceFeatureOutputValueProperties? led,
            DeviceFeatureOutputPositionProperties? position,
            DeviceFeatureOutputPositionWithDurationProperties?
                positionWithDuration,
            DeviceFeatureOutputValueProperties? spray)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutput():
        return $default(
            _that.vibrate,
            _that.rotate,
            _that.oscillate,
            _that.constrict,
            _that.temperature,
            _that.led,
            _that.position,
            _that.positionWithDuration,
            _that.spray);
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
            DeviceFeatureOutputValueProperties? vibrate,
            DeviceFeatureOutputValueProperties? rotate,
            DeviceFeatureOutputValueProperties? oscillate,
            DeviceFeatureOutputValueProperties? constrict,
            DeviceFeatureOutputValueProperties? temperature,
            DeviceFeatureOutputValueProperties? led,
            DeviceFeatureOutputPositionProperties? position,
            DeviceFeatureOutputPositionWithDurationProperties?
                positionWithDuration,
            DeviceFeatureOutputValueProperties? spray)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutput() when $default != null:
        return $default(
            _that.vibrate,
            _that.rotate,
            _that.oscillate,
            _that.constrict,
            _that.temperature,
            _that.led,
            _that.position,
            _that.positionWithDuration,
            _that.spray);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeviceFeatureOutput extends DeviceFeatureOutput {
  const _DeviceFeatureOutput(
      {this.vibrate,
      this.rotate,
      this.oscillate,
      this.constrict,
      this.temperature,
      this.led,
      this.position,
      this.positionWithDuration,
      this.spray})
      : super._();
  factory _DeviceFeatureOutput.fromJson(Map<String, dynamic> json) =>
      _$DeviceFeatureOutputFromJson(json);

  @override
  final DeviceFeatureOutputValueProperties? vibrate;
  @override
  final DeviceFeatureOutputValueProperties? rotate;
  @override
  final DeviceFeatureOutputValueProperties? oscillate;
  @override
  final DeviceFeatureOutputValueProperties? constrict;
  @override
  final DeviceFeatureOutputValueProperties? temperature;
  @override
  final DeviceFeatureOutputValueProperties? led;
  @override
  final DeviceFeatureOutputPositionProperties? position;
  @override
  final DeviceFeatureOutputPositionWithDurationProperties? positionWithDuration;
  @override
  final DeviceFeatureOutputValueProperties? spray;

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeviceFeatureOutputCopyWith<_DeviceFeatureOutput> get copyWith =>
      __$DeviceFeatureOutputCopyWithImpl<_DeviceFeatureOutput>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeviceFeatureOutputToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceFeatureOutput &&
            (identical(other.vibrate, vibrate) || other.vibrate == vibrate) &&
            (identical(other.rotate, rotate) || other.rotate == rotate) &&
            (identical(other.oscillate, oscillate) ||
                other.oscillate == oscillate) &&
            (identical(other.constrict, constrict) ||
                other.constrict == constrict) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.led, led) || other.led == led) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.positionWithDuration, positionWithDuration) ||
                other.positionWithDuration == positionWithDuration) &&
            (identical(other.spray, spray) || other.spray == spray));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, vibrate, rotate, oscillate,
      constrict, temperature, led, position, positionWithDuration, spray);

  @override
  String toString() {
    return 'DeviceFeatureOutput(vibrate: $vibrate, rotate: $rotate, oscillate: $oscillate, constrict: $constrict, temperature: $temperature, led: $led, position: $position, positionWithDuration: $positionWithDuration, spray: $spray)';
  }
}

/// @nodoc
abstract mixin class _$DeviceFeatureOutputCopyWith<$Res>
    implements $DeviceFeatureOutputCopyWith<$Res> {
  factory _$DeviceFeatureOutputCopyWith(_DeviceFeatureOutput value,
          $Res Function(_DeviceFeatureOutput) _then) =
      __$DeviceFeatureOutputCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DeviceFeatureOutputValueProperties? vibrate,
      DeviceFeatureOutputValueProperties? rotate,
      DeviceFeatureOutputValueProperties? oscillate,
      DeviceFeatureOutputValueProperties? constrict,
      DeviceFeatureOutputValueProperties? temperature,
      DeviceFeatureOutputValueProperties? led,
      DeviceFeatureOutputPositionProperties? position,
      DeviceFeatureOutputPositionWithDurationProperties? positionWithDuration,
      DeviceFeatureOutputValueProperties? spray});

  @override
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get vibrate;
  @override
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get rotate;
  @override
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get oscillate;
  @override
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get constrict;
  @override
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get temperature;
  @override
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get led;
  @override
  $DeviceFeatureOutputPositionPropertiesCopyWith<$Res>? get position;
  @override
  $DeviceFeatureOutputPositionWithDurationPropertiesCopyWith<$Res>?
      get positionWithDuration;
  @override
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get spray;
}

/// @nodoc
class __$DeviceFeatureOutputCopyWithImpl<$Res>
    implements _$DeviceFeatureOutputCopyWith<$Res> {
  __$DeviceFeatureOutputCopyWithImpl(this._self, this._then);

  final _DeviceFeatureOutput _self;
  final $Res Function(_DeviceFeatureOutput) _then;

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vibrate = freezed,
    Object? rotate = freezed,
    Object? oscillate = freezed,
    Object? constrict = freezed,
    Object? temperature = freezed,
    Object? led = freezed,
    Object? position = freezed,
    Object? positionWithDuration = freezed,
    Object? spray = freezed,
  }) {
    return _then(_DeviceFeatureOutput(
      vibrate: freezed == vibrate
          ? _self.vibrate
          : vibrate // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutputValueProperties?,
      rotate: freezed == rotate
          ? _self.rotate
          : rotate // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutputValueProperties?,
      oscillate: freezed == oscillate
          ? _self.oscillate
          : oscillate // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutputValueProperties?,
      constrict: freezed == constrict
          ? _self.constrict
          : constrict // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutputValueProperties?,
      temperature: freezed == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutputValueProperties?,
      led: freezed == led
          ? _self.led
          : led // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutputValueProperties?,
      position: freezed == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutputPositionProperties?,
      positionWithDuration: freezed == positionWithDuration
          ? _self.positionWithDuration
          : positionWithDuration // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutputPositionWithDurationProperties?,
      spray: freezed == spray
          ? _self.spray
          : spray // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutputValueProperties?,
    ));
  }

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get vibrate {
    if (_self.vibrate == null) {
      return null;
    }

    return $DeviceFeatureOutputValuePropertiesCopyWith<$Res>(_self.vibrate!,
        (value) {
      return _then(_self.copyWith(vibrate: value));
    });
  }

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get rotate {
    if (_self.rotate == null) {
      return null;
    }

    return $DeviceFeatureOutputValuePropertiesCopyWith<$Res>(_self.rotate!,
        (value) {
      return _then(_self.copyWith(rotate: value));
    });
  }

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get oscillate {
    if (_self.oscillate == null) {
      return null;
    }

    return $DeviceFeatureOutputValuePropertiesCopyWith<$Res>(_self.oscillate!,
        (value) {
      return _then(_self.copyWith(oscillate: value));
    });
  }

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get constrict {
    if (_self.constrict == null) {
      return null;
    }

    return $DeviceFeatureOutputValuePropertiesCopyWith<$Res>(_self.constrict!,
        (value) {
      return _then(_self.copyWith(constrict: value));
    });
  }

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get temperature {
    if (_self.temperature == null) {
      return null;
    }

    return $DeviceFeatureOutputValuePropertiesCopyWith<$Res>(_self.temperature!,
        (value) {
      return _then(_self.copyWith(temperature: value));
    });
  }

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get led {
    if (_self.led == null) {
      return null;
    }

    return $DeviceFeatureOutputValuePropertiesCopyWith<$Res>(_self.led!,
        (value) {
      return _then(_self.copyWith(led: value));
    });
  }

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputPositionPropertiesCopyWith<$Res>? get position {
    if (_self.position == null) {
      return null;
    }

    return $DeviceFeatureOutputPositionPropertiesCopyWith<$Res>(_self.position!,
        (value) {
      return _then(_self.copyWith(position: value));
    });
  }

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputPositionWithDurationPropertiesCopyWith<$Res>?
      get positionWithDuration {
    if (_self.positionWithDuration == null) {
      return null;
    }

    return $DeviceFeatureOutputPositionWithDurationPropertiesCopyWith<$Res>(
        _self.positionWithDuration!, (value) {
      return _then(_self.copyWith(positionWithDuration: value));
    });
  }

  /// Create a copy of DeviceFeatureOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputValuePropertiesCopyWith<$Res>? get spray {
    if (_self.spray == null) {
      return null;
    }

    return $DeviceFeatureOutputValuePropertiesCopyWith<$Res>(_self.spray!,
        (value) {
      return _then(_self.copyWith(spray: value));
    });
  }
}

// dart format on
