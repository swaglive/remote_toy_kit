// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_feature.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceFeature {
  @JsonKey(defaultValue: '')
  String get description;

  /// Create a copy of DeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceFeatureCopyWith<DeviceFeature> get copyWith =>
      _$DeviceFeatureCopyWithImpl<DeviceFeature>(
          this as DeviceFeature, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceFeature &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  @override
  String toString() {
    return 'DeviceFeature(description: $description)';
  }
}

/// @nodoc
abstract mixin class $DeviceFeatureCopyWith<$Res> {
  factory $DeviceFeatureCopyWith(
          DeviceFeature value, $Res Function(DeviceFeature) _then) =
      _$DeviceFeatureCopyWithImpl;
  @useResult
  $Res call({@JsonKey(defaultValue: '') String description});
}

/// @nodoc
class _$DeviceFeatureCopyWithImpl<$Res>
    implements $DeviceFeatureCopyWith<$Res> {
  _$DeviceFeatureCopyWithImpl(this._self, this._then);

  final DeviceFeature _self;
  final $Res Function(DeviceFeature) _then;

  /// Create a copy of DeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
  }) {
    return _then(_self.copyWith(
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [DeviceFeature].
extension DeviceFeaturePatterns on DeviceFeature {
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
    TResult Function(DeviceFeatureV3 value)? v3,
    TResult Function(DeviceFeatureV4 value)? v4,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DeviceFeatureV3() when v3 != null:
        return v3(_that);
      case DeviceFeatureV4() when v4 != null:
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
    required TResult Function(DeviceFeatureV3 value) v3,
    required TResult Function(DeviceFeatureV4 value) v4,
  }) {
    final _that = this;
    switch (_that) {
      case DeviceFeatureV3():
        return v3(_that);
      case DeviceFeatureV4():
        return v4(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceFeatureV3 value)? v3,
    TResult? Function(DeviceFeatureV4 value)? v4,
  }) {
    final _that = this;
    switch (_that) {
      case DeviceFeatureV3() when v3 != null:
        return v3(_that);
      case DeviceFeatureV4() when v4 != null:
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
    TResult Function(
            @JsonKey(defaultValue: '') String description,
            @JsonKey(name: 'feature-type') FeatureType featureType,
            DeviceFeatureActuator? actuator,
            DeviceFeatureSensor? sensor)?
        v3,
    TResult Function(String description, String id, int index,
            DeviceFeatureOutput? output, DeviceFeatureInput? input)?
        v4,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DeviceFeatureV3() when v3 != null:
        return v3(
            _that.description, _that.featureType, _that.actuator, _that.sensor);
      case DeviceFeatureV4() when v4 != null:
        return v4(_that.description, _that.id, _that.index, _that.output,
            _that.input);
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
    required TResult Function(
            @JsonKey(defaultValue: '') String description,
            @JsonKey(name: 'feature-type') FeatureType featureType,
            DeviceFeatureActuator? actuator,
            DeviceFeatureSensor? sensor)
        v3,
    required TResult Function(String description, String id, int index,
            DeviceFeatureOutput? output, DeviceFeatureInput? input)
        v4,
  }) {
    final _that = this;
    switch (_that) {
      case DeviceFeatureV3():
        return v3(
            _that.description, _that.featureType, _that.actuator, _that.sensor);
      case DeviceFeatureV4():
        return v4(_that.description, _that.id, _that.index, _that.output,
            _that.input);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(defaultValue: '') String description,
            @JsonKey(name: 'feature-type') FeatureType featureType,
            DeviceFeatureActuator? actuator,
            DeviceFeatureSensor? sensor)?
        v3,
    TResult? Function(String description, String id, int index,
            DeviceFeatureOutput? output, DeviceFeatureInput? input)?
        v4,
  }) {
    final _that = this;
    switch (_that) {
      case DeviceFeatureV3() when v3 != null:
        return v3(
            _that.description, _that.featureType, _that.actuator, _that.sensor);
      case DeviceFeatureV4() when v4 != null:
        return v4(_that.description, _that.id, _that.index, _that.output,
            _that.input);
      case _:
        return null;
    }
  }
}

/// @nodoc

@Deprecated('Will be deprecated after spec 4.0 is fully released')
class DeviceFeatureV3 extends DeviceFeature {
  const DeviceFeatureV3(
      {@JsonKey(defaultValue: '') this.description = '',
      @JsonKey(name: 'feature-type') required this.featureType,
      this.actuator,
      this.sensor})
      : super._();

  @override
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(name: 'feature-type')
  final FeatureType featureType;
  final DeviceFeatureActuator? actuator;
  final DeviceFeatureSensor? sensor;

  /// Create a copy of DeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceFeatureV3CopyWith<DeviceFeatureV3> get copyWith =>
      _$DeviceFeatureV3CopyWithImpl<DeviceFeatureV3>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceFeatureV3 &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.featureType, featureType) ||
                other.featureType == featureType) &&
            (identical(other.actuator, actuator) ||
                other.actuator == actuator) &&
            (identical(other.sensor, sensor) || other.sensor == sensor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, description, featureType, actuator, sensor);

  @override
  String toString() {
    return 'DeviceFeature.v3(description: $description, featureType: $featureType, actuator: $actuator, sensor: $sensor)';
  }
}

/// @nodoc
abstract mixin class $DeviceFeatureV3CopyWith<$Res>
    implements $DeviceFeatureCopyWith<$Res> {
  factory $DeviceFeatureV3CopyWith(
          DeviceFeatureV3 value, $Res Function(DeviceFeatureV3) _then) =
      _$DeviceFeatureV3CopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String description,
      @JsonKey(name: 'feature-type') FeatureType featureType,
      DeviceFeatureActuator? actuator,
      DeviceFeatureSensor? sensor});

  $DeviceFeatureActuatorCopyWith<$Res>? get actuator;
  $DeviceFeatureSensorCopyWith<$Res>? get sensor;
}

/// @nodoc
class _$DeviceFeatureV3CopyWithImpl<$Res>
    implements $DeviceFeatureV3CopyWith<$Res> {
  _$DeviceFeatureV3CopyWithImpl(this._self, this._then);

  final DeviceFeatureV3 _self;
  final $Res Function(DeviceFeatureV3) _then;

  /// Create a copy of DeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? description = null,
    Object? featureType = null,
    Object? actuator = freezed,
    Object? sensor = freezed,
  }) {
    return _then(DeviceFeatureV3(
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      featureType: null == featureType
          ? _self.featureType
          : featureType // ignore: cast_nullable_to_non_nullable
              as FeatureType,
      actuator: freezed == actuator
          ? _self.actuator
          : actuator // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureActuator?,
      sensor: freezed == sensor
          ? _self.sensor
          : sensor // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureSensor?,
    ));
  }

  /// Create a copy of DeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureActuatorCopyWith<$Res>? get actuator {
    if (_self.actuator == null) {
      return null;
    }

    return $DeviceFeatureActuatorCopyWith<$Res>(_self.actuator!, (value) {
      return _then(_self.copyWith(actuator: value));
    });
  }

  /// Create a copy of DeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureSensorCopyWith<$Res>? get sensor {
    if (_self.sensor == null) {
      return null;
    }

    return $DeviceFeatureSensorCopyWith<$Res>(_self.sensor!, (value) {
      return _then(_self.copyWith(sensor: value));
    });
  }
}

/// @nodoc

class DeviceFeatureV4 extends DeviceFeature {
  const DeviceFeatureV4(
      {this.description = '',
      required this.id,
      required this.index,
      this.output,
      this.input})
      : super._();

  @override
  @JsonKey()
  final String description;
  final String id;
  final int index;
  final DeviceFeatureOutput? output;
  final DeviceFeatureInput? input;

  /// Create a copy of DeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceFeatureV4CopyWith<DeviceFeatureV4> get copyWith =>
      _$DeviceFeatureV4CopyWithImpl<DeviceFeatureV4>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceFeatureV4 &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.output, output) || other.output == output) &&
            (identical(other.input, input) || other.input == input));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, description, id, index, output, input);

  @override
  String toString() {
    return 'DeviceFeature.v4(description: $description, id: $id, index: $index, output: $output, input: $input)';
  }
}

/// @nodoc
abstract mixin class $DeviceFeatureV4CopyWith<$Res>
    implements $DeviceFeatureCopyWith<$Res> {
  factory $DeviceFeatureV4CopyWith(
          DeviceFeatureV4 value, $Res Function(DeviceFeatureV4) _then) =
      _$DeviceFeatureV4CopyWithImpl;
  @override
  @useResult
  $Res call(
      {String description,
      String id,
      int index,
      DeviceFeatureOutput? output,
      DeviceFeatureInput? input});

  $DeviceFeatureOutputCopyWith<$Res>? get output;
  $DeviceFeatureInputCopyWith<$Res>? get input;
}

/// @nodoc
class _$DeviceFeatureV4CopyWithImpl<$Res>
    implements $DeviceFeatureV4CopyWith<$Res> {
  _$DeviceFeatureV4CopyWithImpl(this._self, this._then);

  final DeviceFeatureV4 _self;
  final $Res Function(DeviceFeatureV4) _then;

  /// Create a copy of DeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? description = null,
    Object? id = null,
    Object? index = null,
    Object? output = freezed,
    Object? input = freezed,
  }) {
    return _then(DeviceFeatureV4(
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      output: freezed == output
          ? _self.output
          : output // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutput?,
      input: freezed == input
          ? _self.input
          : input // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureInput?,
    ));
  }

  /// Create a copy of DeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputCopyWith<$Res>? get output {
    if (_self.output == null) {
      return null;
    }

    return $DeviceFeatureOutputCopyWith<$Res>(_self.output!, (value) {
      return _then(_self.copyWith(output: value));
    });
  }

  /// Create a copy of DeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureInputCopyWith<$Res>? get input {
    if (_self.input == null) {
      return null;
    }

    return $DeviceFeatureInputCopyWith<$Res>(_self.input!, (value) {
      return _then(_self.copyWith(input: value));
    });
  }
}

// dart format on
