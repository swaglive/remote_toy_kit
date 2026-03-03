// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bluetooth_le_specifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BluetoothLESpecifier {
  Set<String> get names;
  @JsonKey(
      readValue: _readManufacturerData,
      defaultValue: <BluetoothLEManufacturerData>[])
  List<BluetoothLEManufacturerData> get manufacturerData;
  @JsonKey(readValue: _readAdvertisedServices, defaultValue: <String>{})
  Set<BluetoothLeUuid> get advertisedServices;
  Map<BluetoothLeUuid, Map<Endpoint, BluetoothLeUuid>> get services;

  /// Create a copy of BluetoothLESpecifier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BluetoothLESpecifierCopyWith<BluetoothLESpecifier> get copyWith =>
      _$BluetoothLESpecifierCopyWithImpl<BluetoothLESpecifier>(
          this as BluetoothLESpecifier, _$identity);

  /// Serializes this BluetoothLESpecifier to a JSON map.
  Map<String, dynamic> toJson();

  @override
  String toString() {
    return 'BluetoothLESpecifier(names: $names, manufacturerData: $manufacturerData, advertisedServices: $advertisedServices, services: $services)';
  }
}

/// @nodoc
abstract mixin class $BluetoothLESpecifierCopyWith<$Res> {
  factory $BluetoothLESpecifierCopyWith(BluetoothLESpecifier value,
          $Res Function(BluetoothLESpecifier) _then) =
      _$BluetoothLESpecifierCopyWithImpl;
  @useResult
  $Res call(
      {Set<String> names,
      @JsonKey(
          readValue: _readManufacturerData,
          defaultValue: <BluetoothLEManufacturerData>[])
      List<BluetoothLEManufacturerData> manufacturerData,
      @JsonKey(readValue: _readAdvertisedServices, defaultValue: <String>{})
      Set<BluetoothLeUuid> advertisedServices,
      Map<BluetoothLeUuid, Map<Endpoint, BluetoothLeUuid>> services});
}

/// @nodoc
class _$BluetoothLESpecifierCopyWithImpl<$Res>
    implements $BluetoothLESpecifierCopyWith<$Res> {
  _$BluetoothLESpecifierCopyWithImpl(this._self, this._then);

  final BluetoothLESpecifier _self;
  final $Res Function(BluetoothLESpecifier) _then;

  /// Create a copy of BluetoothLESpecifier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? names = null,
    Object? manufacturerData = null,
    Object? advertisedServices = null,
    Object? services = null,
  }) {
    return _then(_self.copyWith(
      names: null == names
          ? _self.names
          : names // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      manufacturerData: null == manufacturerData
          ? _self.manufacturerData
          : manufacturerData // ignore: cast_nullable_to_non_nullable
              as List<BluetoothLEManufacturerData>,
      advertisedServices: null == advertisedServices
          ? _self.advertisedServices
          : advertisedServices // ignore: cast_nullable_to_non_nullable
              as Set<BluetoothLeUuid>,
      services: null == services
          ? _self.services
          : services // ignore: cast_nullable_to_non_nullable
              as Map<BluetoothLeUuid, Map<Endpoint, BluetoothLeUuid>>,
    ));
  }
}

/// Adds pattern-matching-related methods to [BluetoothLESpecifier].
extension BluetoothLESpecifierPatterns on BluetoothLESpecifier {
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
    TResult Function(_BluetoothLESpecifier value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BluetoothLESpecifier() when $default != null:
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
    TResult Function(_BluetoothLESpecifier value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BluetoothLESpecifier():
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
    TResult? Function(_BluetoothLESpecifier value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BluetoothLESpecifier() when $default != null:
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
            Set<String> names,
            @JsonKey(
                readValue: _readManufacturerData,
                defaultValue: <BluetoothLEManufacturerData>[])
            List<BluetoothLEManufacturerData> manufacturerData,
            @JsonKey(
                readValue: _readAdvertisedServices, defaultValue: <String>{})
            Set<BluetoothLeUuid> advertisedServices,
            Map<BluetoothLeUuid, Map<Endpoint, BluetoothLeUuid>> services)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BluetoothLESpecifier() when $default != null:
        return $default(_that.names, _that.manufacturerData,
            _that.advertisedServices, _that.services);
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
            Set<String> names,
            @JsonKey(
                readValue: _readManufacturerData,
                defaultValue: <BluetoothLEManufacturerData>[])
            List<BluetoothLEManufacturerData> manufacturerData,
            @JsonKey(
                readValue: _readAdvertisedServices, defaultValue: <String>{})
            Set<BluetoothLeUuid> advertisedServices,
            Map<BluetoothLeUuid, Map<Endpoint, BluetoothLeUuid>> services)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BluetoothLESpecifier():
        return $default(_that.names, _that.manufacturerData,
            _that.advertisedServices, _that.services);
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
            Set<String> names,
            @JsonKey(
                readValue: _readManufacturerData,
                defaultValue: <BluetoothLEManufacturerData>[])
            List<BluetoothLEManufacturerData> manufacturerData,
            @JsonKey(
                readValue: _readAdvertisedServices, defaultValue: <String>{})
            Set<BluetoothLeUuid> advertisedServices,
            Map<BluetoothLeUuid, Map<Endpoint, BluetoothLeUuid>> services)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BluetoothLESpecifier() when $default != null:
        return $default(_that.names, _that.manufacturerData,
            _that.advertisedServices, _that.services);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BluetoothLESpecifier extends BluetoothLESpecifier {
  const _BluetoothLESpecifier(
      {required final Set<String> names,
      @JsonKey(
          readValue: _readManufacturerData,
          defaultValue: <BluetoothLEManufacturerData>[])
      required final List<BluetoothLEManufacturerData> manufacturerData,
      @JsonKey(readValue: _readAdvertisedServices, defaultValue: <String>{})
      required final Set<BluetoothLeUuid> advertisedServices,
      required final Map<BluetoothLeUuid, Map<Endpoint, BluetoothLeUuid>>
          services})
      : _names = names,
        _manufacturerData = manufacturerData,
        _advertisedServices = advertisedServices,
        _services = services,
        super._();
  factory _BluetoothLESpecifier.fromJson(Map<String, dynamic> json) =>
      _$BluetoothLESpecifierFromJson(json);

  final Set<String> _names;
  @override
  Set<String> get names {
    if (_names is EqualUnmodifiableSetView) return _names;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_names);
  }

  final List<BluetoothLEManufacturerData> _manufacturerData;
  @override
  @JsonKey(
      readValue: _readManufacturerData,
      defaultValue: <BluetoothLEManufacturerData>[])
  List<BluetoothLEManufacturerData> get manufacturerData {
    if (_manufacturerData is EqualUnmodifiableListView)
      return _manufacturerData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_manufacturerData);
  }

  final Set<BluetoothLeUuid> _advertisedServices;
  @override
  @JsonKey(readValue: _readAdvertisedServices, defaultValue: <String>{})
  Set<BluetoothLeUuid> get advertisedServices {
    if (_advertisedServices is EqualUnmodifiableSetView)
      return _advertisedServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_advertisedServices);
  }

  final Map<BluetoothLeUuid, Map<Endpoint, BluetoothLeUuid>> _services;
  @override
  Map<BluetoothLeUuid, Map<Endpoint, BluetoothLeUuid>> get services {
    if (_services is EqualUnmodifiableMapView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_services);
  }

  /// Create a copy of BluetoothLESpecifier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BluetoothLESpecifierCopyWith<_BluetoothLESpecifier> get copyWith =>
      __$BluetoothLESpecifierCopyWithImpl<_BluetoothLESpecifier>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BluetoothLESpecifierToJson(
      this,
    );
  }

  @override
  String toString() {
    return 'BluetoothLESpecifier(names: $names, manufacturerData: $manufacturerData, advertisedServices: $advertisedServices, services: $services)';
  }
}

/// @nodoc
abstract mixin class _$BluetoothLESpecifierCopyWith<$Res>
    implements $BluetoothLESpecifierCopyWith<$Res> {
  factory _$BluetoothLESpecifierCopyWith(_BluetoothLESpecifier value,
          $Res Function(_BluetoothLESpecifier) _then) =
      __$BluetoothLESpecifierCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Set<String> names,
      @JsonKey(
          readValue: _readManufacturerData,
          defaultValue: <BluetoothLEManufacturerData>[])
      List<BluetoothLEManufacturerData> manufacturerData,
      @JsonKey(readValue: _readAdvertisedServices, defaultValue: <String>{})
      Set<BluetoothLeUuid> advertisedServices,
      Map<BluetoothLeUuid, Map<Endpoint, BluetoothLeUuid>> services});
}

/// @nodoc
class __$BluetoothLESpecifierCopyWithImpl<$Res>
    implements _$BluetoothLESpecifierCopyWith<$Res> {
  __$BluetoothLESpecifierCopyWithImpl(this._self, this._then);

  final _BluetoothLESpecifier _self;
  final $Res Function(_BluetoothLESpecifier) _then;

  /// Create a copy of BluetoothLESpecifier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? names = null,
    Object? manufacturerData = null,
    Object? advertisedServices = null,
    Object? services = null,
  }) {
    return _then(_BluetoothLESpecifier(
      names: null == names
          ? _self._names
          : names // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      manufacturerData: null == manufacturerData
          ? _self._manufacturerData
          : manufacturerData // ignore: cast_nullable_to_non_nullable
              as List<BluetoothLEManufacturerData>,
      advertisedServices: null == advertisedServices
          ? _self._advertisedServices
          : advertisedServices // ignore: cast_nullable_to_non_nullable
              as Set<BluetoothLeUuid>,
      services: null == services
          ? _self._services
          : services // ignore: cast_nullable_to_non_nullable
              as Map<BluetoothLeUuid, Map<Endpoint, BluetoothLeUuid>>,
    ));
  }
}

// dart format on
