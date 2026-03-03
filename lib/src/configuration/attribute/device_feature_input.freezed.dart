// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_feature_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceFeatureInput {
  @JsonKey(name: 'battery')
  DeviceFeatureInputProperties? get battery;
  @JsonKey(name: 'rssi')
  DeviceFeatureInputProperties? get rssi;
  @JsonKey(name: 'button')
  DeviceFeatureInputProperties? get button;
  @JsonKey(name: 'pressure')
  DeviceFeatureInputProperties? get pressure;

  /// Create a copy of DeviceFeatureInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceFeatureInputCopyWith<DeviceFeatureInput> get copyWith =>
      _$DeviceFeatureInputCopyWithImpl<DeviceFeatureInput>(
          this as DeviceFeatureInput, _$identity);

  /// Serializes this DeviceFeatureInput to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceFeatureInput &&
            (identical(other.battery, battery) || other.battery == battery) &&
            (identical(other.rssi, rssi) || other.rssi == rssi) &&
            (identical(other.button, button) || other.button == button) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, battery, rssi, button, pressure);

  @override
  String toString() {
    return 'DeviceFeatureInput(battery: $battery, rssi: $rssi, button: $button, pressure: $pressure)';
  }
}

/// @nodoc
abstract mixin class $DeviceFeatureInputCopyWith<$Res> {
  factory $DeviceFeatureInputCopyWith(
          DeviceFeatureInput value, $Res Function(DeviceFeatureInput) _then) =
      _$DeviceFeatureInputCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'battery') DeviceFeatureInputProperties? battery,
      @JsonKey(name: 'rssi') DeviceFeatureInputProperties? rssi,
      @JsonKey(name: 'button') DeviceFeatureInputProperties? button,
      @JsonKey(name: 'pressure') DeviceFeatureInputProperties? pressure});

  $DeviceFeatureInputPropertiesCopyWith<$Res>? get battery;
  $DeviceFeatureInputPropertiesCopyWith<$Res>? get rssi;
  $DeviceFeatureInputPropertiesCopyWith<$Res>? get button;
  $DeviceFeatureInputPropertiesCopyWith<$Res>? get pressure;
}

/// @nodoc
class _$DeviceFeatureInputCopyWithImpl<$Res>
    implements $DeviceFeatureInputCopyWith<$Res> {
  _$DeviceFeatureInputCopyWithImpl(this._self, this._then);

  final DeviceFeatureInput _self;
  final $Res Function(DeviceFeatureInput) _then;

  /// Create a copy of DeviceFeatureInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? battery = freezed,
    Object? rssi = freezed,
    Object? button = freezed,
    Object? pressure = freezed,
  }) {
    return _then(_self.copyWith(
      battery: freezed == battery
          ? _self.battery
          : battery // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureInputProperties?,
      rssi: freezed == rssi
          ? _self.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureInputProperties?,
      button: freezed == button
          ? _self.button
          : button // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureInputProperties?,
      pressure: freezed == pressure
          ? _self.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureInputProperties?,
    ));
  }

  /// Create a copy of DeviceFeatureInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureInputPropertiesCopyWith<$Res>? get battery {
    if (_self.battery == null) {
      return null;
    }

    return $DeviceFeatureInputPropertiesCopyWith<$Res>(_self.battery!, (value) {
      return _then(_self.copyWith(battery: value));
    });
  }

  /// Create a copy of DeviceFeatureInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureInputPropertiesCopyWith<$Res>? get rssi {
    if (_self.rssi == null) {
      return null;
    }

    return $DeviceFeatureInputPropertiesCopyWith<$Res>(_self.rssi!, (value) {
      return _then(_self.copyWith(rssi: value));
    });
  }

  /// Create a copy of DeviceFeatureInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureInputPropertiesCopyWith<$Res>? get button {
    if (_self.button == null) {
      return null;
    }

    return $DeviceFeatureInputPropertiesCopyWith<$Res>(_self.button!, (value) {
      return _then(_self.copyWith(button: value));
    });
  }

  /// Create a copy of DeviceFeatureInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureInputPropertiesCopyWith<$Res>? get pressure {
    if (_self.pressure == null) {
      return null;
    }

    return $DeviceFeatureInputPropertiesCopyWith<$Res>(_self.pressure!,
        (value) {
      return _then(_self.copyWith(pressure: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DeviceFeatureInput].
extension DeviceFeatureInputPatterns on DeviceFeatureInput {
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
    TResult Function(_DeviceFeatureInput value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureInput() when $default != null:
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
    TResult Function(_DeviceFeatureInput value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureInput():
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
    TResult? Function(_DeviceFeatureInput value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureInput() when $default != null:
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
            @JsonKey(name: 'battery') DeviceFeatureInputProperties? battery,
            @JsonKey(name: 'rssi') DeviceFeatureInputProperties? rssi,
            @JsonKey(name: 'button') DeviceFeatureInputProperties? button,
            @JsonKey(name: 'pressure') DeviceFeatureInputProperties? pressure)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureInput() when $default != null:
        return $default(
            _that.battery, _that.rssi, _that.button, _that.pressure);
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
            @JsonKey(name: 'battery') DeviceFeatureInputProperties? battery,
            @JsonKey(name: 'rssi') DeviceFeatureInputProperties? rssi,
            @JsonKey(name: 'button') DeviceFeatureInputProperties? button,
            @JsonKey(name: 'pressure') DeviceFeatureInputProperties? pressure)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureInput():
        return $default(
            _that.battery, _that.rssi, _that.button, _that.pressure);
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
            @JsonKey(name: 'battery') DeviceFeatureInputProperties? battery,
            @JsonKey(name: 'rssi') DeviceFeatureInputProperties? rssi,
            @JsonKey(name: 'button') DeviceFeatureInputProperties? button,
            @JsonKey(name: 'pressure') DeviceFeatureInputProperties? pressure)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureInput() when $default != null:
        return $default(
            _that.battery, _that.rssi, _that.button, _that.pressure);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeviceFeatureInput extends DeviceFeatureInput {
  const _DeviceFeatureInput(
      {@JsonKey(name: 'battery') this.battery,
      @JsonKey(name: 'rssi') this.rssi,
      @JsonKey(name: 'button') this.button,
      @JsonKey(name: 'pressure') this.pressure})
      : super._();
  factory _DeviceFeatureInput.fromJson(Map<String, dynamic> json) =>
      _$DeviceFeatureInputFromJson(json);

  @override
  @JsonKey(name: 'battery')
  final DeviceFeatureInputProperties? battery;
  @override
  @JsonKey(name: 'rssi')
  final DeviceFeatureInputProperties? rssi;
  @override
  @JsonKey(name: 'button')
  final DeviceFeatureInputProperties? button;
  @override
  @JsonKey(name: 'pressure')
  final DeviceFeatureInputProperties? pressure;

  /// Create a copy of DeviceFeatureInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeviceFeatureInputCopyWith<_DeviceFeatureInput> get copyWith =>
      __$DeviceFeatureInputCopyWithImpl<_DeviceFeatureInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeviceFeatureInputToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceFeatureInput &&
            (identical(other.battery, battery) || other.battery == battery) &&
            (identical(other.rssi, rssi) || other.rssi == rssi) &&
            (identical(other.button, button) || other.button == button) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, battery, rssi, button, pressure);

  @override
  String toString() {
    return 'DeviceFeatureInput(battery: $battery, rssi: $rssi, button: $button, pressure: $pressure)';
  }
}

/// @nodoc
abstract mixin class _$DeviceFeatureInputCopyWith<$Res>
    implements $DeviceFeatureInputCopyWith<$Res> {
  factory _$DeviceFeatureInputCopyWith(
          _DeviceFeatureInput value, $Res Function(_DeviceFeatureInput) _then) =
      __$DeviceFeatureInputCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'battery') DeviceFeatureInputProperties? battery,
      @JsonKey(name: 'rssi') DeviceFeatureInputProperties? rssi,
      @JsonKey(name: 'button') DeviceFeatureInputProperties? button,
      @JsonKey(name: 'pressure') DeviceFeatureInputProperties? pressure});

  @override
  $DeviceFeatureInputPropertiesCopyWith<$Res>? get battery;
  @override
  $DeviceFeatureInputPropertiesCopyWith<$Res>? get rssi;
  @override
  $DeviceFeatureInputPropertiesCopyWith<$Res>? get button;
  @override
  $DeviceFeatureInputPropertiesCopyWith<$Res>? get pressure;
}

/// @nodoc
class __$DeviceFeatureInputCopyWithImpl<$Res>
    implements _$DeviceFeatureInputCopyWith<$Res> {
  __$DeviceFeatureInputCopyWithImpl(this._self, this._then);

  final _DeviceFeatureInput _self;
  final $Res Function(_DeviceFeatureInput) _then;

  /// Create a copy of DeviceFeatureInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? battery = freezed,
    Object? rssi = freezed,
    Object? button = freezed,
    Object? pressure = freezed,
  }) {
    return _then(_DeviceFeatureInput(
      battery: freezed == battery
          ? _self.battery
          : battery // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureInputProperties?,
      rssi: freezed == rssi
          ? _self.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureInputProperties?,
      button: freezed == button
          ? _self.button
          : button // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureInputProperties?,
      pressure: freezed == pressure
          ? _self.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureInputProperties?,
    ));
  }

  /// Create a copy of DeviceFeatureInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureInputPropertiesCopyWith<$Res>? get battery {
    if (_self.battery == null) {
      return null;
    }

    return $DeviceFeatureInputPropertiesCopyWith<$Res>(_self.battery!, (value) {
      return _then(_self.copyWith(battery: value));
    });
  }

  /// Create a copy of DeviceFeatureInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureInputPropertiesCopyWith<$Res>? get rssi {
    if (_self.rssi == null) {
      return null;
    }

    return $DeviceFeatureInputPropertiesCopyWith<$Res>(_self.rssi!, (value) {
      return _then(_self.copyWith(rssi: value));
    });
  }

  /// Create a copy of DeviceFeatureInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureInputPropertiesCopyWith<$Res>? get button {
    if (_self.button == null) {
      return null;
    }

    return $DeviceFeatureInputPropertiesCopyWith<$Res>(_self.button!, (value) {
      return _then(_self.copyWith(button: value));
    });
  }

  /// Create a copy of DeviceFeatureInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureInputPropertiesCopyWith<$Res>? get pressure {
    if (_self.pressure == null) {
      return null;
    }

    return $DeviceFeatureInputPropertiesCopyWith<$Res>(_self.pressure!,
        (value) {
      return _then(_self.copyWith(pressure: value));
    });
  }
}

// dart format on
