// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'protocol_attributes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProtocolAttributes {
  String? get id;
  List<String>? get identifier;
  String get name;
  List<DeviceFeature>? get features;

  /// Create a copy of ProtocolAttributes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProtocolAttributesCopyWith<ProtocolAttributes> get copyWith =>
      _$ProtocolAttributesCopyWithImpl<ProtocolAttributes>(
          this as ProtocolAttributes, _$identity);

  /// Serializes this ProtocolAttributes to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProtocolAttributes &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.identifier, identifier) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.features, features));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(identifier),
      name,
      const DeepCollectionEquality().hash(features));

  @override
  String toString() {
    return 'ProtocolAttributes(id: $id, identifier: $identifier, name: $name, features: $features)';
  }
}

/// @nodoc
abstract mixin class $ProtocolAttributesCopyWith<$Res> {
  factory $ProtocolAttributesCopyWith(
          ProtocolAttributes value, $Res Function(ProtocolAttributes) _then) =
      _$ProtocolAttributesCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      List<String>? identifier,
      String name,
      List<DeviceFeature>? features});
}

/// @nodoc
class _$ProtocolAttributesCopyWithImpl<$Res>
    implements $ProtocolAttributesCopyWith<$Res> {
  _$ProtocolAttributesCopyWithImpl(this._self, this._then);

  final ProtocolAttributes _self;
  final $Res Function(ProtocolAttributes) _then;

  /// Create a copy of ProtocolAttributes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
    Object? name = null,
    Object? features = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _self.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      features: freezed == features
          ? _self.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<DeviceFeature>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProtocolAttributes].
extension ProtocolAttributesPatterns on ProtocolAttributes {
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
    TResult Function(_ProtocolAttributes value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProtocolAttributes() when $default != null:
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
    TResult Function(_ProtocolAttributes value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProtocolAttributes():
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
    TResult? Function(_ProtocolAttributes value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProtocolAttributes() when $default != null:
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
    TResult Function(String? id, List<String>? identifier, String name,
            List<DeviceFeature>? features)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProtocolAttributes() when $default != null:
        return $default(_that.id, _that.identifier, _that.name, _that.features);
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
    TResult Function(String? id, List<String>? identifier, String name,
            List<DeviceFeature>? features)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProtocolAttributes():
        return $default(_that.id, _that.identifier, _that.name, _that.features);
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
    TResult? Function(String? id, List<String>? identifier, String name,
            List<DeviceFeature>? features)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProtocolAttributes() when $default != null:
        return $default(_that.id, _that.identifier, _that.name, _that.features);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProtocolAttributes extends ProtocolAttributes {
  const _ProtocolAttributes(
      {this.id,
      final List<String>? identifier,
      required this.name,
      final List<DeviceFeature>? features})
      : _identifier = identifier,
        _features = features,
        super._();
  factory _ProtocolAttributes.fromJson(Map<String, dynamic> json) =>
      _$ProtocolAttributesFromJson(json);

  @override
  final String? id;
  final List<String>? _identifier;
  @override
  List<String>? get identifier {
    final value = _identifier;
    if (value == null) return null;
    if (_identifier is EqualUnmodifiableListView) return _identifier;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String name;
  final List<DeviceFeature>? _features;
  @override
  List<DeviceFeature>? get features {
    final value = _features;
    if (value == null) return null;
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of ProtocolAttributes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProtocolAttributesCopyWith<_ProtocolAttributes> get copyWith =>
      __$ProtocolAttributesCopyWithImpl<_ProtocolAttributes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProtocolAttributesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProtocolAttributes &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._identifier, _identifier) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_identifier),
      name,
      const DeepCollectionEquality().hash(_features));

  @override
  String toString() {
    return 'ProtocolAttributes(id: $id, identifier: $identifier, name: $name, features: $features)';
  }
}

/// @nodoc
abstract mixin class _$ProtocolAttributesCopyWith<$Res>
    implements $ProtocolAttributesCopyWith<$Res> {
  factory _$ProtocolAttributesCopyWith(
          _ProtocolAttributes value, $Res Function(_ProtocolAttributes) _then) =
      __$ProtocolAttributesCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      List<String>? identifier,
      String name,
      List<DeviceFeature>? features});
}

/// @nodoc
class __$ProtocolAttributesCopyWithImpl<$Res>
    implements _$ProtocolAttributesCopyWith<$Res> {
  __$ProtocolAttributesCopyWithImpl(this._self, this._then);

  final _ProtocolAttributes _self;
  final $Res Function(_ProtocolAttributes) _then;

  /// Create a copy of ProtocolAttributes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
    Object? name = null,
    Object? features = freezed,
  }) {
    return _then(_ProtocolAttributes(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _self._identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      features: freezed == features
          ? _self._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<DeviceFeature>?,
    ));
  }
}

// dart format on
