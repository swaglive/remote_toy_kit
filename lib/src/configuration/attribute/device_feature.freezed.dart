// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_feature.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceFeature {
  String get description;
  String get id;
  int get index;
  DeviceFeatureOutput? get output;
  DeviceFeatureInput? get input;

  /// Create a copy of DeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceFeatureCopyWith<DeviceFeature> get copyWith =>
      _$DeviceFeatureCopyWithImpl<DeviceFeature>(
          this as DeviceFeature, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceFeature &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.output, output) || other.output == output) &&
            (identical(other.input, input) || other.input == input));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, description, id, index, output, input);

  @override
  String toString() {
    return 'DeviceFeature(description: $description, id: $id, index: $index, output: $output, input: $input)';
  }
}

/// @nodoc
abstract mixin class $DeviceFeatureCopyWith<$Res> {
  factory $DeviceFeatureCopyWith(
          DeviceFeature value, $Res Function(DeviceFeature) _then) =
      _$DeviceFeatureCopyWithImpl;
  @useResult
  $Res call(
      {String description,
      String id,
      int index,
      DeviceFeatureOutput? output,
      DeviceFeatureInput? input});

  $DeviceFeatureOutputCopyWith<$Res>? get output;
  $DeviceFeatureInputCopyWith<$Res>? get input;
}

/// @nodoc
class _$DeviceFeatureCopyWithImpl<$Res>
    implements $DeviceFeatureCopyWith<$Res> {
  _$DeviceFeatureCopyWithImpl(this._self, this._then);

  final DeviceFeature _self;
  final $Res Function(DeviceFeature) _then;

  /// Create a copy of DeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? id = null,
    Object? index = null,
    Object? output = freezed,
    Object? input = freezed,
  }) {
    return _then(_self.copyWith(
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      output: freezed == output
          ? _self.output
          : output // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutput?,
      input: freezed == input
          ? _self.input
          : input // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureInput?,
    ));
  }

  /// Create a copy of DeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputCopyWith<$Res>? get output {
    if (_self.output == null) {
      return null;
    }

    return $DeviceFeatureOutputCopyWith<$Res>(_self.output!, (value) {
      return _then(_self.copyWith(output: value));
    });
  }

  /// Create a copy of DeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureInputCopyWith<$Res>? get input {
    if (_self.input == null) {
      return null;
    }

    return $DeviceFeatureInputCopyWith<$Res>(_self.input!, (value) {
      return _then(_self.copyWith(input: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DeviceFeature].
extension DeviceFeaturePatterns on DeviceFeature {
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
    TResult Function(_DeviceFeature value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceFeature() when $default != null:
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
    TResult Function(_DeviceFeature value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeature():
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
    TResult? Function(_DeviceFeature value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeature() when $default != null:
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
    TResult Function(String description, String id, int index,
            DeviceFeatureOutput? output, DeviceFeatureInput? input)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceFeature() when $default != null:
        return $default(_that.description, _that.id, _that.index, _that.output,
            _that.input);
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
    TResult Function(String description, String id, int index,
            DeviceFeatureOutput? output, DeviceFeatureInput? input)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeature():
        return $default(_that.description, _that.id, _that.index, _that.output,
            _that.input);
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
    TResult? Function(String description, String id, int index,
            DeviceFeatureOutput? output, DeviceFeatureInput? input)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceFeature() when $default != null:
        return $default(_that.description, _that.id, _that.index, _that.output,
            _that.input);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DeviceFeature extends DeviceFeature {
  const _DeviceFeature(
      {this.description = '',
      required this.id,
      required this.index,
      this.output,
      this.input})
      : super._();

  @override
  @JsonKey()
  final String description;
  @override
  final String id;
  @override
  final int index;
  @override
  final DeviceFeatureOutput? output;
  @override
  final DeviceFeatureInput? input;

  /// Create a copy of DeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeviceFeatureCopyWith<_DeviceFeature> get copyWith =>
      __$DeviceFeatureCopyWithImpl<_DeviceFeature>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceFeature &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.output, output) || other.output == output) &&
            (identical(other.input, input) || other.input == input));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, description, id, index, output, input);

  @override
  String toString() {
    return 'DeviceFeature(description: $description, id: $id, index: $index, output: $output, input: $input)';
  }
}

/// @nodoc
abstract mixin class _$DeviceFeatureCopyWith<$Res>
    implements $DeviceFeatureCopyWith<$Res> {
  factory _$DeviceFeatureCopyWith(
          _DeviceFeature value, $Res Function(_DeviceFeature) _then) =
      __$DeviceFeatureCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String description,
      String id,
      int index,
      DeviceFeatureOutput? output,
      DeviceFeatureInput? input});

  @override
  $DeviceFeatureOutputCopyWith<$Res>? get output;
  @override
  $DeviceFeatureInputCopyWith<$Res>? get input;
}

/// @nodoc
class __$DeviceFeatureCopyWithImpl<$Res>
    implements _$DeviceFeatureCopyWith<$Res> {
  __$DeviceFeatureCopyWithImpl(this._self, this._then);

  final _DeviceFeature _self;
  final $Res Function(_DeviceFeature) _then;

  /// Create a copy of DeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? description = null,
    Object? id = null,
    Object? index = null,
    Object? output = freezed,
    Object? input = freezed,
  }) {
    return _then(_DeviceFeature(
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      output: freezed == output
          ? _self.output
          : output // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureOutput?,
      input: freezed == input
          ? _self.input
          : input // ignore: cast_nullable_to_non_nullable
              as DeviceFeatureInput?,
    ));
  }

  /// Create a copy of DeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureOutputCopyWith<$Res>? get output {
    if (_self.output == null) {
      return null;
    }

    return $DeviceFeatureOutputCopyWith<$Res>(_self.output!, (value) {
      return _then(_self.copyWith(output: value));
    });
  }

  /// Create a copy of DeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureInputCopyWith<$Res>? get input {
    if (_self.input == null) {
      return null;
    }

    return $DeviceFeatureInputCopyWith<$Res>(_self.input!, (value) {
      return _then(_self.copyWith(input: value));
    });
  }
}

// dart format on
