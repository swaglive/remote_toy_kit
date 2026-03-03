// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checked_input_cmd.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckedInputCmd {
  int get featureIndex;
  String get featureId;
  InputType get inputType;
  InputCommandType get inputCommandType;

  /// Create a copy of CheckedInputCmd
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckedInputCmdCopyWith<CheckedInputCmd> get copyWith =>
      _$CheckedInputCmdCopyWithImpl<CheckedInputCmd>(
          this as CheckedInputCmd, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckedInputCmd &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.featureId, featureId) ||
                other.featureId == featureId) &&
            (identical(other.inputType, inputType) ||
                other.inputType == inputType) &&
            (identical(other.inputCommandType, inputCommandType) ||
                other.inputCommandType == inputCommandType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, featureIndex, featureId, inputType, inputCommandType);

  @override
  String toString() {
    return 'CheckedInputCmd(featureIndex: $featureIndex, featureId: $featureId, inputType: $inputType, inputCommandType: $inputCommandType)';
  }
}

/// @nodoc
abstract mixin class $CheckedInputCmdCopyWith<$Res> {
  factory $CheckedInputCmdCopyWith(
          CheckedInputCmd value, $Res Function(CheckedInputCmd) _then) =
      _$CheckedInputCmdCopyWithImpl;
  @useResult
  $Res call(
      {int featureIndex,
      String featureId,
      InputType inputType,
      InputCommandType inputCommandType});
}

/// @nodoc
class _$CheckedInputCmdCopyWithImpl<$Res>
    implements $CheckedInputCmdCopyWith<$Res> {
  _$CheckedInputCmdCopyWithImpl(this._self, this._then);

  final CheckedInputCmd _self;
  final $Res Function(CheckedInputCmd) _then;

  /// Create a copy of CheckedInputCmd
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featureIndex = null,
    Object? featureId = null,
    Object? inputType = null,
    Object? inputCommandType = null,
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
      inputType: null == inputType
          ? _self.inputType
          : inputType // ignore: cast_nullable_to_non_nullable
              as InputType,
      inputCommandType: null == inputCommandType
          ? _self.inputCommandType
          : inputCommandType // ignore: cast_nullable_to_non_nullable
              as InputCommandType,
    ));
  }
}

/// Adds pattern-matching-related methods to [CheckedInputCmd].
extension CheckedInputCmdPatterns on CheckedInputCmd {
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
    TResult Function(CheckedInputCmdV4 value)? v4,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case CheckedInputCmdV4() when v4 != null:
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
    required TResult Function(CheckedInputCmdV4 value) v4,
  }) {
    final _that = this;
    switch (_that) {
      case CheckedInputCmdV4():
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
    TResult? Function(CheckedInputCmdV4 value)? v4,
  }) {
    final _that = this;
    switch (_that) {
      case CheckedInputCmdV4() when v4 != null:
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
    TResult Function(int featureIndex, String featureId, InputType inputType,
            InputCommandType inputCommandType)?
        v4,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case CheckedInputCmdV4() when v4 != null:
        return v4(_that.featureIndex, _that.featureId, _that.inputType,
            _that.inputCommandType);
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
    required TResult Function(int featureIndex, String featureId,
            InputType inputType, InputCommandType inputCommandType)
        v4,
  }) {
    final _that = this;
    switch (_that) {
      case CheckedInputCmdV4():
        return v4(_that.featureIndex, _that.featureId, _that.inputType,
            _that.inputCommandType);
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
    TResult? Function(int featureIndex, String featureId, InputType inputType,
            InputCommandType inputCommandType)?
        v4,
  }) {
    final _that = this;
    switch (_that) {
      case CheckedInputCmdV4() when v4 != null:
        return v4(_that.featureIndex, _that.featureId, _that.inputType,
            _that.inputCommandType);
      case _:
        return null;
    }
  }
}

/// @nodoc

class CheckedInputCmdV4 extends CheckedInputCmd {
  const CheckedInputCmdV4(
      {required this.featureIndex,
      required this.featureId,
      required this.inputType,
      required this.inputCommandType})
      : super._();

  @override
  final int featureIndex;
  @override
  final String featureId;
  @override
  final InputType inputType;
  @override
  final InputCommandType inputCommandType;

  /// Create a copy of CheckedInputCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckedInputCmdV4CopyWith<CheckedInputCmdV4> get copyWith =>
      _$CheckedInputCmdV4CopyWithImpl<CheckedInputCmdV4>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckedInputCmdV4 &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.featureId, featureId) ||
                other.featureId == featureId) &&
            (identical(other.inputType, inputType) ||
                other.inputType == inputType) &&
            (identical(other.inputCommandType, inputCommandType) ||
                other.inputCommandType == inputCommandType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, featureIndex, featureId, inputType, inputCommandType);

  @override
  String toString() {
    return 'CheckedInputCmd.v4(featureIndex: $featureIndex, featureId: $featureId, inputType: $inputType, inputCommandType: $inputCommandType)';
  }
}

/// @nodoc
abstract mixin class $CheckedInputCmdV4CopyWith<$Res>
    implements $CheckedInputCmdCopyWith<$Res> {
  factory $CheckedInputCmdV4CopyWith(
          CheckedInputCmdV4 value, $Res Function(CheckedInputCmdV4) _then) =
      _$CheckedInputCmdV4CopyWithImpl;
  @override
  @useResult
  $Res call(
      {int featureIndex,
      String featureId,
      InputType inputType,
      InputCommandType inputCommandType});
}

/// @nodoc
class _$CheckedInputCmdV4CopyWithImpl<$Res>
    implements $CheckedInputCmdV4CopyWith<$Res> {
  _$CheckedInputCmdV4CopyWithImpl(this._self, this._then);

  final CheckedInputCmdV4 _self;
  final $Res Function(CheckedInputCmdV4) _then;

  /// Create a copy of CheckedInputCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? featureIndex = null,
    Object? featureId = null,
    Object? inputType = null,
    Object? inputCommandType = null,
  }) {
    return _then(CheckedInputCmdV4(
      featureIndex: null == featureIndex
          ? _self.featureIndex
          : featureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      featureId: null == featureId
          ? _self.featureId
          : featureId // ignore: cast_nullable_to_non_nullable
              as String,
      inputType: null == inputType
          ? _self.inputType
          : inputType // ignore: cast_nullable_to_non_nullable
              as InputType,
      inputCommandType: null == inputCommandType
          ? _self.inputCommandType
          : inputCommandType // ignore: cast_nullable_to_non_nullable
              as InputCommandType,
    ));
  }
}

// dart format on
