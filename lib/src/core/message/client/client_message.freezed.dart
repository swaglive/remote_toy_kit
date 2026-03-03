// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
RemoteToyClientMessage _$RemoteToyClientMessageFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'stopDeviceCmd':
      return StopDeviceCmdClientMessage.fromJson(json);
    case 'stopAllDevices':
      return StopAllDevicesClientMessage.fromJson(json);
    case 'scalarCmd':
      return ScalarCmdClientMessage.fromJson(json);
    case 'linearCmd':
      return LinearCmdClientMessage.fromJson(json);
    case 'rotateCmd':
      return RotateCmdClientMessage.fromJson(json);
    case 'sensorReadCmd':
      return SensorReadCmdClientMessage.fromJson(json);
    case 'sensorSubscribeCmd':
      return SensorSubscribeCmdClientMessage.fromJson(json);
    case 'sensorUnsubscrubeCmd':
      return SensorUnsubscribeCmdClientMessage.fromJson(json);
    case 'inputCmd':
      return InputCmdClientMessage.fromJson(json);
    case 'outputCmd':
      return OutputCmdClientMessage.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'RemoteToyClientMessage',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$RemoteToyClientMessage {
  /// Serializes this RemoteToyClientMessage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RemoteToyClientMessage);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RemoteToyClientMessage()';
  }
}

/// @nodoc
class $RemoteToyClientMessageCopyWith<$Res> {
  $RemoteToyClientMessageCopyWith(
      RemoteToyClientMessage _, $Res Function(RemoteToyClientMessage) __);
}

/// Adds pattern-matching-related methods to [RemoteToyClientMessage].
extension RemoteToyClientMessagePatterns on RemoteToyClientMessage {
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
    TResult Function(StopDeviceCmdClientMessage value)? stopDeviceCmd,
    TResult Function(StopAllDevicesClientMessage value)? stopAllDevices,
    TResult Function(ScalarCmdClientMessage value)? scalarCmd,
    TResult Function(LinearCmdClientMessage value)? linearCmd,
    TResult Function(RotateCmdClientMessage value)? rotateCmd,
    TResult Function(SensorReadCmdClientMessage value)? sensorReadCmd,
    TResult Function(SensorSubscribeCmdClientMessage value)? sensorSubscribeCmd,
    TResult Function(SensorUnsubscribeCmdClientMessage value)?
        sensorUnsubscrubeCmd,
    TResult Function(InputCmdClientMessage value)? inputCmd,
    TResult Function(OutputCmdClientMessage value)? outputCmd,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case StopDeviceCmdClientMessage() when stopDeviceCmd != null:
        return stopDeviceCmd(_that);
      case StopAllDevicesClientMessage() when stopAllDevices != null:
        return stopAllDevices(_that);
      case ScalarCmdClientMessage() when scalarCmd != null:
        return scalarCmd(_that);
      case LinearCmdClientMessage() when linearCmd != null:
        return linearCmd(_that);
      case RotateCmdClientMessage() when rotateCmd != null:
        return rotateCmd(_that);
      case SensorReadCmdClientMessage() when sensorReadCmd != null:
        return sensorReadCmd(_that);
      case SensorSubscribeCmdClientMessage() when sensorSubscribeCmd != null:
        return sensorSubscribeCmd(_that);
      case SensorUnsubscribeCmdClientMessage()
          when sensorUnsubscrubeCmd != null:
        return sensorUnsubscrubeCmd(_that);
      case InputCmdClientMessage() when inputCmd != null:
        return inputCmd(_that);
      case OutputCmdClientMessage() when outputCmd != null:
        return outputCmd(_that);
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
    required TResult Function(StopDeviceCmdClientMessage value) stopDeviceCmd,
    required TResult Function(StopAllDevicesClientMessage value) stopAllDevices,
    required TResult Function(ScalarCmdClientMessage value) scalarCmd,
    required TResult Function(LinearCmdClientMessage value) linearCmd,
    required TResult Function(RotateCmdClientMessage value) rotateCmd,
    required TResult Function(SensorReadCmdClientMessage value) sensorReadCmd,
    required TResult Function(SensorSubscribeCmdClientMessage value)
        sensorSubscribeCmd,
    required TResult Function(SensorUnsubscribeCmdClientMessage value)
        sensorUnsubscrubeCmd,
    required TResult Function(InputCmdClientMessage value) inputCmd,
    required TResult Function(OutputCmdClientMessage value) outputCmd,
  }) {
    final _that = this;
    switch (_that) {
      case StopDeviceCmdClientMessage():
        return stopDeviceCmd(_that);
      case StopAllDevicesClientMessage():
        return stopAllDevices(_that);
      case ScalarCmdClientMessage():
        return scalarCmd(_that);
      case LinearCmdClientMessage():
        return linearCmd(_that);
      case RotateCmdClientMessage():
        return rotateCmd(_that);
      case SensorReadCmdClientMessage():
        return sensorReadCmd(_that);
      case SensorSubscribeCmdClientMessage():
        return sensorSubscribeCmd(_that);
      case SensorUnsubscribeCmdClientMessage():
        return sensorUnsubscrubeCmd(_that);
      case InputCmdClientMessage():
        return inputCmd(_that);
      case OutputCmdClientMessage():
        return outputCmd(_that);
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
    TResult? Function(StopDeviceCmdClientMessage value)? stopDeviceCmd,
    TResult? Function(StopAllDevicesClientMessage value)? stopAllDevices,
    TResult? Function(ScalarCmdClientMessage value)? scalarCmd,
    TResult? Function(LinearCmdClientMessage value)? linearCmd,
    TResult? Function(RotateCmdClientMessage value)? rotateCmd,
    TResult? Function(SensorReadCmdClientMessage value)? sensorReadCmd,
    TResult? Function(SensorSubscribeCmdClientMessage value)?
        sensorSubscribeCmd,
    TResult? Function(SensorUnsubscribeCmdClientMessage value)?
        sensorUnsubscrubeCmd,
    TResult? Function(InputCmdClientMessage value)? inputCmd,
    TResult? Function(OutputCmdClientMessage value)? outputCmd,
  }) {
    final _that = this;
    switch (_that) {
      case StopDeviceCmdClientMessage() when stopDeviceCmd != null:
        return stopDeviceCmd(_that);
      case StopAllDevicesClientMessage() when stopAllDevices != null:
        return stopAllDevices(_that);
      case ScalarCmdClientMessage() when scalarCmd != null:
        return scalarCmd(_that);
      case LinearCmdClientMessage() when linearCmd != null:
        return linearCmd(_that);
      case RotateCmdClientMessage() when rotateCmd != null:
        return rotateCmd(_that);
      case SensorReadCmdClientMessage() when sensorReadCmd != null:
        return sensorReadCmd(_that);
      case SensorSubscribeCmdClientMessage() when sensorSubscribeCmd != null:
        return sensorSubscribeCmd(_that);
      case SensorUnsubscribeCmdClientMessage()
          when sensorUnsubscrubeCmd != null:
        return sensorUnsubscrubeCmd(_that);
      case InputCmdClientMessage() when inputCmd != null:
        return inputCmd(_that);
      case OutputCmdClientMessage() when outputCmd != null:
        return outputCmd(_that);
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
    TResult Function()? stopDeviceCmd,
    TResult Function()? stopAllDevices,
    TResult Function(List<ScalarSubcommand> scalars)? scalarCmd,
    TResult Function(List<VectorSubcommand> vectors)? linearCmd,
    TResult Function(List<RotationSubcommand> rotations)? rotateCmd,
    TResult Function(int featureIndex, InputType inputType)? sensorReadCmd,
    TResult Function(int featureIndex, InputType inputType)? sensorSubscribeCmd,
    TResult Function(int featureIndex, InputType inputType)?
        sensorUnsubscrubeCmd,
    TResult Function(InputCmd command)? inputCmd,
    TResult Function(OutputCmd command)? outputCmd,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case StopDeviceCmdClientMessage() when stopDeviceCmd != null:
        return stopDeviceCmd();
      case StopAllDevicesClientMessage() when stopAllDevices != null:
        return stopAllDevices();
      case ScalarCmdClientMessage() when scalarCmd != null:
        return scalarCmd(_that.scalars);
      case LinearCmdClientMessage() when linearCmd != null:
        return linearCmd(_that.vectors);
      case RotateCmdClientMessage() when rotateCmd != null:
        return rotateCmd(_that.rotations);
      case SensorReadCmdClientMessage() when sensorReadCmd != null:
        return sensorReadCmd(_that.featureIndex, _that.inputType);
      case SensorSubscribeCmdClientMessage() when sensorSubscribeCmd != null:
        return sensorSubscribeCmd(_that.featureIndex, _that.inputType);
      case SensorUnsubscribeCmdClientMessage()
          when sensorUnsubscrubeCmd != null:
        return sensorUnsubscrubeCmd(_that.featureIndex, _that.inputType);
      case InputCmdClientMessage() when inputCmd != null:
        return inputCmd(_that.command);
      case OutputCmdClientMessage() when outputCmd != null:
        return outputCmd(_that.command);
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
    required TResult Function() stopDeviceCmd,
    required TResult Function() stopAllDevices,
    required TResult Function(List<ScalarSubcommand> scalars) scalarCmd,
    required TResult Function(List<VectorSubcommand> vectors) linearCmd,
    required TResult Function(List<RotationSubcommand> rotations) rotateCmd,
    required TResult Function(int featureIndex, InputType inputType)
        sensorReadCmd,
    required TResult Function(int featureIndex, InputType inputType)
        sensorSubscribeCmd,
    required TResult Function(int featureIndex, InputType inputType)
        sensorUnsubscrubeCmd,
    required TResult Function(InputCmd command) inputCmd,
    required TResult Function(OutputCmd command) outputCmd,
  }) {
    final _that = this;
    switch (_that) {
      case StopDeviceCmdClientMessage():
        return stopDeviceCmd();
      case StopAllDevicesClientMessage():
        return stopAllDevices();
      case ScalarCmdClientMessage():
        return scalarCmd(_that.scalars);
      case LinearCmdClientMessage():
        return linearCmd(_that.vectors);
      case RotateCmdClientMessage():
        return rotateCmd(_that.rotations);
      case SensorReadCmdClientMessage():
        return sensorReadCmd(_that.featureIndex, _that.inputType);
      case SensorSubscribeCmdClientMessage():
        return sensorSubscribeCmd(_that.featureIndex, _that.inputType);
      case SensorUnsubscribeCmdClientMessage():
        return sensorUnsubscrubeCmd(_that.featureIndex, _that.inputType);
      case InputCmdClientMessage():
        return inputCmd(_that.command);
      case OutputCmdClientMessage():
        return outputCmd(_that.command);
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
    TResult? Function()? stopDeviceCmd,
    TResult? Function()? stopAllDevices,
    TResult? Function(List<ScalarSubcommand> scalars)? scalarCmd,
    TResult? Function(List<VectorSubcommand> vectors)? linearCmd,
    TResult? Function(List<RotationSubcommand> rotations)? rotateCmd,
    TResult? Function(int featureIndex, InputType inputType)? sensorReadCmd,
    TResult? Function(int featureIndex, InputType inputType)?
        sensorSubscribeCmd,
    TResult? Function(int featureIndex, InputType inputType)?
        sensorUnsubscrubeCmd,
    TResult? Function(InputCmd command)? inputCmd,
    TResult? Function(OutputCmd command)? outputCmd,
  }) {
    final _that = this;
    switch (_that) {
      case StopDeviceCmdClientMessage() when stopDeviceCmd != null:
        return stopDeviceCmd();
      case StopAllDevicesClientMessage() when stopAllDevices != null:
        return stopAllDevices();
      case ScalarCmdClientMessage() when scalarCmd != null:
        return scalarCmd(_that.scalars);
      case LinearCmdClientMessage() when linearCmd != null:
        return linearCmd(_that.vectors);
      case RotateCmdClientMessage() when rotateCmd != null:
        return rotateCmd(_that.rotations);
      case SensorReadCmdClientMessage() when sensorReadCmd != null:
        return sensorReadCmd(_that.featureIndex, _that.inputType);
      case SensorSubscribeCmdClientMessage() when sensorSubscribeCmd != null:
        return sensorSubscribeCmd(_that.featureIndex, _that.inputType);
      case SensorUnsubscribeCmdClientMessage()
          when sensorUnsubscrubeCmd != null:
        return sensorUnsubscrubeCmd(_that.featureIndex, _that.inputType);
      case InputCmdClientMessage() when inputCmd != null:
        return inputCmd(_that.command);
      case OutputCmdClientMessage() when outputCmd != null:
        return outputCmd(_that.command);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class StopDeviceCmdClientMessage extends RemoteToyClientMessage {
  const StopDeviceCmdClientMessage({final String? $type})
      : $type = $type ?? 'stopDeviceCmd',
        super._();
  factory StopDeviceCmdClientMessage.fromJson(Map<String, dynamic> json) =>
      _$StopDeviceCmdClientMessageFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$StopDeviceCmdClientMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StopDeviceCmdClientMessage);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RemoteToyClientMessage.stopDeviceCmd()';
  }
}

/// @nodoc
class $StopDeviceCmdClientMessageCopyWith<$Res>
    implements $RemoteToyClientMessageCopyWith<$Res> {
  $StopDeviceCmdClientMessageCopyWith(StopDeviceCmdClientMessage _,
      $Res Function(StopDeviceCmdClientMessage) __);
}

/// @nodoc
class _$StopDeviceCmdClientMessageCopyWithImpl<$Res>
    implements $StopDeviceCmdClientMessageCopyWith<$Res> {
  _$StopDeviceCmdClientMessageCopyWithImpl(this._self, this._then);

  final StopDeviceCmdClientMessage _self;
  final $Res Function(StopDeviceCmdClientMessage) _then;
}

/// @nodoc
@JsonSerializable()
class StopAllDevicesClientMessage extends RemoteToyClientMessage {
  const StopAllDevicesClientMessage({final String? $type})
      : $type = $type ?? 'stopAllDevices',
        super._();
  factory StopAllDevicesClientMessage.fromJson(Map<String, dynamic> json) =>
      _$StopAllDevicesClientMessageFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$StopAllDevicesClientMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StopAllDevicesClientMessage);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RemoteToyClientMessage.stopAllDevices()';
  }
}

/// @nodoc
class $StopAllDevicesClientMessageCopyWith<$Res>
    implements $RemoteToyClientMessageCopyWith<$Res> {
  $StopAllDevicesClientMessageCopyWith(StopAllDevicesClientMessage _,
      $Res Function(StopAllDevicesClientMessage) __);
}

/// @nodoc
class _$StopAllDevicesClientMessageCopyWithImpl<$Res>
    implements $StopAllDevicesClientMessageCopyWith<$Res> {
  _$StopAllDevicesClientMessageCopyWithImpl(this._self, this._then);

  final StopAllDevicesClientMessage _self;
  final $Res Function(StopAllDevicesClientMessage) _then;
}

/// @nodoc
@JsonSerializable()
@Deprecated('Will be deprecated after spec 4.0 is fully released')
class ScalarCmdClientMessage extends RemoteToyClientMessage {
  const ScalarCmdClientMessage(
      {required final List<ScalarSubcommand> scalars, final String? $type})
      : _scalars = scalars,
        $type = $type ?? 'scalarCmd',
        super._();
  factory ScalarCmdClientMessage.fromJson(Map<String, dynamic> json) =>
      _$ScalarCmdClientMessageFromJson(json);

  final List<ScalarSubcommand> _scalars;
  List<ScalarSubcommand> get scalars {
    if (_scalars is EqualUnmodifiableListView) return _scalars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scalars);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of RemoteToyClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScalarCmdClientMessageCopyWith<ScalarCmdClientMessage> get copyWith =>
      _$ScalarCmdClientMessageCopyWithImpl<ScalarCmdClientMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ScalarCmdClientMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScalarCmdClientMessage &&
            const DeepCollectionEquality().equals(other._scalars, _scalars));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_scalars));

  @override
  String toString() {
    return 'RemoteToyClientMessage.scalarCmd(scalars: $scalars)';
  }
}

/// @nodoc
abstract mixin class $ScalarCmdClientMessageCopyWith<$Res>
    implements $RemoteToyClientMessageCopyWith<$Res> {
  factory $ScalarCmdClientMessageCopyWith(ScalarCmdClientMessage value,
          $Res Function(ScalarCmdClientMessage) _then) =
      _$ScalarCmdClientMessageCopyWithImpl;
  @useResult
  $Res call({List<ScalarSubcommand> scalars});
}

/// @nodoc
class _$ScalarCmdClientMessageCopyWithImpl<$Res>
    implements $ScalarCmdClientMessageCopyWith<$Res> {
  _$ScalarCmdClientMessageCopyWithImpl(this._self, this._then);

  final ScalarCmdClientMessage _self;
  final $Res Function(ScalarCmdClientMessage) _then;

  /// Create a copy of RemoteToyClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? scalars = null,
  }) {
    return _then(ScalarCmdClientMessage(
      scalars: null == scalars
          ? _self._scalars
          : scalars // ignore: cast_nullable_to_non_nullable
              as List<ScalarSubcommand>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Deprecated('Will be deprecated after spec 4.0 is fully released')
class LinearCmdClientMessage extends RemoteToyClientMessage {
  const LinearCmdClientMessage(
      {required final List<VectorSubcommand> vectors, final String? $type})
      : _vectors = vectors,
        $type = $type ?? 'linearCmd',
        super._();
  factory LinearCmdClientMessage.fromJson(Map<String, dynamic> json) =>
      _$LinearCmdClientMessageFromJson(json);

  final List<VectorSubcommand> _vectors;
  List<VectorSubcommand> get vectors {
    if (_vectors is EqualUnmodifiableListView) return _vectors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vectors);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of RemoteToyClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LinearCmdClientMessageCopyWith<LinearCmdClientMessage> get copyWith =>
      _$LinearCmdClientMessageCopyWithImpl<LinearCmdClientMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LinearCmdClientMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LinearCmdClientMessage &&
            const DeepCollectionEquality().equals(other._vectors, _vectors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_vectors));

  @override
  String toString() {
    return 'RemoteToyClientMessage.linearCmd(vectors: $vectors)';
  }
}

/// @nodoc
abstract mixin class $LinearCmdClientMessageCopyWith<$Res>
    implements $RemoteToyClientMessageCopyWith<$Res> {
  factory $LinearCmdClientMessageCopyWith(LinearCmdClientMessage value,
          $Res Function(LinearCmdClientMessage) _then) =
      _$LinearCmdClientMessageCopyWithImpl;
  @useResult
  $Res call({List<VectorSubcommand> vectors});
}

/// @nodoc
class _$LinearCmdClientMessageCopyWithImpl<$Res>
    implements $LinearCmdClientMessageCopyWith<$Res> {
  _$LinearCmdClientMessageCopyWithImpl(this._self, this._then);

  final LinearCmdClientMessage _self;
  final $Res Function(LinearCmdClientMessage) _then;

  /// Create a copy of RemoteToyClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vectors = null,
  }) {
    return _then(LinearCmdClientMessage(
      vectors: null == vectors
          ? _self._vectors
          : vectors // ignore: cast_nullable_to_non_nullable
              as List<VectorSubcommand>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Deprecated('Will be deprecated after spec 4.0 is fully released')
class RotateCmdClientMessage extends RemoteToyClientMessage {
  const RotateCmdClientMessage(
      {required final List<RotationSubcommand> rotations, final String? $type})
      : _rotations = rotations,
        $type = $type ?? 'rotateCmd',
        super._();
  factory RotateCmdClientMessage.fromJson(Map<String, dynamic> json) =>
      _$RotateCmdClientMessageFromJson(json);

  final List<RotationSubcommand> _rotations;
  List<RotationSubcommand> get rotations {
    if (_rotations is EqualUnmodifiableListView) return _rotations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rotations);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of RemoteToyClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RotateCmdClientMessageCopyWith<RotateCmdClientMessage> get copyWith =>
      _$RotateCmdClientMessageCopyWithImpl<RotateCmdClientMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RotateCmdClientMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RotateCmdClientMessage &&
            const DeepCollectionEquality()
                .equals(other._rotations, _rotations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rotations));

  @override
  String toString() {
    return 'RemoteToyClientMessage.rotateCmd(rotations: $rotations)';
  }
}

/// @nodoc
abstract mixin class $RotateCmdClientMessageCopyWith<$Res>
    implements $RemoteToyClientMessageCopyWith<$Res> {
  factory $RotateCmdClientMessageCopyWith(RotateCmdClientMessage value,
          $Res Function(RotateCmdClientMessage) _then) =
      _$RotateCmdClientMessageCopyWithImpl;
  @useResult
  $Res call({List<RotationSubcommand> rotations});
}

/// @nodoc
class _$RotateCmdClientMessageCopyWithImpl<$Res>
    implements $RotateCmdClientMessageCopyWith<$Res> {
  _$RotateCmdClientMessageCopyWithImpl(this._self, this._then);

  final RotateCmdClientMessage _self;
  final $Res Function(RotateCmdClientMessage) _then;

  /// Create a copy of RemoteToyClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? rotations = null,
  }) {
    return _then(RotateCmdClientMessage(
      rotations: null == rotations
          ? _self._rotations
          : rotations // ignore: cast_nullable_to_non_nullable
              as List<RotationSubcommand>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Deprecated('Will be deprecated after spec 4.0 is fully released')
class SensorReadCmdClientMessage extends RemoteToyClientMessage {
  const SensorReadCmdClientMessage(
      {required this.featureIndex,
      required this.inputType,
      final String? $type})
      : $type = $type ?? 'sensorReadCmd',
        super._();
  factory SensorReadCmdClientMessage.fromJson(Map<String, dynamic> json) =>
      _$SensorReadCmdClientMessageFromJson(json);

  final int featureIndex;
  final InputType inputType;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of RemoteToyClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SensorReadCmdClientMessageCopyWith<SensorReadCmdClientMessage>
      get copyWith =>
          _$SensorReadCmdClientMessageCopyWithImpl<SensorReadCmdClientMessage>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SensorReadCmdClientMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SensorReadCmdClientMessage &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.inputType, inputType) ||
                other.inputType == inputType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, featureIndex, inputType);

  @override
  String toString() {
    return 'RemoteToyClientMessage.sensorReadCmd(featureIndex: $featureIndex, inputType: $inputType)';
  }
}

/// @nodoc
abstract mixin class $SensorReadCmdClientMessageCopyWith<$Res>
    implements $RemoteToyClientMessageCopyWith<$Res> {
  factory $SensorReadCmdClientMessageCopyWith(SensorReadCmdClientMessage value,
          $Res Function(SensorReadCmdClientMessage) _then) =
      _$SensorReadCmdClientMessageCopyWithImpl;
  @useResult
  $Res call({int featureIndex, InputType inputType});
}

/// @nodoc
class _$SensorReadCmdClientMessageCopyWithImpl<$Res>
    implements $SensorReadCmdClientMessageCopyWith<$Res> {
  _$SensorReadCmdClientMessageCopyWithImpl(this._self, this._then);

  final SensorReadCmdClientMessage _self;
  final $Res Function(SensorReadCmdClientMessage) _then;

  /// Create a copy of RemoteToyClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? featureIndex = null,
    Object? inputType = null,
  }) {
    return _then(SensorReadCmdClientMessage(
      featureIndex: null == featureIndex
          ? _self.featureIndex
          : featureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      inputType: null == inputType
          ? _self.inputType
          : inputType // ignore: cast_nullable_to_non_nullable
              as InputType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class SensorSubscribeCmdClientMessage extends RemoteToyClientMessage {
  const SensorSubscribeCmdClientMessage(
      {required this.featureIndex,
      required this.inputType,
      final String? $type})
      : $type = $type ?? 'sensorSubscribeCmd',
        super._();
  factory SensorSubscribeCmdClientMessage.fromJson(Map<String, dynamic> json) =>
      _$SensorSubscribeCmdClientMessageFromJson(json);

  final int featureIndex;
  final InputType inputType;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of RemoteToyClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SensorSubscribeCmdClientMessageCopyWith<SensorSubscribeCmdClientMessage>
      get copyWith => _$SensorSubscribeCmdClientMessageCopyWithImpl<
          SensorSubscribeCmdClientMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SensorSubscribeCmdClientMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SensorSubscribeCmdClientMessage &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.inputType, inputType) ||
                other.inputType == inputType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, featureIndex, inputType);

  @override
  String toString() {
    return 'RemoteToyClientMessage.sensorSubscribeCmd(featureIndex: $featureIndex, inputType: $inputType)';
  }
}

/// @nodoc
abstract mixin class $SensorSubscribeCmdClientMessageCopyWith<$Res>
    implements $RemoteToyClientMessageCopyWith<$Res> {
  factory $SensorSubscribeCmdClientMessageCopyWith(
          SensorSubscribeCmdClientMessage value,
          $Res Function(SensorSubscribeCmdClientMessage) _then) =
      _$SensorSubscribeCmdClientMessageCopyWithImpl;
  @useResult
  $Res call({int featureIndex, InputType inputType});
}

/// @nodoc
class _$SensorSubscribeCmdClientMessageCopyWithImpl<$Res>
    implements $SensorSubscribeCmdClientMessageCopyWith<$Res> {
  _$SensorSubscribeCmdClientMessageCopyWithImpl(this._self, this._then);

  final SensorSubscribeCmdClientMessage _self;
  final $Res Function(SensorSubscribeCmdClientMessage) _then;

  /// Create a copy of RemoteToyClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? featureIndex = null,
    Object? inputType = null,
  }) {
    return _then(SensorSubscribeCmdClientMessage(
      featureIndex: null == featureIndex
          ? _self.featureIndex
          : featureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      inputType: null == inputType
          ? _self.inputType
          : inputType // ignore: cast_nullable_to_non_nullable
              as InputType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class SensorUnsubscribeCmdClientMessage extends RemoteToyClientMessage {
  const SensorUnsubscribeCmdClientMessage(
      {required this.featureIndex,
      required this.inputType,
      final String? $type})
      : $type = $type ?? 'sensorUnsubscrubeCmd',
        super._();
  factory SensorUnsubscribeCmdClientMessage.fromJson(
          Map<String, dynamic> json) =>
      _$SensorUnsubscribeCmdClientMessageFromJson(json);

  final int featureIndex;
  final InputType inputType;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of RemoteToyClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SensorUnsubscribeCmdClientMessageCopyWith<SensorUnsubscribeCmdClientMessage>
      get copyWith => _$SensorUnsubscribeCmdClientMessageCopyWithImpl<
          SensorUnsubscribeCmdClientMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SensorUnsubscribeCmdClientMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SensorUnsubscribeCmdClientMessage &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.inputType, inputType) ||
                other.inputType == inputType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, featureIndex, inputType);

  @override
  String toString() {
    return 'RemoteToyClientMessage.sensorUnsubscrubeCmd(featureIndex: $featureIndex, inputType: $inputType)';
  }
}

/// @nodoc
abstract mixin class $SensorUnsubscribeCmdClientMessageCopyWith<$Res>
    implements $RemoteToyClientMessageCopyWith<$Res> {
  factory $SensorUnsubscribeCmdClientMessageCopyWith(
          SensorUnsubscribeCmdClientMessage value,
          $Res Function(SensorUnsubscribeCmdClientMessage) _then) =
      _$SensorUnsubscribeCmdClientMessageCopyWithImpl;
  @useResult
  $Res call({int featureIndex, InputType inputType});
}

/// @nodoc
class _$SensorUnsubscribeCmdClientMessageCopyWithImpl<$Res>
    implements $SensorUnsubscribeCmdClientMessageCopyWith<$Res> {
  _$SensorUnsubscribeCmdClientMessageCopyWithImpl(this._self, this._then);

  final SensorUnsubscribeCmdClientMessage _self;
  final $Res Function(SensorUnsubscribeCmdClientMessage) _then;

  /// Create a copy of RemoteToyClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? featureIndex = null,
    Object? inputType = null,
  }) {
    return _then(SensorUnsubscribeCmdClientMessage(
      featureIndex: null == featureIndex
          ? _self.featureIndex
          : featureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      inputType: null == inputType
          ? _self.inputType
          : inputType // ignore: cast_nullable_to_non_nullable
              as InputType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class InputCmdClientMessage extends RemoteToyClientMessage {
  const InputCmdClientMessage({required this.command, final String? $type})
      : $type = $type ?? 'inputCmd',
        super._();
  factory InputCmdClientMessage.fromJson(Map<String, dynamic> json) =>
      _$InputCmdClientMessageFromJson(json);

  final InputCmd command;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of RemoteToyClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InputCmdClientMessageCopyWith<InputCmdClientMessage> get copyWith =>
      _$InputCmdClientMessageCopyWithImpl<InputCmdClientMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InputCmdClientMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InputCmdClientMessage &&
            (identical(other.command, command) || other.command == command));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, command);

  @override
  String toString() {
    return 'RemoteToyClientMessage.inputCmd(command: $command)';
  }
}

/// @nodoc
abstract mixin class $InputCmdClientMessageCopyWith<$Res>
    implements $RemoteToyClientMessageCopyWith<$Res> {
  factory $InputCmdClientMessageCopyWith(InputCmdClientMessage value,
          $Res Function(InputCmdClientMessage) _then) =
      _$InputCmdClientMessageCopyWithImpl;
  @useResult
  $Res call({InputCmd command});

  $InputCmdCopyWith<$Res> get command;
}

/// @nodoc
class _$InputCmdClientMessageCopyWithImpl<$Res>
    implements $InputCmdClientMessageCopyWith<$Res> {
  _$InputCmdClientMessageCopyWithImpl(this._self, this._then);

  final InputCmdClientMessage _self;
  final $Res Function(InputCmdClientMessage) _then;

  /// Create a copy of RemoteToyClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? command = null,
  }) {
    return _then(InputCmdClientMessage(
      command: null == command
          ? _self.command
          : command // ignore: cast_nullable_to_non_nullable
              as InputCmd,
    ));
  }

  /// Create a copy of RemoteToyClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputCmdCopyWith<$Res> get command {
    return $InputCmdCopyWith<$Res>(_self.command, (value) {
      return _then(_self.copyWith(command: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class OutputCmdClientMessage extends RemoteToyClientMessage {
  const OutputCmdClientMessage({required this.command, final String? $type})
      : $type = $type ?? 'outputCmd',
        super._();
  factory OutputCmdClientMessage.fromJson(Map<String, dynamic> json) =>
      _$OutputCmdClientMessageFromJson(json);

  final OutputCmd command;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of RemoteToyClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OutputCmdClientMessageCopyWith<OutputCmdClientMessage> get copyWith =>
      _$OutputCmdClientMessageCopyWithImpl<OutputCmdClientMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OutputCmdClientMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OutputCmdClientMessage &&
            (identical(other.command, command) || other.command == command));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, command);

  @override
  String toString() {
    return 'RemoteToyClientMessage.outputCmd(command: $command)';
  }
}

/// @nodoc
abstract mixin class $OutputCmdClientMessageCopyWith<$Res>
    implements $RemoteToyClientMessageCopyWith<$Res> {
  factory $OutputCmdClientMessageCopyWith(OutputCmdClientMessage value,
          $Res Function(OutputCmdClientMessage) _then) =
      _$OutputCmdClientMessageCopyWithImpl;
  @useResult
  $Res call({OutputCmd command});

  $OutputCmdCopyWith<$Res> get command;
}

/// @nodoc
class _$OutputCmdClientMessageCopyWithImpl<$Res>
    implements $OutputCmdClientMessageCopyWith<$Res> {
  _$OutputCmdClientMessageCopyWithImpl(this._self, this._then);

  final OutputCmdClientMessage _self;
  final $Res Function(OutputCmdClientMessage) _then;

  /// Create a copy of RemoteToyClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? command = null,
  }) {
    return _then(OutputCmdClientMessage(
      command: null == command
          ? _self.command
          : command // ignore: cast_nullable_to_non_nullable
              as OutputCmd,
    ));
  }

  /// Create a copy of RemoteToyClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutputCmdCopyWith<$Res> get command {
    return $OutputCmdCopyWith<$Res>(_self.command, (value) {
      return _then(_self.copyWith(command: value));
    });
  }
}

// dart format on
