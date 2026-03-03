// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_device_command_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientDeviceCommandValue {
  num get value;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClientDeviceCommandValue &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ClientDeviceCommandValue(value: $value)';
  }
}

/// @nodoc
class $ClientDeviceCommandValueCopyWith<$Res> {
  $ClientDeviceCommandValueCopyWith(
      ClientDeviceCommandValue _, $Res Function(ClientDeviceCommandValue) __);
}

/// Adds pattern-matching-related methods to [ClientDeviceCommandValue].
extension ClientDeviceCommandValuePatterns on ClientDeviceCommandValue {
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
    TResult Function(ClientDeviceCommandValueInt value)? fromInt,
    TResult Function(ClientDeviceCommandValueDouble value)? fromDouble,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ClientDeviceCommandValueInt() when fromInt != null:
        return fromInt(_that);
      case ClientDeviceCommandValueDouble() when fromDouble != null:
        return fromDouble(_that);
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
    required TResult Function(ClientDeviceCommandValueInt value) fromInt,
    required TResult Function(ClientDeviceCommandValueDouble value) fromDouble,
  }) {
    final _that = this;
    switch (_that) {
      case ClientDeviceCommandValueInt():
        return fromInt(_that);
      case ClientDeviceCommandValueDouble():
        return fromDouble(_that);
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
    TResult? Function(ClientDeviceCommandValueInt value)? fromInt,
    TResult? Function(ClientDeviceCommandValueDouble value)? fromDouble,
  }) {
    final _that = this;
    switch (_that) {
      case ClientDeviceCommandValueInt() when fromInt != null:
        return fromInt(_that);
      case ClientDeviceCommandValueDouble() when fromDouble != null:
        return fromDouble(_that);
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
    TResult Function(int value)? fromInt,
    TResult Function(double value)? fromDouble,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ClientDeviceCommandValueInt() when fromInt != null:
        return fromInt(_that.value);
      case ClientDeviceCommandValueDouble() when fromDouble != null:
        return fromDouble(_that.value);
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
    required TResult Function(int value) fromInt,
    required TResult Function(double value) fromDouble,
  }) {
    final _that = this;
    switch (_that) {
      case ClientDeviceCommandValueInt():
        return fromInt(_that.value);
      case ClientDeviceCommandValueDouble():
        return fromDouble(_that.value);
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
    TResult? Function(int value)? fromInt,
    TResult? Function(double value)? fromDouble,
  }) {
    final _that = this;
    switch (_that) {
      case ClientDeviceCommandValueInt() when fromInt != null:
        return fromInt(_that.value);
      case ClientDeviceCommandValueDouble() when fromDouble != null:
        return fromDouble(_that.value);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ClientDeviceCommandValueInt extends ClientDeviceCommandValue {
  const ClientDeviceCommandValueInt({required this.value}) : super._();

  @override
  final int value;

  /// Create a copy of ClientDeviceCommandValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientDeviceCommandValueIntCopyWith<ClientDeviceCommandValueInt>
      get copyWith => _$ClientDeviceCommandValueIntCopyWithImpl<
          ClientDeviceCommandValueInt>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClientDeviceCommandValueInt &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ClientDeviceCommandValue.fromInt(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ClientDeviceCommandValueIntCopyWith<$Res>
    implements $ClientDeviceCommandValueCopyWith<$Res> {
  factory $ClientDeviceCommandValueIntCopyWith(
          ClientDeviceCommandValueInt value,
          $Res Function(ClientDeviceCommandValueInt) _then) =
      _$ClientDeviceCommandValueIntCopyWithImpl;
  @useResult
  $Res call({int value});
}

/// @nodoc
class _$ClientDeviceCommandValueIntCopyWithImpl<$Res>
    implements $ClientDeviceCommandValueIntCopyWith<$Res> {
  _$ClientDeviceCommandValueIntCopyWithImpl(this._self, this._then);

  final ClientDeviceCommandValueInt _self;
  final $Res Function(ClientDeviceCommandValueInt) _then;

  /// Create a copy of ClientDeviceCommandValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ClientDeviceCommandValueInt(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ClientDeviceCommandValueDouble extends ClientDeviceCommandValue {
  const ClientDeviceCommandValueDouble({required this.value}) : super._();

  @override
  final double value;

  /// Create a copy of ClientDeviceCommandValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientDeviceCommandValueDoubleCopyWith<ClientDeviceCommandValueDouble>
      get copyWith => _$ClientDeviceCommandValueDoubleCopyWithImpl<
          ClientDeviceCommandValueDouble>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClientDeviceCommandValueDouble &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ClientDeviceCommandValue.fromDouble(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ClientDeviceCommandValueDoubleCopyWith<$Res>
    implements $ClientDeviceCommandValueCopyWith<$Res> {
  factory $ClientDeviceCommandValueDoubleCopyWith(
          ClientDeviceCommandValueDouble value,
          $Res Function(ClientDeviceCommandValueDouble) _then) =
      _$ClientDeviceCommandValueDoubleCopyWithImpl;
  @useResult
  $Res call({double value});
}

/// @nodoc
class _$ClientDeviceCommandValueDoubleCopyWithImpl<$Res>
    implements $ClientDeviceCommandValueDoubleCopyWith<$Res> {
  _$ClientDeviceCommandValueDoubleCopyWithImpl(this._self, this._then);

  final ClientDeviceCommandValueDouble _self;
  final $Res Function(ClientDeviceCommandValueDouble) _then;

  /// Create a copy of ClientDeviceCommandValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ClientDeviceCommandValueDouble(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
