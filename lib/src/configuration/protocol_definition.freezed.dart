// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'protocol_definition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProtocolDefinition {
  @_CommunicationJsonConverter()
  BluetoothLESpecifier? get communication;
  ProtocolAttributes get defaults;
  @JsonKey(defaultValue: <ProtocolAttributes>[])
  List<ProtocolAttributes>? get configurations;

  /// Create a copy of ProtocolDefinition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProtocolDefinitionCopyWith<ProtocolDefinition> get copyWith =>
      _$ProtocolDefinitionCopyWithImpl<ProtocolDefinition>(
          this as ProtocolDefinition, _$identity);

  /// Serializes this ProtocolDefinition to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProtocolDefinition &&
            (identical(other.communication, communication) ||
                other.communication == communication) &&
            (identical(other.defaults, defaults) ||
                other.defaults == defaults) &&
            const DeepCollectionEquality()
                .equals(other.configurations, configurations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, communication, defaults,
      const DeepCollectionEquality().hash(configurations));

  @override
  String toString() {
    return 'ProtocolDefinition(communication: $communication, defaults: $defaults, configurations: $configurations)';
  }
}

/// @nodoc
abstract mixin class $ProtocolDefinitionCopyWith<$Res> {
  factory $ProtocolDefinitionCopyWith(
          ProtocolDefinition value, $Res Function(ProtocolDefinition) _then) =
      _$ProtocolDefinitionCopyWithImpl;
  @useResult
  $Res call(
      {@_CommunicationJsonConverter() BluetoothLESpecifier? communication,
      ProtocolAttributes defaults,
      @JsonKey(defaultValue: <ProtocolAttributes>[])
      List<ProtocolAttributes>? configurations});

  $BluetoothLESpecifierCopyWith<$Res>? get communication;
  $ProtocolAttributesCopyWith<$Res> get defaults;
}

/// @nodoc
class _$ProtocolDefinitionCopyWithImpl<$Res>
    implements $ProtocolDefinitionCopyWith<$Res> {
  _$ProtocolDefinitionCopyWithImpl(this._self, this._then);

  final ProtocolDefinition _self;
  final $Res Function(ProtocolDefinition) _then;

  /// Create a copy of ProtocolDefinition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? communication = freezed,
    Object? defaults = null,
    Object? configurations = freezed,
  }) {
    return _then(_self.copyWith(
      communication: freezed == communication
          ? _self.communication
          : communication // ignore: cast_nullable_to_non_nullable
              as BluetoothLESpecifier?,
      defaults: null == defaults
          ? _self.defaults
          : defaults // ignore: cast_nullable_to_non_nullable
              as ProtocolAttributes,
      configurations: freezed == configurations
          ? _self.configurations
          : configurations // ignore: cast_nullable_to_non_nullable
              as List<ProtocolAttributes>?,
    ));
  }

  /// Create a copy of ProtocolDefinition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BluetoothLESpecifierCopyWith<$Res>? get communication {
    if (_self.communication == null) {
      return null;
    }

    return $BluetoothLESpecifierCopyWith<$Res>(_self.communication!, (value) {
      return _then(_self.copyWith(communication: value));
    });
  }

  /// Create a copy of ProtocolDefinition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProtocolAttributesCopyWith<$Res> get defaults {
    return $ProtocolAttributesCopyWith<$Res>(_self.defaults, (value) {
      return _then(_self.copyWith(defaults: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ProtocolDefinition].
extension ProtocolDefinitionPatterns on ProtocolDefinition {
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
    TResult Function(_ProtocolDefinition value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProtocolDefinition() when $default != null:
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
    TResult Function(_ProtocolDefinition value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProtocolDefinition():
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
    TResult? Function(_ProtocolDefinition value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProtocolDefinition() when $default != null:
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
            @_CommunicationJsonConverter() BluetoothLESpecifier? communication,
            ProtocolAttributes defaults,
            @JsonKey(defaultValue: <ProtocolAttributes>[])
            List<ProtocolAttributes>? configurations)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProtocolDefinition() when $default != null:
        return $default(
            _that.communication, _that.defaults, _that.configurations);
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
            @_CommunicationJsonConverter() BluetoothLESpecifier? communication,
            ProtocolAttributes defaults,
            @JsonKey(defaultValue: <ProtocolAttributes>[])
            List<ProtocolAttributes>? configurations)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProtocolDefinition():
        return $default(
            _that.communication, _that.defaults, _that.configurations);
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
            @_CommunicationJsonConverter() BluetoothLESpecifier? communication,
            ProtocolAttributes defaults,
            @JsonKey(defaultValue: <ProtocolAttributes>[])
            List<ProtocolAttributes>? configurations)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProtocolDefinition() when $default != null:
        return $default(
            _that.communication, _that.defaults, _that.configurations);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProtocolDefinition implements ProtocolDefinition {
  const _ProtocolDefinition(
      {@_CommunicationJsonConverter() this.communication,
      required this.defaults,
      @JsonKey(defaultValue: <ProtocolAttributes>[])
      final List<ProtocolAttributes>? configurations})
      : _configurations = configurations;
  factory _ProtocolDefinition.fromJson(Map<String, dynamic> json) =>
      _$ProtocolDefinitionFromJson(json);

  @override
  @_CommunicationJsonConverter()
  final BluetoothLESpecifier? communication;
  @override
  final ProtocolAttributes defaults;
  final List<ProtocolAttributes>? _configurations;
  @override
  @JsonKey(defaultValue: <ProtocolAttributes>[])
  List<ProtocolAttributes>? get configurations {
    final value = _configurations;
    if (value == null) return null;
    if (_configurations is EqualUnmodifiableListView) return _configurations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of ProtocolDefinition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProtocolDefinitionCopyWith<_ProtocolDefinition> get copyWith =>
      __$ProtocolDefinitionCopyWithImpl<_ProtocolDefinition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProtocolDefinitionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProtocolDefinition &&
            (identical(other.communication, communication) ||
                other.communication == communication) &&
            (identical(other.defaults, defaults) ||
                other.defaults == defaults) &&
            const DeepCollectionEquality()
                .equals(other._configurations, _configurations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, communication, defaults,
      const DeepCollectionEquality().hash(_configurations));

  @override
  String toString() {
    return 'ProtocolDefinition(communication: $communication, defaults: $defaults, configurations: $configurations)';
  }
}

/// @nodoc
abstract mixin class _$ProtocolDefinitionCopyWith<$Res>
    implements $ProtocolDefinitionCopyWith<$Res> {
  factory _$ProtocolDefinitionCopyWith(
          _ProtocolDefinition value, $Res Function(_ProtocolDefinition) _then) =
      __$ProtocolDefinitionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@_CommunicationJsonConverter() BluetoothLESpecifier? communication,
      ProtocolAttributes defaults,
      @JsonKey(defaultValue: <ProtocolAttributes>[])
      List<ProtocolAttributes>? configurations});

  @override
  $BluetoothLESpecifierCopyWith<$Res>? get communication;
  @override
  $ProtocolAttributesCopyWith<$Res> get defaults;
}

/// @nodoc
class __$ProtocolDefinitionCopyWithImpl<$Res>
    implements _$ProtocolDefinitionCopyWith<$Res> {
  __$ProtocolDefinitionCopyWithImpl(this._self, this._then);

  final _ProtocolDefinition _self;
  final $Res Function(_ProtocolDefinition) _then;

  /// Create a copy of ProtocolDefinition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? communication = freezed,
    Object? defaults = null,
    Object? configurations = freezed,
  }) {
    return _then(_ProtocolDefinition(
      communication: freezed == communication
          ? _self.communication
          : communication // ignore: cast_nullable_to_non_nullable
              as BluetoothLESpecifier?,
      defaults: null == defaults
          ? _self.defaults
          : defaults // ignore: cast_nullable_to_non_nullable
              as ProtocolAttributes,
      configurations: freezed == configurations
          ? _self._configurations
          : configurations // ignore: cast_nullable_to_non_nullable
              as List<ProtocolAttributes>?,
    ));
  }

  /// Create a copy of ProtocolDefinition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BluetoothLESpecifierCopyWith<$Res>? get communication {
    if (_self.communication == null) {
      return null;
    }

    return $BluetoothLESpecifierCopyWith<$Res>(_self.communication!, (value) {
      return _then(_self.copyWith(communication: value));
    });
  }

  /// Create a copy of ProtocolDefinition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProtocolAttributesCopyWith<$Res> get defaults {
    return $ProtocolAttributesCopyWith<$Res>(_self.defaults, (value) {
      return _then(_self.copyWith(defaults: value));
    });
  }
}

// dart format on
