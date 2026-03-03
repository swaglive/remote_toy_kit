// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_device_output_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientDeviceOutputCommand {
  ClientDeviceCommandValue get value;

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientDeviceOutputCommandCopyWith<ClientDeviceOutputCommand> get copyWith =>
      _$ClientDeviceOutputCommandCopyWithImpl<ClientDeviceOutputCommand>(
          this as ClientDeviceOutputCommand, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClientDeviceOutputCommand &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ClientDeviceOutputCommand(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ClientDeviceOutputCommandCopyWith<$Res> {
  factory $ClientDeviceOutputCommandCopyWith(ClientDeviceOutputCommand value,
          $Res Function(ClientDeviceOutputCommand) _then) =
      _$ClientDeviceOutputCommandCopyWithImpl;
  @useResult
  $Res call({ClientDeviceCommandValue value});

  $ClientDeviceCommandValueCopyWith<$Res> get value;
}

/// @nodoc
class _$ClientDeviceOutputCommandCopyWithImpl<$Res>
    implements $ClientDeviceOutputCommandCopyWith<$Res> {
  _$ClientDeviceOutputCommandCopyWithImpl(this._self, this._then);

  final ClientDeviceOutputCommand _self;
  final $Res Function(ClientDeviceOutputCommand) _then;

  /// Create a copy of ClientDeviceOutputCommand
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
              as ClientDeviceCommandValue,
    ));
  }

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientDeviceCommandValueCopyWith<$Res> get value {
    return $ClientDeviceCommandValueCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ClientDeviceOutputCommand].
extension ClientDeviceOutputCommandPatterns on ClientDeviceOutputCommand {
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
    TResult Function(ClientDeviceOutputVibrateCommand value)? vibrate,
    TResult Function(ClientDeviceOutputRotateCommand value)? rotate,
    TResult Function(ClientDeviceOutputOscillateCommand value)? oscillate,
    TResult Function(ClientDeviceOutputConstrictCommand value)? constrict,
    TResult Function(ClientDeviceOutputTemperatureCommand value)? temperature,
    TResult Function(ClientDeviceOutputLedCommand value)? led,
    TResult Function(ClientDeviceOutputPositionCommand value)? position,
    TResult Function(ClientDeviceOutputPositionWithDurationCommand value)?
        positionWithDuration,
    TResult Function(ClientDeviceOutputSprayCommand value)? spray,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ClientDeviceOutputVibrateCommand() when vibrate != null:
        return vibrate(_that);
      case ClientDeviceOutputRotateCommand() when rotate != null:
        return rotate(_that);
      case ClientDeviceOutputOscillateCommand() when oscillate != null:
        return oscillate(_that);
      case ClientDeviceOutputConstrictCommand() when constrict != null:
        return constrict(_that);
      case ClientDeviceOutputTemperatureCommand() when temperature != null:
        return temperature(_that);
      case ClientDeviceOutputLedCommand() when led != null:
        return led(_that);
      case ClientDeviceOutputPositionCommand() when position != null:
        return position(_that);
      case ClientDeviceOutputPositionWithDurationCommand()
          when positionWithDuration != null:
        return positionWithDuration(_that);
      case ClientDeviceOutputSprayCommand() when spray != null:
        return spray(_that);
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
    required TResult Function(ClientDeviceOutputVibrateCommand value) vibrate,
    required TResult Function(ClientDeviceOutputRotateCommand value) rotate,
    required TResult Function(ClientDeviceOutputOscillateCommand value)
        oscillate,
    required TResult Function(ClientDeviceOutputConstrictCommand value)
        constrict,
    required TResult Function(ClientDeviceOutputTemperatureCommand value)
        temperature,
    required TResult Function(ClientDeviceOutputLedCommand value) led,
    required TResult Function(ClientDeviceOutputPositionCommand value) position,
    required TResult Function(
            ClientDeviceOutputPositionWithDurationCommand value)
        positionWithDuration,
    required TResult Function(ClientDeviceOutputSprayCommand value) spray,
  }) {
    final _that = this;
    switch (_that) {
      case ClientDeviceOutputVibrateCommand():
        return vibrate(_that);
      case ClientDeviceOutputRotateCommand():
        return rotate(_that);
      case ClientDeviceOutputOscillateCommand():
        return oscillate(_that);
      case ClientDeviceOutputConstrictCommand():
        return constrict(_that);
      case ClientDeviceOutputTemperatureCommand():
        return temperature(_that);
      case ClientDeviceOutputLedCommand():
        return led(_that);
      case ClientDeviceOutputPositionCommand():
        return position(_that);
      case ClientDeviceOutputPositionWithDurationCommand():
        return positionWithDuration(_that);
      case ClientDeviceOutputSprayCommand():
        return spray(_that);
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
    TResult? Function(ClientDeviceOutputVibrateCommand value)? vibrate,
    TResult? Function(ClientDeviceOutputRotateCommand value)? rotate,
    TResult? Function(ClientDeviceOutputOscillateCommand value)? oscillate,
    TResult? Function(ClientDeviceOutputConstrictCommand value)? constrict,
    TResult? Function(ClientDeviceOutputTemperatureCommand value)? temperature,
    TResult? Function(ClientDeviceOutputLedCommand value)? led,
    TResult? Function(ClientDeviceOutputPositionCommand value)? position,
    TResult? Function(ClientDeviceOutputPositionWithDurationCommand value)?
        positionWithDuration,
    TResult? Function(ClientDeviceOutputSprayCommand value)? spray,
  }) {
    final _that = this;
    switch (_that) {
      case ClientDeviceOutputVibrateCommand() when vibrate != null:
        return vibrate(_that);
      case ClientDeviceOutputRotateCommand() when rotate != null:
        return rotate(_that);
      case ClientDeviceOutputOscillateCommand() when oscillate != null:
        return oscillate(_that);
      case ClientDeviceOutputConstrictCommand() when constrict != null:
        return constrict(_that);
      case ClientDeviceOutputTemperatureCommand() when temperature != null:
        return temperature(_that);
      case ClientDeviceOutputLedCommand() when led != null:
        return led(_that);
      case ClientDeviceOutputPositionCommand() when position != null:
        return position(_that);
      case ClientDeviceOutputPositionWithDurationCommand()
          when positionWithDuration != null:
        return positionWithDuration(_that);
      case ClientDeviceOutputSprayCommand() when spray != null:
        return spray(_that);
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
    TResult Function(ClientDeviceCommandValue value)? vibrate,
    TResult Function(ClientDeviceCommandValue value)? rotate,
    TResult Function(ClientDeviceCommandValue value)? oscillate,
    TResult Function(ClientDeviceCommandValue value)? constrict,
    TResult Function(ClientDeviceCommandValue value)? temperature,
    TResult Function(ClientDeviceCommandValue value)? led,
    TResult Function(ClientDeviceCommandValue value)? position,
    TResult Function(ClientDeviceCommandValue value, int duration)?
        positionWithDuration,
    TResult Function(ClientDeviceCommandValue value)? spray,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ClientDeviceOutputVibrateCommand() when vibrate != null:
        return vibrate(_that.value);
      case ClientDeviceOutputRotateCommand() when rotate != null:
        return rotate(_that.value);
      case ClientDeviceOutputOscillateCommand() when oscillate != null:
        return oscillate(_that.value);
      case ClientDeviceOutputConstrictCommand() when constrict != null:
        return constrict(_that.value);
      case ClientDeviceOutputTemperatureCommand() when temperature != null:
        return temperature(_that.value);
      case ClientDeviceOutputLedCommand() when led != null:
        return led(_that.value);
      case ClientDeviceOutputPositionCommand() when position != null:
        return position(_that.value);
      case ClientDeviceOutputPositionWithDurationCommand()
          when positionWithDuration != null:
        return positionWithDuration(_that.value, _that.duration);
      case ClientDeviceOutputSprayCommand() when spray != null:
        return spray(_that.value);
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
    required TResult Function(ClientDeviceCommandValue value) vibrate,
    required TResult Function(ClientDeviceCommandValue value) rotate,
    required TResult Function(ClientDeviceCommandValue value) oscillate,
    required TResult Function(ClientDeviceCommandValue value) constrict,
    required TResult Function(ClientDeviceCommandValue value) temperature,
    required TResult Function(ClientDeviceCommandValue value) led,
    required TResult Function(ClientDeviceCommandValue value) position,
    required TResult Function(ClientDeviceCommandValue value, int duration)
        positionWithDuration,
    required TResult Function(ClientDeviceCommandValue value) spray,
  }) {
    final _that = this;
    switch (_that) {
      case ClientDeviceOutputVibrateCommand():
        return vibrate(_that.value);
      case ClientDeviceOutputRotateCommand():
        return rotate(_that.value);
      case ClientDeviceOutputOscillateCommand():
        return oscillate(_that.value);
      case ClientDeviceOutputConstrictCommand():
        return constrict(_that.value);
      case ClientDeviceOutputTemperatureCommand():
        return temperature(_that.value);
      case ClientDeviceOutputLedCommand():
        return led(_that.value);
      case ClientDeviceOutputPositionCommand():
        return position(_that.value);
      case ClientDeviceOutputPositionWithDurationCommand():
        return positionWithDuration(_that.value, _that.duration);
      case ClientDeviceOutputSprayCommand():
        return spray(_that.value);
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
    TResult? Function(ClientDeviceCommandValue value)? vibrate,
    TResult? Function(ClientDeviceCommandValue value)? rotate,
    TResult? Function(ClientDeviceCommandValue value)? oscillate,
    TResult? Function(ClientDeviceCommandValue value)? constrict,
    TResult? Function(ClientDeviceCommandValue value)? temperature,
    TResult? Function(ClientDeviceCommandValue value)? led,
    TResult? Function(ClientDeviceCommandValue value)? position,
    TResult? Function(ClientDeviceCommandValue value, int duration)?
        positionWithDuration,
    TResult? Function(ClientDeviceCommandValue value)? spray,
  }) {
    final _that = this;
    switch (_that) {
      case ClientDeviceOutputVibrateCommand() when vibrate != null:
        return vibrate(_that.value);
      case ClientDeviceOutputRotateCommand() when rotate != null:
        return rotate(_that.value);
      case ClientDeviceOutputOscillateCommand() when oscillate != null:
        return oscillate(_that.value);
      case ClientDeviceOutputConstrictCommand() when constrict != null:
        return constrict(_that.value);
      case ClientDeviceOutputTemperatureCommand() when temperature != null:
        return temperature(_that.value);
      case ClientDeviceOutputLedCommand() when led != null:
        return led(_that.value);
      case ClientDeviceOutputPositionCommand() when position != null:
        return position(_that.value);
      case ClientDeviceOutputPositionWithDurationCommand()
          when positionWithDuration != null:
        return positionWithDuration(_that.value, _that.duration);
      case ClientDeviceOutputSprayCommand() when spray != null:
        return spray(_that.value);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ClientDeviceOutputVibrateCommand extends ClientDeviceOutputCommand {
  const ClientDeviceOutputVibrateCommand({required this.value}) : super._();

  @override
  final ClientDeviceCommandValue value;

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientDeviceOutputVibrateCommandCopyWith<ClientDeviceOutputVibrateCommand>
      get copyWith => _$ClientDeviceOutputVibrateCommandCopyWithImpl<
          ClientDeviceOutputVibrateCommand>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClientDeviceOutputVibrateCommand &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ClientDeviceOutputCommand.vibrate(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ClientDeviceOutputVibrateCommandCopyWith<$Res>
    implements $ClientDeviceOutputCommandCopyWith<$Res> {
  factory $ClientDeviceOutputVibrateCommandCopyWith(
          ClientDeviceOutputVibrateCommand value,
          $Res Function(ClientDeviceOutputVibrateCommand) _then) =
      _$ClientDeviceOutputVibrateCommandCopyWithImpl;
  @override
  @useResult
  $Res call({ClientDeviceCommandValue value});

  @override
  $ClientDeviceCommandValueCopyWith<$Res> get value;
}

/// @nodoc
class _$ClientDeviceOutputVibrateCommandCopyWithImpl<$Res>
    implements $ClientDeviceOutputVibrateCommandCopyWith<$Res> {
  _$ClientDeviceOutputVibrateCommandCopyWithImpl(this._self, this._then);

  final ClientDeviceOutputVibrateCommand _self;
  final $Res Function(ClientDeviceOutputVibrateCommand) _then;

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ClientDeviceOutputVibrateCommand(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as ClientDeviceCommandValue,
    ));
  }

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientDeviceCommandValueCopyWith<$Res> get value {
    return $ClientDeviceCommandValueCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }
}

/// @nodoc

class ClientDeviceOutputRotateCommand extends ClientDeviceOutputCommand {
  const ClientDeviceOutputRotateCommand({required this.value}) : super._();

  @override
  final ClientDeviceCommandValue value;

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientDeviceOutputRotateCommandCopyWith<ClientDeviceOutputRotateCommand>
      get copyWith => _$ClientDeviceOutputRotateCommandCopyWithImpl<
          ClientDeviceOutputRotateCommand>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClientDeviceOutputRotateCommand &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ClientDeviceOutputCommand.rotate(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ClientDeviceOutputRotateCommandCopyWith<$Res>
    implements $ClientDeviceOutputCommandCopyWith<$Res> {
  factory $ClientDeviceOutputRotateCommandCopyWith(
          ClientDeviceOutputRotateCommand value,
          $Res Function(ClientDeviceOutputRotateCommand) _then) =
      _$ClientDeviceOutputRotateCommandCopyWithImpl;
  @override
  @useResult
  $Res call({ClientDeviceCommandValue value});

  @override
  $ClientDeviceCommandValueCopyWith<$Res> get value;
}

/// @nodoc
class _$ClientDeviceOutputRotateCommandCopyWithImpl<$Res>
    implements $ClientDeviceOutputRotateCommandCopyWith<$Res> {
  _$ClientDeviceOutputRotateCommandCopyWithImpl(this._self, this._then);

  final ClientDeviceOutputRotateCommand _self;
  final $Res Function(ClientDeviceOutputRotateCommand) _then;

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ClientDeviceOutputRotateCommand(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as ClientDeviceCommandValue,
    ));
  }

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientDeviceCommandValueCopyWith<$Res> get value {
    return $ClientDeviceCommandValueCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }
}

/// @nodoc

class ClientDeviceOutputOscillateCommand extends ClientDeviceOutputCommand {
  const ClientDeviceOutputOscillateCommand({required this.value}) : super._();

  @override
  final ClientDeviceCommandValue value;

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientDeviceOutputOscillateCommandCopyWith<
          ClientDeviceOutputOscillateCommand>
      get copyWith => _$ClientDeviceOutputOscillateCommandCopyWithImpl<
          ClientDeviceOutputOscillateCommand>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClientDeviceOutputOscillateCommand &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ClientDeviceOutputCommand.oscillate(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ClientDeviceOutputOscillateCommandCopyWith<$Res>
    implements $ClientDeviceOutputCommandCopyWith<$Res> {
  factory $ClientDeviceOutputOscillateCommandCopyWith(
          ClientDeviceOutputOscillateCommand value,
          $Res Function(ClientDeviceOutputOscillateCommand) _then) =
      _$ClientDeviceOutputOscillateCommandCopyWithImpl;
  @override
  @useResult
  $Res call({ClientDeviceCommandValue value});

  @override
  $ClientDeviceCommandValueCopyWith<$Res> get value;
}

/// @nodoc
class _$ClientDeviceOutputOscillateCommandCopyWithImpl<$Res>
    implements $ClientDeviceOutputOscillateCommandCopyWith<$Res> {
  _$ClientDeviceOutputOscillateCommandCopyWithImpl(this._self, this._then);

  final ClientDeviceOutputOscillateCommand _self;
  final $Res Function(ClientDeviceOutputOscillateCommand) _then;

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ClientDeviceOutputOscillateCommand(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as ClientDeviceCommandValue,
    ));
  }

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientDeviceCommandValueCopyWith<$Res> get value {
    return $ClientDeviceCommandValueCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }
}

/// @nodoc

class ClientDeviceOutputConstrictCommand extends ClientDeviceOutputCommand {
  const ClientDeviceOutputConstrictCommand({required this.value}) : super._();

  @override
  final ClientDeviceCommandValue value;

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientDeviceOutputConstrictCommandCopyWith<
          ClientDeviceOutputConstrictCommand>
      get copyWith => _$ClientDeviceOutputConstrictCommandCopyWithImpl<
          ClientDeviceOutputConstrictCommand>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClientDeviceOutputConstrictCommand &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ClientDeviceOutputCommand.constrict(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ClientDeviceOutputConstrictCommandCopyWith<$Res>
    implements $ClientDeviceOutputCommandCopyWith<$Res> {
  factory $ClientDeviceOutputConstrictCommandCopyWith(
          ClientDeviceOutputConstrictCommand value,
          $Res Function(ClientDeviceOutputConstrictCommand) _then) =
      _$ClientDeviceOutputConstrictCommandCopyWithImpl;
  @override
  @useResult
  $Res call({ClientDeviceCommandValue value});

  @override
  $ClientDeviceCommandValueCopyWith<$Res> get value;
}

/// @nodoc
class _$ClientDeviceOutputConstrictCommandCopyWithImpl<$Res>
    implements $ClientDeviceOutputConstrictCommandCopyWith<$Res> {
  _$ClientDeviceOutputConstrictCommandCopyWithImpl(this._self, this._then);

  final ClientDeviceOutputConstrictCommand _self;
  final $Res Function(ClientDeviceOutputConstrictCommand) _then;

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ClientDeviceOutputConstrictCommand(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as ClientDeviceCommandValue,
    ));
  }

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientDeviceCommandValueCopyWith<$Res> get value {
    return $ClientDeviceCommandValueCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }
}

/// @nodoc

class ClientDeviceOutputTemperatureCommand extends ClientDeviceOutputCommand {
  const ClientDeviceOutputTemperatureCommand({required this.value}) : super._();

  @override
  final ClientDeviceCommandValue value;

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientDeviceOutputTemperatureCommandCopyWith<
          ClientDeviceOutputTemperatureCommand>
      get copyWith => _$ClientDeviceOutputTemperatureCommandCopyWithImpl<
          ClientDeviceOutputTemperatureCommand>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClientDeviceOutputTemperatureCommand &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ClientDeviceOutputCommand.temperature(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ClientDeviceOutputTemperatureCommandCopyWith<$Res>
    implements $ClientDeviceOutputCommandCopyWith<$Res> {
  factory $ClientDeviceOutputTemperatureCommandCopyWith(
          ClientDeviceOutputTemperatureCommand value,
          $Res Function(ClientDeviceOutputTemperatureCommand) _then) =
      _$ClientDeviceOutputTemperatureCommandCopyWithImpl;
  @override
  @useResult
  $Res call({ClientDeviceCommandValue value});

  @override
  $ClientDeviceCommandValueCopyWith<$Res> get value;
}

/// @nodoc
class _$ClientDeviceOutputTemperatureCommandCopyWithImpl<$Res>
    implements $ClientDeviceOutputTemperatureCommandCopyWith<$Res> {
  _$ClientDeviceOutputTemperatureCommandCopyWithImpl(this._self, this._then);

  final ClientDeviceOutputTemperatureCommand _self;
  final $Res Function(ClientDeviceOutputTemperatureCommand) _then;

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ClientDeviceOutputTemperatureCommand(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as ClientDeviceCommandValue,
    ));
  }

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientDeviceCommandValueCopyWith<$Res> get value {
    return $ClientDeviceCommandValueCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }
}

/// @nodoc

class ClientDeviceOutputLedCommand extends ClientDeviceOutputCommand {
  const ClientDeviceOutputLedCommand({required this.value}) : super._();

  @override
  final ClientDeviceCommandValue value;

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientDeviceOutputLedCommandCopyWith<ClientDeviceOutputLedCommand>
      get copyWith => _$ClientDeviceOutputLedCommandCopyWithImpl<
          ClientDeviceOutputLedCommand>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClientDeviceOutputLedCommand &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ClientDeviceOutputCommand.led(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ClientDeviceOutputLedCommandCopyWith<$Res>
    implements $ClientDeviceOutputCommandCopyWith<$Res> {
  factory $ClientDeviceOutputLedCommandCopyWith(
          ClientDeviceOutputLedCommand value,
          $Res Function(ClientDeviceOutputLedCommand) _then) =
      _$ClientDeviceOutputLedCommandCopyWithImpl;
  @override
  @useResult
  $Res call({ClientDeviceCommandValue value});

  @override
  $ClientDeviceCommandValueCopyWith<$Res> get value;
}

/// @nodoc
class _$ClientDeviceOutputLedCommandCopyWithImpl<$Res>
    implements $ClientDeviceOutputLedCommandCopyWith<$Res> {
  _$ClientDeviceOutputLedCommandCopyWithImpl(this._self, this._then);

  final ClientDeviceOutputLedCommand _self;
  final $Res Function(ClientDeviceOutputLedCommand) _then;

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ClientDeviceOutputLedCommand(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as ClientDeviceCommandValue,
    ));
  }

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientDeviceCommandValueCopyWith<$Res> get value {
    return $ClientDeviceCommandValueCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }
}

/// @nodoc

class ClientDeviceOutputPositionCommand extends ClientDeviceOutputCommand {
  const ClientDeviceOutputPositionCommand({required this.value}) : super._();

  @override
  final ClientDeviceCommandValue value;

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientDeviceOutputPositionCommandCopyWith<ClientDeviceOutputPositionCommand>
      get copyWith => _$ClientDeviceOutputPositionCommandCopyWithImpl<
          ClientDeviceOutputPositionCommand>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClientDeviceOutputPositionCommand &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ClientDeviceOutputCommand.position(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ClientDeviceOutputPositionCommandCopyWith<$Res>
    implements $ClientDeviceOutputCommandCopyWith<$Res> {
  factory $ClientDeviceOutputPositionCommandCopyWith(
          ClientDeviceOutputPositionCommand value,
          $Res Function(ClientDeviceOutputPositionCommand) _then) =
      _$ClientDeviceOutputPositionCommandCopyWithImpl;
  @override
  @useResult
  $Res call({ClientDeviceCommandValue value});

  @override
  $ClientDeviceCommandValueCopyWith<$Res> get value;
}

/// @nodoc
class _$ClientDeviceOutputPositionCommandCopyWithImpl<$Res>
    implements $ClientDeviceOutputPositionCommandCopyWith<$Res> {
  _$ClientDeviceOutputPositionCommandCopyWithImpl(this._self, this._then);

  final ClientDeviceOutputPositionCommand _self;
  final $Res Function(ClientDeviceOutputPositionCommand) _then;

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ClientDeviceOutputPositionCommand(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as ClientDeviceCommandValue,
    ));
  }

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientDeviceCommandValueCopyWith<$Res> get value {
    return $ClientDeviceCommandValueCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }
}

/// @nodoc

class ClientDeviceOutputPositionWithDurationCommand
    extends ClientDeviceOutputCommand {
  const ClientDeviceOutputPositionWithDurationCommand(
      {required this.value, required this.duration})
      : super._();

  @override
  final ClientDeviceCommandValue value;
  final int duration;

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientDeviceOutputPositionWithDurationCommandCopyWith<
          ClientDeviceOutputPositionWithDurationCommand>
      get copyWith =>
          _$ClientDeviceOutputPositionWithDurationCommandCopyWithImpl<
              ClientDeviceOutputPositionWithDurationCommand>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClientDeviceOutputPositionWithDurationCommand &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, duration);

  @override
  String toString() {
    return 'ClientDeviceOutputCommand.positionWithDuration(value: $value, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $ClientDeviceOutputPositionWithDurationCommandCopyWith<
    $Res> implements $ClientDeviceOutputCommandCopyWith<$Res> {
  factory $ClientDeviceOutputPositionWithDurationCommandCopyWith(
          ClientDeviceOutputPositionWithDurationCommand value,
          $Res Function(ClientDeviceOutputPositionWithDurationCommand) _then) =
      _$ClientDeviceOutputPositionWithDurationCommandCopyWithImpl;
  @override
  @useResult
  $Res call({ClientDeviceCommandValue value, int duration});

  @override
  $ClientDeviceCommandValueCopyWith<$Res> get value;
}

/// @nodoc
class _$ClientDeviceOutputPositionWithDurationCommandCopyWithImpl<$Res>
    implements $ClientDeviceOutputPositionWithDurationCommandCopyWith<$Res> {
  _$ClientDeviceOutputPositionWithDurationCommandCopyWithImpl(
      this._self, this._then);

  final ClientDeviceOutputPositionWithDurationCommand _self;
  final $Res Function(ClientDeviceOutputPositionWithDurationCommand) _then;

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
    Object? duration = null,
  }) {
    return _then(ClientDeviceOutputPositionWithDurationCommand(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as ClientDeviceCommandValue,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientDeviceCommandValueCopyWith<$Res> get value {
    return $ClientDeviceCommandValueCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }
}

/// @nodoc

class ClientDeviceOutputSprayCommand extends ClientDeviceOutputCommand {
  const ClientDeviceOutputSprayCommand({required this.value}) : super._();

  @override
  final ClientDeviceCommandValue value;

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientDeviceOutputSprayCommandCopyWith<ClientDeviceOutputSprayCommand>
      get copyWith => _$ClientDeviceOutputSprayCommandCopyWithImpl<
          ClientDeviceOutputSprayCommand>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClientDeviceOutputSprayCommand &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ClientDeviceOutputCommand.spray(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ClientDeviceOutputSprayCommandCopyWith<$Res>
    implements $ClientDeviceOutputCommandCopyWith<$Res> {
  factory $ClientDeviceOutputSprayCommandCopyWith(
          ClientDeviceOutputSprayCommand value,
          $Res Function(ClientDeviceOutputSprayCommand) _then) =
      _$ClientDeviceOutputSprayCommandCopyWithImpl;
  @override
  @useResult
  $Res call({ClientDeviceCommandValue value});

  @override
  $ClientDeviceCommandValueCopyWith<$Res> get value;
}

/// @nodoc
class _$ClientDeviceOutputSprayCommandCopyWithImpl<$Res>
    implements $ClientDeviceOutputSprayCommandCopyWith<$Res> {
  _$ClientDeviceOutputSprayCommandCopyWithImpl(this._self, this._then);

  final ClientDeviceOutputSprayCommand _self;
  final $Res Function(ClientDeviceOutputSprayCommand) _then;

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ClientDeviceOutputSprayCommand(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as ClientDeviceCommandValue,
    ));
  }

  /// Create a copy of ClientDeviceOutputCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientDeviceCommandValueCopyWith<$Res> get value {
    return $ClientDeviceCommandValueCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }
}

// dart format on
