// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_configuration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceConfiguration {
  DeviceConfigurationVersion get version;
  @JsonKey(defaultValue: <ProtocolName, ProtocolDefinition>{})
  Map<ProtocolName, ProtocolDefinition> get protocols;

  /// Create a copy of DeviceConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceConfigurationCopyWith<DeviceConfiguration> get copyWith =>
      _$DeviceConfigurationCopyWithImpl<DeviceConfiguration>(
          this as DeviceConfiguration, _$identity);

  /// Serializes this DeviceConfiguration to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceConfiguration &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other.protocols, protocols));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, version, const DeepCollectionEquality().hash(protocols));

  @override
  String toString() {
    return 'DeviceConfiguration(version: $version, protocols: $protocols)';
  }
}

/// @nodoc
abstract mixin class $DeviceConfigurationCopyWith<$Res> {
  factory $DeviceConfigurationCopyWith(
          DeviceConfiguration value, $Res Function(DeviceConfiguration) _then) =
      _$DeviceConfigurationCopyWithImpl;
  @useResult
  $Res call(
      {DeviceConfigurationVersion version,
      @JsonKey(defaultValue: <ProtocolName, ProtocolDefinition>{})
      Map<ProtocolName, ProtocolDefinition> protocols});

  $DeviceConfigurationVersionCopyWith<$Res> get version;
}

/// @nodoc
class _$DeviceConfigurationCopyWithImpl<$Res>
    implements $DeviceConfigurationCopyWith<$Res> {
  _$DeviceConfigurationCopyWithImpl(this._self, this._then);

  final DeviceConfiguration _self;
  final $Res Function(DeviceConfiguration) _then;

  /// Create a copy of DeviceConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? protocols = null,
  }) {
    return _then(_self.copyWith(
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as DeviceConfigurationVersion,
      protocols: null == protocols
          ? _self.protocols
          : protocols // ignore: cast_nullable_to_non_nullable
              as Map<ProtocolName, ProtocolDefinition>,
    ));
  }

  /// Create a copy of DeviceConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceConfigurationVersionCopyWith<$Res> get version {
    return $DeviceConfigurationVersionCopyWith<$Res>(_self.version, (value) {
      return _then(_self.copyWith(version: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DeviceConfiguration].
extension DeviceConfigurationPatterns on DeviceConfiguration {
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
    TResult Function(_DeviceConfiguration value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceConfiguration() when $default != null:
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
    TResult Function(_DeviceConfiguration value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceConfiguration():
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
    TResult? Function(_DeviceConfiguration value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceConfiguration() when $default != null:
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
            DeviceConfigurationVersion version,
            @JsonKey(defaultValue: <ProtocolName, ProtocolDefinition>{})
            Map<ProtocolName, ProtocolDefinition> protocols)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceConfiguration() when $default != null:
        return $default(_that.version, _that.protocols);
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
            DeviceConfigurationVersion version,
            @JsonKey(defaultValue: <ProtocolName, ProtocolDefinition>{})
            Map<ProtocolName, ProtocolDefinition> protocols)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceConfiguration():
        return $default(_that.version, _that.protocols);
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
            DeviceConfigurationVersion version,
            @JsonKey(defaultValue: <ProtocolName, ProtocolDefinition>{})
            Map<ProtocolName, ProtocolDefinition> protocols)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceConfiguration() when $default != null:
        return $default(_that.version, _that.protocols);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeviceConfiguration extends DeviceConfiguration {
  const _DeviceConfiguration(
      {required this.version,
      @JsonKey(defaultValue: <ProtocolName, ProtocolDefinition>{})
      required final Map<ProtocolName, ProtocolDefinition> protocols})
      : _protocols = protocols,
        super._();
  factory _DeviceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DeviceConfigurationFromJson(json);

  @override
  final DeviceConfigurationVersion version;
  final Map<ProtocolName, ProtocolDefinition> _protocols;
  @override
  @JsonKey(defaultValue: <ProtocolName, ProtocolDefinition>{})
  Map<ProtocolName, ProtocolDefinition> get protocols {
    if (_protocols is EqualUnmodifiableMapView) return _protocols;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_protocols);
  }

  /// Create a copy of DeviceConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeviceConfigurationCopyWith<_DeviceConfiguration> get copyWith =>
      __$DeviceConfigurationCopyWithImpl<_DeviceConfiguration>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeviceConfigurationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceConfiguration &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality()
                .equals(other._protocols, _protocols));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, version, const DeepCollectionEquality().hash(_protocols));

  @override
  String toString() {
    return 'DeviceConfiguration(version: $version, protocols: $protocols)';
  }
}

/// @nodoc
abstract mixin class _$DeviceConfigurationCopyWith<$Res>
    implements $DeviceConfigurationCopyWith<$Res> {
  factory _$DeviceConfigurationCopyWith(_DeviceConfiguration value,
          $Res Function(_DeviceConfiguration) _then) =
      __$DeviceConfigurationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DeviceConfigurationVersion version,
      @JsonKey(defaultValue: <ProtocolName, ProtocolDefinition>{})
      Map<ProtocolName, ProtocolDefinition> protocols});

  @override
  $DeviceConfigurationVersionCopyWith<$Res> get version;
}

/// @nodoc
class __$DeviceConfigurationCopyWithImpl<$Res>
    implements _$DeviceConfigurationCopyWith<$Res> {
  __$DeviceConfigurationCopyWithImpl(this._self, this._then);

  final _DeviceConfiguration _self;
  final $Res Function(_DeviceConfiguration) _then;

  /// Create a copy of DeviceConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? version = null,
    Object? protocols = null,
  }) {
    return _then(_DeviceConfiguration(
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as DeviceConfigurationVersion,
      protocols: null == protocols
          ? _self._protocols
          : protocols // ignore: cast_nullable_to_non_nullable
              as Map<ProtocolName, ProtocolDefinition>,
    ));
  }

  /// Create a copy of DeviceConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceConfigurationVersionCopyWith<$Res> get version {
    return $DeviceConfigurationVersionCopyWith<$Res>(_self.version, (value) {
      return _then(_self.copyWith(version: value));
    });
  }
}

// dart format on
