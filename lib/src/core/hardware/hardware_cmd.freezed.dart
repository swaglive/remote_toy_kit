// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hardware_cmd.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HardwareCmd {
  Endpoint get endpoint;

  /// Create a copy of HardwareCmd
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HardwareCmdCopyWith<HardwareCmd> get copyWith =>
      _$HardwareCmdCopyWithImpl<HardwareCmd>(this as HardwareCmd, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HardwareCmd &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, endpoint);

  @override
  String toString() {
    return 'HardwareCmd(endpoint: $endpoint)';
  }
}

/// @nodoc
abstract mixin class $HardwareCmdCopyWith<$Res> {
  factory $HardwareCmdCopyWith(
          HardwareCmd value, $Res Function(HardwareCmd) _then) =
      _$HardwareCmdCopyWithImpl;
  @useResult
  $Res call({Endpoint endpoint});
}

/// @nodoc
class _$HardwareCmdCopyWithImpl<$Res> implements $HardwareCmdCopyWith<$Res> {
  _$HardwareCmdCopyWithImpl(this._self, this._then);

  final HardwareCmd _self;
  final $Res Function(HardwareCmd) _then;

  /// Create a copy of HardwareCmd
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpoint = null,
  }) {
    return _then(_self.copyWith(
      endpoint: null == endpoint
          ? _self.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as Endpoint,
    ));
  }
}

/// Adds pattern-matching-related methods to [HardwareCmd].
extension HardwareCmdPatterns on HardwareCmd {
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
    TResult Function(HardwareReadCmd value)? read,
    TResult Function(HardwareWriteCmd value)? write,
    TResult Function(HardwareSubscribeCmd value)? subscribe,
    TResult Function(HardwareUnsubscribeCmd value)? unsubscribe,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case HardwareReadCmd() when read != null:
        return read(_that);
      case HardwareWriteCmd() when write != null:
        return write(_that);
      case HardwareSubscribeCmd() when subscribe != null:
        return subscribe(_that);
      case HardwareUnsubscribeCmd() when unsubscribe != null:
        return unsubscribe(_that);
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
    required TResult Function(HardwareReadCmd value) read,
    required TResult Function(HardwareWriteCmd value) write,
    required TResult Function(HardwareSubscribeCmd value) subscribe,
    required TResult Function(HardwareUnsubscribeCmd value) unsubscribe,
  }) {
    final _that = this;
    switch (_that) {
      case HardwareReadCmd():
        return read(_that);
      case HardwareWriteCmd():
        return write(_that);
      case HardwareSubscribeCmd():
        return subscribe(_that);
      case HardwareUnsubscribeCmd():
        return unsubscribe(_that);
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
    TResult? Function(HardwareReadCmd value)? read,
    TResult? Function(HardwareWriteCmd value)? write,
    TResult? Function(HardwareSubscribeCmd value)? subscribe,
    TResult? Function(HardwareUnsubscribeCmd value)? unsubscribe,
  }) {
    final _that = this;
    switch (_that) {
      case HardwareReadCmd() when read != null:
        return read(_that);
      case HardwareWriteCmd() when write != null:
        return write(_that);
      case HardwareSubscribeCmd() when subscribe != null:
        return subscribe(_that);
      case HardwareUnsubscribeCmd() when unsubscribe != null:
        return unsubscribe(_that);
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
    TResult Function(Endpoint endpoint)? read,
    TResult Function(Endpoint endpoint, Uint8List data, bool writeWithResponse)?
        write,
    TResult Function(Endpoint endpoint)? subscribe,
    TResult Function(Endpoint endpoint)? unsubscribe,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case HardwareReadCmd() when read != null:
        return read(_that.endpoint);
      case HardwareWriteCmd() when write != null:
        return write(_that.endpoint, _that.data, _that.writeWithResponse);
      case HardwareSubscribeCmd() when subscribe != null:
        return subscribe(_that.endpoint);
      case HardwareUnsubscribeCmd() when unsubscribe != null:
        return unsubscribe(_that.endpoint);
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
    required TResult Function(Endpoint endpoint) read,
    required TResult Function(
            Endpoint endpoint, Uint8List data, bool writeWithResponse)
        write,
    required TResult Function(Endpoint endpoint) subscribe,
    required TResult Function(Endpoint endpoint) unsubscribe,
  }) {
    final _that = this;
    switch (_that) {
      case HardwareReadCmd():
        return read(_that.endpoint);
      case HardwareWriteCmd():
        return write(_that.endpoint, _that.data, _that.writeWithResponse);
      case HardwareSubscribeCmd():
        return subscribe(_that.endpoint);
      case HardwareUnsubscribeCmd():
        return unsubscribe(_that.endpoint);
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
    TResult? Function(Endpoint endpoint)? read,
    TResult? Function(
            Endpoint endpoint, Uint8List data, bool writeWithResponse)?
        write,
    TResult? Function(Endpoint endpoint)? subscribe,
    TResult? Function(Endpoint endpoint)? unsubscribe,
  }) {
    final _that = this;
    switch (_that) {
      case HardwareReadCmd() when read != null:
        return read(_that.endpoint);
      case HardwareWriteCmd() when write != null:
        return write(_that.endpoint, _that.data, _that.writeWithResponse);
      case HardwareSubscribeCmd() when subscribe != null:
        return subscribe(_that.endpoint);
      case HardwareUnsubscribeCmd() when unsubscribe != null:
        return unsubscribe(_that.endpoint);
      case _:
        return null;
    }
  }
}

/// @nodoc

class HardwareReadCmd implements HardwareCmd {
  const HardwareReadCmd({required this.endpoint});

  @override
  final Endpoint endpoint;

  /// Create a copy of HardwareCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HardwareReadCmdCopyWith<HardwareReadCmd> get copyWith =>
      _$HardwareReadCmdCopyWithImpl<HardwareReadCmd>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HardwareReadCmd &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, endpoint);

  @override
  String toString() {
    return 'HardwareCmd.read(endpoint: $endpoint)';
  }
}

/// @nodoc
abstract mixin class $HardwareReadCmdCopyWith<$Res>
    implements $HardwareCmdCopyWith<$Res> {
  factory $HardwareReadCmdCopyWith(
          HardwareReadCmd value, $Res Function(HardwareReadCmd) _then) =
      _$HardwareReadCmdCopyWithImpl;
  @override
  @useResult
  $Res call({Endpoint endpoint});
}

/// @nodoc
class _$HardwareReadCmdCopyWithImpl<$Res>
    implements $HardwareReadCmdCopyWith<$Res> {
  _$HardwareReadCmdCopyWithImpl(this._self, this._then);

  final HardwareReadCmd _self;
  final $Res Function(HardwareReadCmd) _then;

  /// Create a copy of HardwareCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? endpoint = null,
  }) {
    return _then(HardwareReadCmd(
      endpoint: null == endpoint
          ? _self.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as Endpoint,
    ));
  }
}

/// @nodoc

class HardwareWriteCmd implements HardwareCmd {
  const HardwareWriteCmd(
      {required this.endpoint,
      required this.data,
      required this.writeWithResponse});

  @override
  final Endpoint endpoint;
  final Uint8List data;
  final bool writeWithResponse;

  /// Create a copy of HardwareCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HardwareWriteCmdCopyWith<HardwareWriteCmd> get copyWith =>
      _$HardwareWriteCmdCopyWithImpl<HardwareWriteCmd>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HardwareWriteCmd &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.writeWithResponse, writeWithResponse) ||
                other.writeWithResponse == writeWithResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, endpoint,
      const DeepCollectionEquality().hash(data), writeWithResponse);

  @override
  String toString() {
    return 'HardwareCmd.write(endpoint: $endpoint, data: $data, writeWithResponse: $writeWithResponse)';
  }
}

/// @nodoc
abstract mixin class $HardwareWriteCmdCopyWith<$Res>
    implements $HardwareCmdCopyWith<$Res> {
  factory $HardwareWriteCmdCopyWith(
          HardwareWriteCmd value, $Res Function(HardwareWriteCmd) _then) =
      _$HardwareWriteCmdCopyWithImpl;
  @override
  @useResult
  $Res call({Endpoint endpoint, Uint8List data, bool writeWithResponse});
}

/// @nodoc
class _$HardwareWriteCmdCopyWithImpl<$Res>
    implements $HardwareWriteCmdCopyWith<$Res> {
  _$HardwareWriteCmdCopyWithImpl(this._self, this._then);

  final HardwareWriteCmd _self;
  final $Res Function(HardwareWriteCmd) _then;

  /// Create a copy of HardwareCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? endpoint = null,
    Object? data = null,
    Object? writeWithResponse = null,
  }) {
    return _then(HardwareWriteCmd(
      endpoint: null == endpoint
          ? _self.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as Endpoint,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      writeWithResponse: null == writeWithResponse
          ? _self.writeWithResponse
          : writeWithResponse // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class HardwareSubscribeCmd implements HardwareCmd {
  const HardwareSubscribeCmd({required this.endpoint});

  @override
  final Endpoint endpoint;

  /// Create a copy of HardwareCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HardwareSubscribeCmdCopyWith<HardwareSubscribeCmd> get copyWith =>
      _$HardwareSubscribeCmdCopyWithImpl<HardwareSubscribeCmd>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HardwareSubscribeCmd &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, endpoint);

  @override
  String toString() {
    return 'HardwareCmd.subscribe(endpoint: $endpoint)';
  }
}

/// @nodoc
abstract mixin class $HardwareSubscribeCmdCopyWith<$Res>
    implements $HardwareCmdCopyWith<$Res> {
  factory $HardwareSubscribeCmdCopyWith(HardwareSubscribeCmd value,
          $Res Function(HardwareSubscribeCmd) _then) =
      _$HardwareSubscribeCmdCopyWithImpl;
  @override
  @useResult
  $Res call({Endpoint endpoint});
}

/// @nodoc
class _$HardwareSubscribeCmdCopyWithImpl<$Res>
    implements $HardwareSubscribeCmdCopyWith<$Res> {
  _$HardwareSubscribeCmdCopyWithImpl(this._self, this._then);

  final HardwareSubscribeCmd _self;
  final $Res Function(HardwareSubscribeCmd) _then;

  /// Create a copy of HardwareCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? endpoint = null,
  }) {
    return _then(HardwareSubscribeCmd(
      endpoint: null == endpoint
          ? _self.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as Endpoint,
    ));
  }
}

/// @nodoc

class HardwareUnsubscribeCmd implements HardwareCmd {
  const HardwareUnsubscribeCmd({required this.endpoint});

  @override
  final Endpoint endpoint;

  /// Create a copy of HardwareCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HardwareUnsubscribeCmdCopyWith<HardwareUnsubscribeCmd> get copyWith =>
      _$HardwareUnsubscribeCmdCopyWithImpl<HardwareUnsubscribeCmd>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HardwareUnsubscribeCmd &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, endpoint);

  @override
  String toString() {
    return 'HardwareCmd.unsubscribe(endpoint: $endpoint)';
  }
}

/// @nodoc
abstract mixin class $HardwareUnsubscribeCmdCopyWith<$Res>
    implements $HardwareCmdCopyWith<$Res> {
  factory $HardwareUnsubscribeCmdCopyWith(HardwareUnsubscribeCmd value,
          $Res Function(HardwareUnsubscribeCmd) _then) =
      _$HardwareUnsubscribeCmdCopyWithImpl;
  @override
  @useResult
  $Res call({Endpoint endpoint});
}

/// @nodoc
class _$HardwareUnsubscribeCmdCopyWithImpl<$Res>
    implements $HardwareUnsubscribeCmdCopyWith<$Res> {
  _$HardwareUnsubscribeCmdCopyWithImpl(this._self, this._then);

  final HardwareUnsubscribeCmd _self;
  final $Res Function(HardwareUnsubscribeCmd) _then;

  /// Create a copy of HardwareCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? endpoint = null,
  }) {
    return _then(HardwareUnsubscribeCmd(
      endpoint: null == endpoint
          ? _self.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as Endpoint,
    ));
  }
}

// dart format on
