// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hardware_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HardwareEvent {
  String get id;
  Endpoint get endpoint;
  Uint8List get data;

  /// Create a copy of HardwareEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HardwareEventCopyWith<HardwareEvent> get copyWith =>
      _$HardwareEventCopyWithImpl<HardwareEvent>(
          this as HardwareEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HardwareEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, endpoint, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'HardwareEvent(id: $id, endpoint: $endpoint, data: $data)';
  }
}

/// @nodoc
abstract mixin class $HardwareEventCopyWith<$Res> {
  factory $HardwareEventCopyWith(
          HardwareEvent value, $Res Function(HardwareEvent) _then) =
      _$HardwareEventCopyWithImpl;
  @useResult
  $Res call({String id, Endpoint endpoint, Uint8List data});
}

/// @nodoc
class _$HardwareEventCopyWithImpl<$Res>
    implements $HardwareEventCopyWith<$Res> {
  _$HardwareEventCopyWithImpl(this._self, this._then);

  final HardwareEvent _self;
  final $Res Function(HardwareEvent) _then;

  /// Create a copy of HardwareEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? endpoint = null,
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: null == endpoint
          ? _self.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as Endpoint,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// Adds pattern-matching-related methods to [HardwareEvent].
extension HardwareEventPatterns on HardwareEvent {
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
    TResult Function(NotificationHardwareEvent value)? notification,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotificationHardwareEvent() when notification != null:
        return notification(_that);
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
    required TResult Function(NotificationHardwareEvent value) notification,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationHardwareEvent():
        return notification(_that);
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
    TResult? Function(NotificationHardwareEvent value)? notification,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationHardwareEvent() when notification != null:
        return notification(_that);
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
    TResult Function(String id, Endpoint endpoint, Uint8List data)?
        notification,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotificationHardwareEvent() when notification != null:
        return notification(_that.id, _that.endpoint, _that.data);
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
    required TResult Function(String id, Endpoint endpoint, Uint8List data)
        notification,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationHardwareEvent():
        return notification(_that.id, _that.endpoint, _that.data);
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
    TResult? Function(String id, Endpoint endpoint, Uint8List data)?
        notification,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationHardwareEvent() when notification != null:
        return notification(_that.id, _that.endpoint, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc

class NotificationHardwareEvent implements HardwareEvent {
  const NotificationHardwareEvent(
      {required this.id, required this.endpoint, required this.data});

  @override
  final String id;
  @override
  final Endpoint endpoint;
  @override
  final Uint8List data;

  /// Create a copy of HardwareEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationHardwareEventCopyWith<NotificationHardwareEvent> get copyWith =>
      _$NotificationHardwareEventCopyWithImpl<NotificationHardwareEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationHardwareEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, endpoint, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'HardwareEvent.notification(id: $id, endpoint: $endpoint, data: $data)';
  }
}

/// @nodoc
abstract mixin class $NotificationHardwareEventCopyWith<$Res>
    implements $HardwareEventCopyWith<$Res> {
  factory $NotificationHardwareEventCopyWith(NotificationHardwareEvent value,
          $Res Function(NotificationHardwareEvent) _then) =
      _$NotificationHardwareEventCopyWithImpl;
  @override
  @useResult
  $Res call({String id, Endpoint endpoint, Uint8List data});
}

/// @nodoc
class _$NotificationHardwareEventCopyWithImpl<$Res>
    implements $NotificationHardwareEventCopyWith<$Res> {
  _$NotificationHardwareEventCopyWithImpl(this._self, this._then);

  final NotificationHardwareEvent _self;
  final $Res Function(NotificationHardwareEvent) _then;

  /// Create a copy of HardwareEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? endpoint = null,
    Object? data = null,
  }) {
    return _then(NotificationHardwareEvent(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: null == endpoint
          ? _self.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as Endpoint,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

// dart format on
