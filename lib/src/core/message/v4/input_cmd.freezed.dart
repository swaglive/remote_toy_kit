// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_cmd.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
InputCmd _$InputCmdFromJson(Map<String, dynamic> json) {
  return InputCmdV4.fromJson(json);
}

/// @nodoc
mixin _$InputCmd {
  int get featureIndex;
  InputType get inputType;
  InputCommandType get inputCommandType;

  /// Create a copy of InputCmd
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InputCmdCopyWith<InputCmd> get copyWith =>
      _$InputCmdCopyWithImpl<InputCmd>(this as InputCmd, _$identity);

  /// Serializes this InputCmd to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InputCmd &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.inputType, inputType) ||
                other.inputType == inputType) &&
            (identical(other.inputCommandType, inputCommandType) ||
                other.inputCommandType == inputCommandType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, featureIndex, inputType, inputCommandType);

  @override
  String toString() {
    return 'InputCmd(featureIndex: $featureIndex, inputType: $inputType, inputCommandType: $inputCommandType)';
  }
}

/// @nodoc
abstract mixin class $InputCmdCopyWith<$Res> {
  factory $InputCmdCopyWith(InputCmd value, $Res Function(InputCmd) _then) =
      _$InputCmdCopyWithImpl;
  @useResult
  $Res call(
      {int featureIndex,
      InputType inputType,
      InputCommandType inputCommandType});
}

/// @nodoc
class _$InputCmdCopyWithImpl<$Res> implements $InputCmdCopyWith<$Res> {
  _$InputCmdCopyWithImpl(this._self, this._then);

  final InputCmd _self;
  final $Res Function(InputCmd) _then;

  /// Create a copy of InputCmd
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featureIndex = null,
    Object? inputType = null,
    Object? inputCommandType = null,
  }) {
    return _then(_self.copyWith(
      featureIndex: null == featureIndex
          ? _self.featureIndex
          : featureIndex // ignore: cast_nullable_to_non_nullable
              as int,
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

/// Adds pattern-matching-related methods to [InputCmd].
extension InputCmdPatterns on InputCmd {
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
    TResult Function(InputCmdV4 value)? v4,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case InputCmdV4() when v4 != null:
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
    required TResult Function(InputCmdV4 value) v4,
  }) {
    final _that = this;
    switch (_that) {
      case InputCmdV4():
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
    TResult? Function(InputCmdV4 value)? v4,
  }) {
    final _that = this;
    switch (_that) {
      case InputCmdV4() when v4 != null:
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
    TResult Function(int featureIndex, InputType inputType,
            InputCommandType inputCommandType)?
        v4,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case InputCmdV4() when v4 != null:
        return v4(_that.featureIndex, _that.inputType, _that.inputCommandType);
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
    required TResult Function(int featureIndex, InputType inputType,
            InputCommandType inputCommandType)
        v4,
  }) {
    final _that = this;
    switch (_that) {
      case InputCmdV4():
        return v4(_that.featureIndex, _that.inputType, _that.inputCommandType);
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
    TResult? Function(int featureIndex, InputType inputType,
            InputCommandType inputCommandType)?
        v4,
  }) {
    final _that = this;
    switch (_that) {
      case InputCmdV4() when v4 != null:
        return v4(_that.featureIndex, _that.inputType, _that.inputCommandType);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class InputCmdV4 extends InputCmd {
  const InputCmdV4(
      {required this.featureIndex,
      required this.inputType,
      required this.inputCommandType})
      : super._();
  factory InputCmdV4.fromJson(Map<String, dynamic> json) =>
      _$InputCmdV4FromJson(json);

  @override
  final int featureIndex;
  @override
  final InputType inputType;
  @override
  final InputCommandType inputCommandType;

  /// Create a copy of InputCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InputCmdV4CopyWith<InputCmdV4> get copyWith =>
      _$InputCmdV4CopyWithImpl<InputCmdV4>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InputCmdV4ToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InputCmdV4 &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.inputType, inputType) ||
                other.inputType == inputType) &&
            (identical(other.inputCommandType, inputCommandType) ||
                other.inputCommandType == inputCommandType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, featureIndex, inputType, inputCommandType);

  @override
  String toString() {
    return 'InputCmd.v4(featureIndex: $featureIndex, inputType: $inputType, inputCommandType: $inputCommandType)';
  }
}

/// @nodoc
abstract mixin class $InputCmdV4CopyWith<$Res>
    implements $InputCmdCopyWith<$Res> {
  factory $InputCmdV4CopyWith(
          InputCmdV4 value, $Res Function(InputCmdV4) _then) =
      _$InputCmdV4CopyWithImpl;
  @override
  @useResult
  $Res call(
      {int featureIndex,
      InputType inputType,
      InputCommandType inputCommandType});
}

/// @nodoc
class _$InputCmdV4CopyWithImpl<$Res> implements $InputCmdV4CopyWith<$Res> {
  _$InputCmdV4CopyWithImpl(this._self, this._then);

  final InputCmdV4 _self;
  final $Res Function(InputCmdV4) _then;

  /// Create a copy of InputCmd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? featureIndex = null,
    Object? inputType = null,
    Object? inputCommandType = null,
  }) {
    return _then(InputCmdV4(
      featureIndex: null == featureIndex
          ? _self.featureIndex
          : featureIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
