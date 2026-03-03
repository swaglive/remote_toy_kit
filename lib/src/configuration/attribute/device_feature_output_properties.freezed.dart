// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_feature_output_properties.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceFeatureOutputValueProperties {
  @RangeInclusiveJsonConverter()
  RangeInclusive get value;

  /// Create a copy of DeviceFeatureOutputValueProperties
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputValuePropertiesCopyWith<
          DeviceFeatureOutputValueProperties>
      get copyWith => _$DeviceFeatureOutputValuePropertiesCopyWithImpl<
              DeviceFeatureOutputValueProperties>(
          this as DeviceFeatureOutputValueProperties, _$identity);

  /// Serializes this DeviceFeatureOutputValueProperties to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceFeatureOutputValueProperties &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'DeviceFeatureOutputValueProperties(value: $value)';
  }
}

/// @nodoc
abstract mixin class $DeviceFeatureOutputValuePropertiesCopyWith<$Res> {
  factory $DeviceFeatureOutputValuePropertiesCopyWith(
          DeviceFeatureOutputValueProperties value,
          $Res Function(DeviceFeatureOutputValueProperties) _then) =
      _$DeviceFeatureOutputValuePropertiesCopyWithImpl;
  @useResult
  $Res call({@RangeInclusiveJsonConverter() RangeInclusive value});

  $RangeInclusiveCopyWith<$Res> get value;
}

/// @nodoc
class _$DeviceFeatureOutputValuePropertiesCopyWithImpl<$Res>
    implements $DeviceFeatureOutputValuePropertiesCopyWith<$Res> {
  _$DeviceFeatureOutputValuePropertiesCopyWithImpl(this._self, this._then);

  final DeviceFeatureOutputValueProperties _self;
  final $Res Function(DeviceFeatureOutputValueProperties) _then;

  /// Create a copy of DeviceFeatureOutputValueProperties
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
              as RangeInclusive,
    ));
  }

  /// Create a copy of DeviceFeatureOutputValueProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RangeInclusiveCopyWith<$Res> get value {
    return $RangeInclusiveCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DeviceFeatureOutputValueProperties].
extension DeviceFeatureOutputValuePropertiesPatterns
    on DeviceFeatureOutputValueProperties {
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
    TResult Function(_DeviceFeatureOutputValueProperties value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutputValueProperties() when $default != null:
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
    TResult Function(_DeviceFeatureOutputValueProperties value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutputValueProperties():
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
    TResult? Function(_DeviceFeatureOutputValueProperties value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutputValueProperties() when $default != null:
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
    TResult Function(@RangeInclusiveJsonConverter() RangeInclusive value)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutputValueProperties() when $default != null:
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
    TResult Function(@RangeInclusiveJsonConverter() RangeInclusive value)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutputValueProperties():
        return $default(_that.value);
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
    TResult? Function(@RangeInclusiveJsonConverter() RangeInclusive value)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutputValueProperties() when $default != null:
        return $default(_that.value);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeviceFeatureOutputValueProperties
    extends DeviceFeatureOutputValueProperties {
  const _DeviceFeatureOutputValueProperties(
      {@RangeInclusiveJsonConverter() required this.value})
      : super._();
  factory _DeviceFeatureOutputValueProperties.fromJson(
          Map<String, dynamic> json) =>
      _$DeviceFeatureOutputValuePropertiesFromJson(json);

  @override
  @RangeInclusiveJsonConverter()
  final RangeInclusive value;

  /// Create a copy of DeviceFeatureOutputValueProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeviceFeatureOutputValuePropertiesCopyWith<
          _DeviceFeatureOutputValueProperties>
      get copyWith => __$DeviceFeatureOutputValuePropertiesCopyWithImpl<
          _DeviceFeatureOutputValueProperties>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeviceFeatureOutputValuePropertiesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceFeatureOutputValueProperties &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'DeviceFeatureOutputValueProperties(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$DeviceFeatureOutputValuePropertiesCopyWith<$Res>
    implements $DeviceFeatureOutputValuePropertiesCopyWith<$Res> {
  factory _$DeviceFeatureOutputValuePropertiesCopyWith(
          _DeviceFeatureOutputValueProperties value,
          $Res Function(_DeviceFeatureOutputValueProperties) _then) =
      __$DeviceFeatureOutputValuePropertiesCopyWithImpl;
  @override
  @useResult
  $Res call({@RangeInclusiveJsonConverter() RangeInclusive value});

  @override
  $RangeInclusiveCopyWith<$Res> get value;
}

/// @nodoc
class __$DeviceFeatureOutputValuePropertiesCopyWithImpl<$Res>
    implements _$DeviceFeatureOutputValuePropertiesCopyWith<$Res> {
  __$DeviceFeatureOutputValuePropertiesCopyWithImpl(this._self, this._then);

  final _DeviceFeatureOutputValueProperties _self;
  final $Res Function(_DeviceFeatureOutputValueProperties) _then;

  /// Create a copy of DeviceFeatureOutputValueProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(_DeviceFeatureOutputValueProperties(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as RangeInclusive,
    ));
  }

  /// Create a copy of DeviceFeatureOutputValueProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RangeInclusiveCopyWith<$Res> get value {
    return $RangeInclusiveCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }
}

/// @nodoc
mixin _$DeviceFeatureOutputPositionProperties {
  @RangeInclusiveJsonConverter()
  RangeInclusive get value;

  /// Create a copy of DeviceFeatureOutputPositionProperties
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputPositionPropertiesCopyWith<
          DeviceFeatureOutputPositionProperties>
      get copyWith => _$DeviceFeatureOutputPositionPropertiesCopyWithImpl<
              DeviceFeatureOutputPositionProperties>(
          this as DeviceFeatureOutputPositionProperties, _$identity);

  /// Serializes this DeviceFeatureOutputPositionProperties to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceFeatureOutputPositionProperties &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'DeviceFeatureOutputPositionProperties(value: $value)';
  }
}

/// @nodoc
abstract mixin class $DeviceFeatureOutputPositionPropertiesCopyWith<$Res> {
  factory $DeviceFeatureOutputPositionPropertiesCopyWith(
          DeviceFeatureOutputPositionProperties value,
          $Res Function(DeviceFeatureOutputPositionProperties) _then) =
      _$DeviceFeatureOutputPositionPropertiesCopyWithImpl;
  @useResult
  $Res call({@RangeInclusiveJsonConverter() RangeInclusive value});

  $RangeInclusiveCopyWith<$Res> get value;
}

/// @nodoc
class _$DeviceFeatureOutputPositionPropertiesCopyWithImpl<$Res>
    implements $DeviceFeatureOutputPositionPropertiesCopyWith<$Res> {
  _$DeviceFeatureOutputPositionPropertiesCopyWithImpl(this._self, this._then);

  final DeviceFeatureOutputPositionProperties _self;
  final $Res Function(DeviceFeatureOutputPositionProperties) _then;

  /// Create a copy of DeviceFeatureOutputPositionProperties
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
              as RangeInclusive,
    ));
  }

  /// Create a copy of DeviceFeatureOutputPositionProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RangeInclusiveCopyWith<$Res> get value {
    return $RangeInclusiveCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DeviceFeatureOutputPositionProperties].
extension DeviceFeatureOutputPositionPropertiesPatterns
    on DeviceFeatureOutputPositionProperties {
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
    TResult Function(_DeviceFeatureOutputPositionProperties value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutputPositionProperties() when $default != null:
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
    TResult Function(_DeviceFeatureOutputPositionProperties value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutputPositionProperties():
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
    TResult? Function(_DeviceFeatureOutputPositionProperties value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutputPositionProperties() when $default != null:
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
    TResult Function(@RangeInclusiveJsonConverter() RangeInclusive value)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutputPositionProperties() when $default != null:
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
    TResult Function(@RangeInclusiveJsonConverter() RangeInclusive value)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutputPositionProperties():
        return $default(_that.value);
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
    TResult? Function(@RangeInclusiveJsonConverter() RangeInclusive value)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutputPositionProperties() when $default != null:
        return $default(_that.value);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeviceFeatureOutputPositionProperties
    extends DeviceFeatureOutputPositionProperties {
  const _DeviceFeatureOutputPositionProperties(
      {@RangeInclusiveJsonConverter() required this.value})
      : super._();
  factory _DeviceFeatureOutputPositionProperties.fromJson(
          Map<String, dynamic> json) =>
      _$DeviceFeatureOutputPositionPropertiesFromJson(json);

  @override
  @RangeInclusiveJsonConverter()
  final RangeInclusive value;

  /// Create a copy of DeviceFeatureOutputPositionProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeviceFeatureOutputPositionPropertiesCopyWith<
          _DeviceFeatureOutputPositionProperties>
      get copyWith => __$DeviceFeatureOutputPositionPropertiesCopyWithImpl<
          _DeviceFeatureOutputPositionProperties>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeviceFeatureOutputPositionPropertiesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceFeatureOutputPositionProperties &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'DeviceFeatureOutputPositionProperties(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$DeviceFeatureOutputPositionPropertiesCopyWith<$Res>
    implements $DeviceFeatureOutputPositionPropertiesCopyWith<$Res> {
  factory _$DeviceFeatureOutputPositionPropertiesCopyWith(
          _DeviceFeatureOutputPositionProperties value,
          $Res Function(_DeviceFeatureOutputPositionProperties) _then) =
      __$DeviceFeatureOutputPositionPropertiesCopyWithImpl;
  @override
  @useResult
  $Res call({@RangeInclusiveJsonConverter() RangeInclusive value});

  @override
  $RangeInclusiveCopyWith<$Res> get value;
}

/// @nodoc
class __$DeviceFeatureOutputPositionPropertiesCopyWithImpl<$Res>
    implements _$DeviceFeatureOutputPositionPropertiesCopyWith<$Res> {
  __$DeviceFeatureOutputPositionPropertiesCopyWithImpl(this._self, this._then);

  final _DeviceFeatureOutputPositionProperties _self;
  final $Res Function(_DeviceFeatureOutputPositionProperties) _then;

  /// Create a copy of DeviceFeatureOutputPositionProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(_DeviceFeatureOutputPositionProperties(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as RangeInclusive,
    ));
  }

  /// Create a copy of DeviceFeatureOutputPositionProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RangeInclusiveCopyWith<$Res> get value {
    return $RangeInclusiveCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }
}

/// @nodoc
mixin _$DeviceFeatureOutputPositionWithDurationProperties {
  @RangeInclusiveJsonConverter()
  RangeInclusive get value;
  @RangeInclusiveJsonConverter()
  RangeInclusive get duration;

  /// Create a copy of DeviceFeatureOutputPositionWithDurationProperties
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputPositionWithDurationPropertiesCopyWith<
          DeviceFeatureOutputPositionWithDurationProperties>
      get copyWith =>
          _$DeviceFeatureOutputPositionWithDurationPropertiesCopyWithImpl<
                  DeviceFeatureOutputPositionWithDurationProperties>(
              this as DeviceFeatureOutputPositionWithDurationProperties,
              _$identity);

  /// Serializes this DeviceFeatureOutputPositionWithDurationProperties to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceFeatureOutputPositionWithDurationProperties &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, duration);

  @override
  String toString() {
    return 'DeviceFeatureOutputPositionWithDurationProperties(value: $value, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $DeviceFeatureOutputPositionWithDurationPropertiesCopyWith<
    $Res> {
  factory $DeviceFeatureOutputPositionWithDurationPropertiesCopyWith(
          DeviceFeatureOutputPositionWithDurationProperties value,
          $Res Function(DeviceFeatureOutputPositionWithDurationProperties)
              _then) =
      _$DeviceFeatureOutputPositionWithDurationPropertiesCopyWithImpl;
  @useResult
  $Res call(
      {@RangeInclusiveJsonConverter() RangeInclusive value,
      @RangeInclusiveJsonConverter() RangeInclusive duration});

  $RangeInclusiveCopyWith<$Res> get value;
  $RangeInclusiveCopyWith<$Res> get duration;
}

/// @nodoc
class _$DeviceFeatureOutputPositionWithDurationPropertiesCopyWithImpl<$Res>
    implements
        $DeviceFeatureOutputPositionWithDurationPropertiesCopyWith<$Res> {
  _$DeviceFeatureOutputPositionWithDurationPropertiesCopyWithImpl(
      this._self, this._then);

  final DeviceFeatureOutputPositionWithDurationProperties _self;
  final $Res Function(DeviceFeatureOutputPositionWithDurationProperties) _then;

  /// Create a copy of DeviceFeatureOutputPositionWithDurationProperties
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
              as RangeInclusive,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as RangeInclusive,
    ));
  }

  /// Create a copy of DeviceFeatureOutputPositionWithDurationProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RangeInclusiveCopyWith<$Res> get value {
    return $RangeInclusiveCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }

  /// Create a copy of DeviceFeatureOutputPositionWithDurationProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RangeInclusiveCopyWith<$Res> get duration {
    return $RangeInclusiveCopyWith<$Res>(_self.duration, (value) {
      return _then(_self.copyWith(duration: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DeviceFeatureOutputPositionWithDurationProperties].
extension DeviceFeatureOutputPositionWithDurationPropertiesPatterns
    on DeviceFeatureOutputPositionWithDurationProperties {
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
    TResult Function(_DeviceFeatureOutputPositionWithDurationProperties value)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutputPositionWithDurationProperties()
          when $default != null:
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
    TResult Function(_DeviceFeatureOutputPositionWithDurationProperties value)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutputPositionWithDurationProperties():
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
    TResult? Function(_DeviceFeatureOutputPositionWithDurationProperties value)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutputPositionWithDurationProperties()
          when $default != null:
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
    TResult Function(@RangeInclusiveJsonConverter() RangeInclusive value,
            @RangeInclusiveJsonConverter() RangeInclusive duration)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutputPositionWithDurationProperties()
          when $default != null:
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
    TResult Function(@RangeInclusiveJsonConverter() RangeInclusive value,
            @RangeInclusiveJsonConverter() RangeInclusive duration)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutputPositionWithDurationProperties():
        return $default(_that.value, _that.duration);
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
    TResult? Function(@RangeInclusiveJsonConverter() RangeInclusive value,
            @RangeInclusiveJsonConverter() RangeInclusive duration)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeatureOutputPositionWithDurationProperties()
          when $default != null:
        return $default(_that.value, _that.duration);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeviceFeatureOutputPositionWithDurationProperties
    extends DeviceFeatureOutputPositionWithDurationProperties {
  const _DeviceFeatureOutputPositionWithDurationProperties(
      {@RangeInclusiveJsonConverter() required this.value,
      @RangeInclusiveJsonConverter() required this.duration})
      : super._();
  factory _DeviceFeatureOutputPositionWithDurationProperties.fromJson(
          Map<String, dynamic> json) =>
      _$DeviceFeatureOutputPositionWithDurationPropertiesFromJson(json);

  @override
  @RangeInclusiveJsonConverter()
  final RangeInclusive value;
  @override
  @RangeInclusiveJsonConverter()
  final RangeInclusive duration;

  /// Create a copy of DeviceFeatureOutputPositionWithDurationProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeviceFeatureOutputPositionWithDurationPropertiesCopyWith<
          _DeviceFeatureOutputPositionWithDurationProperties>
      get copyWith =>
          __$DeviceFeatureOutputPositionWithDurationPropertiesCopyWithImpl<
                  _DeviceFeatureOutputPositionWithDurationProperties>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeviceFeatureOutputPositionWithDurationPropertiesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceFeatureOutputPositionWithDurationProperties &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, duration);

  @override
  String toString() {
    return 'DeviceFeatureOutputPositionWithDurationProperties(value: $value, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class _$DeviceFeatureOutputPositionWithDurationPropertiesCopyWith<
        $Res>
    implements
        $DeviceFeatureOutputPositionWithDurationPropertiesCopyWith<$Res> {
  factory _$DeviceFeatureOutputPositionWithDurationPropertiesCopyWith(
          _DeviceFeatureOutputPositionWithDurationProperties value,
          $Res Function(_DeviceFeatureOutputPositionWithDurationProperties)
              _then) =
      __$DeviceFeatureOutputPositionWithDurationPropertiesCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@RangeInclusiveJsonConverter() RangeInclusive value,
      @RangeInclusiveJsonConverter() RangeInclusive duration});

  @override
  $RangeInclusiveCopyWith<$Res> get value;
  @override
  $RangeInclusiveCopyWith<$Res> get duration;
}

/// @nodoc
class __$DeviceFeatureOutputPositionWithDurationPropertiesCopyWithImpl<$Res>
    implements
        _$DeviceFeatureOutputPositionWithDurationPropertiesCopyWith<$Res> {
  __$DeviceFeatureOutputPositionWithDurationPropertiesCopyWithImpl(
      this._self, this._then);

  final _DeviceFeatureOutputPositionWithDurationProperties _self;
  final $Res Function(_DeviceFeatureOutputPositionWithDurationProperties) _then;

  /// Create a copy of DeviceFeatureOutputPositionWithDurationProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
    Object? duration = null,
  }) {
    return _then(_DeviceFeatureOutputPositionWithDurationProperties(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as RangeInclusive,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as RangeInclusive,
    ));
  }

  /// Create a copy of DeviceFeatureOutputPositionWithDurationProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RangeInclusiveCopyWith<$Res> get value {
    return $RangeInclusiveCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }

  /// Create a copy of DeviceFeatureOutputPositionWithDurationProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RangeInclusiveCopyWith<$Res> get duration {
    return $RangeInclusiveCopyWith<$Res>(_self.duration, (value) {
      return _then(_self.copyWith(duration: value));
    });
  }
}

// dart format on
