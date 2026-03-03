// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_configuration_version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceConfigurationVersion {
  int get major;
  int get minor;

  /// Create a copy of DeviceConfigurationVersion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceConfigurationVersionCopyWith<DeviceConfigurationVersion>
      get copyWith =>
          _$DeviceConfigurationVersionCopyWithImpl<DeviceConfigurationVersion>(
              this as DeviceConfigurationVersion, _$identity);

  /// Serializes this DeviceConfigurationVersion to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceConfigurationVersion &&
            (identical(other.major, major) || other.major == major) &&
            (identical(other.minor, minor) || other.minor == minor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, major, minor);

  @override
  String toString() {
    return 'DeviceConfigurationVersion(major: $major, minor: $minor)';
  }
}

/// @nodoc
abstract mixin class $DeviceConfigurationVersionCopyWith<$Res> {
  factory $DeviceConfigurationVersionCopyWith(DeviceConfigurationVersion value,
          $Res Function(DeviceConfigurationVersion) _then) =
      _$DeviceConfigurationVersionCopyWithImpl;
  @useResult
  $Res call({int major, int minor});
}

/// @nodoc
class _$DeviceConfigurationVersionCopyWithImpl<$Res>
    implements $DeviceConfigurationVersionCopyWith<$Res> {
  _$DeviceConfigurationVersionCopyWithImpl(this._self, this._then);

  final DeviceConfigurationVersion _self;
  final $Res Function(DeviceConfigurationVersion) _then;

  /// Create a copy of DeviceConfigurationVersion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? major = null,
    Object? minor = null,
  }) {
    return _then(_self.copyWith(
      major: null == major
          ? _self.major
          : major // ignore: cast_nullable_to_non_nullable
              as int,
      minor: null == minor
          ? _self.minor
          : minor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [DeviceConfigurationVersion].
extension DeviceConfigurationVersionPatterns on DeviceConfigurationVersion {
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
    TResult Function(_DeviceConfigurationVersion value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceConfigurationVersion() when $default != null:
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
    TResult Function(_DeviceConfigurationVersion value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceConfigurationVersion():
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
    TResult? Function(_DeviceConfigurationVersion value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceConfigurationVersion() when $default != null:
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
    TResult Function(int major, int minor)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceConfigurationVersion() when $default != null:
        return $default(_that.major, _that.minor);
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
    TResult Function(int major, int minor) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceConfigurationVersion():
        return $default(_that.major, _that.minor);
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
    TResult? Function(int major, int minor)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceConfigurationVersion() when $default != null:
        return $default(_that.major, _that.minor);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeviceConfigurationVersion implements DeviceConfigurationVersion {
  const _DeviceConfigurationVersion({required this.major, required this.minor});
  factory _DeviceConfigurationVersion.fromJson(Map<String, dynamic> json) =>
      _$DeviceConfigurationVersionFromJson(json);

  @override
  final int major;
  @override
  final int minor;

  /// Create a copy of DeviceConfigurationVersion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeviceConfigurationVersionCopyWith<_DeviceConfigurationVersion>
      get copyWith => __$DeviceConfigurationVersionCopyWithImpl<
          _DeviceConfigurationVersion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeviceConfigurationVersionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceConfigurationVersion &&
            (identical(other.major, major) || other.major == major) &&
            (identical(other.minor, minor) || other.minor == minor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, major, minor);

  @override
  String toString() {
    return 'DeviceConfigurationVersion(major: $major, minor: $minor)';
  }
}

/// @nodoc
abstract mixin class _$DeviceConfigurationVersionCopyWith<$Res>
    implements $DeviceConfigurationVersionCopyWith<$Res> {
  factory _$DeviceConfigurationVersionCopyWith(
          _DeviceConfigurationVersion value,
          $Res Function(_DeviceConfigurationVersion) _then) =
      __$DeviceConfigurationVersionCopyWithImpl;
  @override
  @useResult
  $Res call({int major, int minor});
}

/// @nodoc
class __$DeviceConfigurationVersionCopyWithImpl<$Res>
    implements _$DeviceConfigurationVersionCopyWith<$Res> {
  __$DeviceConfigurationVersionCopyWithImpl(this._self, this._then);

  final _DeviceConfigurationVersion _self;
  final $Res Function(_DeviceConfigurationVersion) _then;

  /// Create a copy of DeviceConfigurationVersion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? major = null,
    Object? minor = null,
  }) {
    return _then(_DeviceConfigurationVersion(
      major: null == major
          ? _self.major
          : major // ignore: cast_nullable_to_non_nullable
              as int,
      minor: null == minor
          ? _self.minor
          : minor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
