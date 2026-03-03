// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checked_output_cmd.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckedOutputCmd {
  int get featureIndex;
  String get featureId;
  OutputCommand get command;

  /// Create a copy of CheckedOutputCmd
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckedOutputCmdCopyWith<CheckedOutputCmd> get copyWith =>
      _$CheckedOutputCmdCopyWithImpl<CheckedOutputCmd>(
          this as CheckedOutputCmd, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckedOutputCmd &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.featureId, featureId) ||
                other.featureId == featureId) &&
            (identical(other.command, command) || other.command == command));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, featureIndex, featureId, command);

  @override
  String toString() {
    return 'CheckedOutputCmd(featureIndex: $featureIndex, featureId: $featureId, command: $command)';
  }
}

/// @nodoc
abstract mixin class $CheckedOutputCmdCopyWith<$Res> {
  factory $CheckedOutputCmdCopyWith(
          CheckedOutputCmd value, $Res Function(CheckedOutputCmd) _then) =
      _$CheckedOutputCmdCopyWithImpl;
  @useResult
  $Res call({int featureIndex, String featureId, OutputCommand command});

  $OutputCommandCopyWith<$Res> get command;
}

/// @nodoc
class _$CheckedOutputCmdCopyWithImpl<$Res>
    implements $CheckedOutputCmdCopyWith<$Res> {
  _$CheckedOutputCmdCopyWithImpl(this._self, this._then);

  final CheckedOutputCmd _self;
  final $Res Function(CheckedOutputCmd) _then;

  /// Create a copy of CheckedOutputCmd
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featureIndex = null,
    Object? featureId = null,
    Object? command = null,
  }) {
    return _then(_self.copyWith(
      featureIndex: null == featureIndex
          ? _self.featureIndex
          : featureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      featureId: null == featureId
          ? _self.featureId
          : featureId // ignore: cast_nullable_to_non_nullable
              as String,
      command: null == command
          ? _self.command
          : command // ignore: cast_nullable_to_non_nullable
              as OutputCommand,
    ));
  }

  /// Create a copy of CheckedOutputCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutputCommandCopyWith<$Res> get command {
    return $OutputCommandCopyWith<$Res>(_self.command, (value) {
      return _then(_self.copyWith(command: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CheckedOutputCmd].
extension CheckedOutputCmdPatterns on CheckedOutputCmd {
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
    TResult Function(CheckedOutputCmdV4 value)? v4,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case CheckedOutputCmdV4() when v4 != null:
        return v4(_that);
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
    required TResult Function(CheckedOutputCmdV4 value) v4,
  }) {
    final _that = this;
    switch (_that) {
      case CheckedOutputCmdV4():
        return v4(_that);
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
    TResult? Function(CheckedOutputCmdV4 value)? v4,
  }) {
    final _that = this;
    switch (_that) {
      case CheckedOutputCmdV4() when v4 != null:
        return v4(_that);
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
    TResult Function(int featureIndex, String featureId, OutputCommand command)?
        v4,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case CheckedOutputCmdV4() when v4 != null:
        return v4(_that.featureIndex, _that.featureId, _that.command);
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
    required TResult Function(
            int featureIndex, String featureId, OutputCommand command)
        v4,
  }) {
    final _that = this;
    switch (_that) {
      case CheckedOutputCmdV4():
        return v4(_that.featureIndex, _that.featureId, _that.command);
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
    TResult? Function(
            int featureIndex, String featureId, OutputCommand command)?
        v4,
  }) {
    final _that = this;
    switch (_that) {
      case CheckedOutputCmdV4() when v4 != null:
        return v4(_that.featureIndex, _that.featureId, _that.command);
      case _:
        return null;
    }
  }
}

/// @nodoc

class CheckedOutputCmdV4 extends CheckedOutputCmd {
  const CheckedOutputCmdV4(
      {required this.featureIndex,
      required this.featureId,
      required this.command})
      : super._();

  @override
  final int featureIndex;
  @override
  final String featureId;
  @override
  final OutputCommand command;

  /// Create a copy of CheckedOutputCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckedOutputCmdV4CopyWith<CheckedOutputCmdV4> get copyWith =>
      _$CheckedOutputCmdV4CopyWithImpl<CheckedOutputCmdV4>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckedOutputCmdV4 &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.featureId, featureId) ||
                other.featureId == featureId) &&
            (identical(other.command, command) || other.command == command));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, featureIndex, featureId, command);

  @override
  String toString() {
    return 'CheckedOutputCmd.v4(featureIndex: $featureIndex, featureId: $featureId, command: $command)';
  }
}

/// @nodoc
abstract mixin class $CheckedOutputCmdV4CopyWith<$Res>
    implements $CheckedOutputCmdCopyWith<$Res> {
  factory $CheckedOutputCmdV4CopyWith(
          CheckedOutputCmdV4 value, $Res Function(CheckedOutputCmdV4) _then) =
      _$CheckedOutputCmdV4CopyWithImpl;
  @override
  @useResult
  $Res call({int featureIndex, String featureId, OutputCommand command});

  @override
  $OutputCommandCopyWith<$Res> get command;
}

/// @nodoc
class _$CheckedOutputCmdV4CopyWithImpl<$Res>
    implements $CheckedOutputCmdV4CopyWith<$Res> {
  _$CheckedOutputCmdV4CopyWithImpl(this._self, this._then);

  final CheckedOutputCmdV4 _self;
  final $Res Function(CheckedOutputCmdV4) _then;

  /// Create a copy of CheckedOutputCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? featureIndex = null,
    Object? featureId = null,
    Object? command = null,
  }) {
    return _then(CheckedOutputCmdV4(
      featureIndex: null == featureIndex
          ? _self.featureIndex
          : featureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      featureId: null == featureId
          ? _self.featureId
          : featureId // ignore: cast_nullable_to_non_nullable
              as String,
      command: null == command
          ? _self.command
          : command // ignore: cast_nullable_to_non_nullable
              as OutputCommand,
    ));
  }

  /// Create a copy of CheckedOutputCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutputCommandCopyWith<$Res> get command {
    return $OutputCommandCopyWith<$Res>(_self.command, (value) {
      return _then(_self.copyWith(command: value));
    });
  }
}

// dart format on
