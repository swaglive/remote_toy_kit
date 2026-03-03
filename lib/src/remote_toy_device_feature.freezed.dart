// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_toy_device_feature.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemoteToyDeviceFeature {
  int get featureIndex;
  FeatureType get featureType;
  DeviceFeature get feature;

  /// Create a copy of RemoteToyDeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RemoteToyDeviceFeatureCopyWith<RemoteToyDeviceFeature> get copyWith =>
      _$RemoteToyDeviceFeatureCopyWithImpl<RemoteToyDeviceFeature>(
          this as RemoteToyDeviceFeature, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemoteToyDeviceFeature &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.featureType, featureType) ||
                other.featureType == featureType) &&
            (identical(other.feature, feature) || other.feature == feature));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, featureIndex, featureType, feature);

  @override
  String toString() {
    return 'RemoteToyDeviceFeature(featureIndex: $featureIndex, featureType: $featureType, feature: $feature)';
  }
}

/// @nodoc
abstract mixin class $RemoteToyDeviceFeatureCopyWith<$Res> {
  factory $RemoteToyDeviceFeatureCopyWith(RemoteToyDeviceFeature value,
          $Res Function(RemoteToyDeviceFeature) _then) =
      _$RemoteToyDeviceFeatureCopyWithImpl;
  @useResult
  $Res call({int featureIndex, FeatureType featureType, DeviceFeature feature});

  $DeviceFeatureCopyWith<$Res> get feature;
}

/// @nodoc
class _$RemoteToyDeviceFeatureCopyWithImpl<$Res>
    implements $RemoteToyDeviceFeatureCopyWith<$Res> {
  _$RemoteToyDeviceFeatureCopyWithImpl(this._self, this._then);

  final RemoteToyDeviceFeature _self;
  final $Res Function(RemoteToyDeviceFeature) _then;

  /// Create a copy of RemoteToyDeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featureIndex = null,
    Object? featureType = null,
    Object? feature = null,
  }) {
    return _then(_self.copyWith(
      featureIndex: null == featureIndex
          ? _self.featureIndex
          : featureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      featureType: null == featureType
          ? _self.featureType
          : featureType // ignore: cast_nullable_to_non_nullable
              as FeatureType,
      feature: null == feature
          ? _self.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as DeviceFeature,
    ));
  }

  /// Create a copy of RemoteToyDeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureCopyWith<$Res> get feature {
    return $DeviceFeatureCopyWith<$Res>(_self.feature, (value) {
      return _then(_self.copyWith(feature: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RemoteToyDeviceFeature].
extension RemoteToyDeviceFeaturePatterns on RemoteToyDeviceFeature {
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
    TResult Function(_RemoteToyDeviceFeature value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemoteToyDeviceFeature() when $default != null:
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
    TResult Function(_RemoteToyDeviceFeature value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteToyDeviceFeature():
        return $default(_that);
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
    TResult? Function(_RemoteToyDeviceFeature value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteToyDeviceFeature() when $default != null:
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
            int featureIndex, FeatureType featureType, DeviceFeature feature)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemoteToyDeviceFeature() when $default != null:
        return $default(_that.featureIndex, _that.featureType, _that.feature);
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
            int featureIndex, FeatureType featureType, DeviceFeature feature)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteToyDeviceFeature():
        return $default(_that.featureIndex, _that.featureType, _that.feature);
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
            int featureIndex, FeatureType featureType, DeviceFeature feature)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteToyDeviceFeature() when $default != null:
        return $default(_that.featureIndex, _that.featureType, _that.feature);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RemoteToyDeviceFeature extends RemoteToyDeviceFeature {
  const _RemoteToyDeviceFeature(
      {required this.featureIndex,
      required this.featureType,
      required this.feature})
      : super._();

  @override
  final int featureIndex;
  @override
  final FeatureType featureType;
  @override
  final DeviceFeature feature;

  /// Create a copy of RemoteToyDeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RemoteToyDeviceFeatureCopyWith<_RemoteToyDeviceFeature> get copyWith =>
      __$RemoteToyDeviceFeatureCopyWithImpl<_RemoteToyDeviceFeature>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RemoteToyDeviceFeature &&
            (identical(other.featureIndex, featureIndex) ||
                other.featureIndex == featureIndex) &&
            (identical(other.featureType, featureType) ||
                other.featureType == featureType) &&
            (identical(other.feature, feature) || other.feature == feature));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, featureIndex, featureType, feature);

  @override
  String toString() {
    return 'RemoteToyDeviceFeature(featureIndex: $featureIndex, featureType: $featureType, feature: $feature)';
  }
}

/// @nodoc
abstract mixin class _$RemoteToyDeviceFeatureCopyWith<$Res>
    implements $RemoteToyDeviceFeatureCopyWith<$Res> {
  factory _$RemoteToyDeviceFeatureCopyWith(_RemoteToyDeviceFeature value,
          $Res Function(_RemoteToyDeviceFeature) _then) =
      __$RemoteToyDeviceFeatureCopyWithImpl;
  @override
  @useResult
  $Res call({int featureIndex, FeatureType featureType, DeviceFeature feature});

  @override
  $DeviceFeatureCopyWith<$Res> get feature;
}

/// @nodoc
class __$RemoteToyDeviceFeatureCopyWithImpl<$Res>
    implements _$RemoteToyDeviceFeatureCopyWith<$Res> {
  __$RemoteToyDeviceFeatureCopyWithImpl(this._self, this._then);

  final _RemoteToyDeviceFeature _self;
  final $Res Function(_RemoteToyDeviceFeature) _then;

  /// Create a copy of RemoteToyDeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? featureIndex = null,
    Object? featureType = null,
    Object? feature = null,
  }) {
    return _then(_RemoteToyDeviceFeature(
      featureIndex: null == featureIndex
          ? _self.featureIndex
          : featureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      featureType: null == featureType
          ? _self.featureType
          : featureType // ignore: cast_nullable_to_non_nullable
              as FeatureType,
      feature: null == feature
          ? _self.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as DeviceFeature,
    ));
  }

  /// Create a copy of RemoteToyDeviceFeature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceFeatureCopyWith<$Res> get feature {
    return $DeviceFeatureCopyWith<$Res>(_self.feature, (value) {
      return _then(_self.copyWith(feature: value));
    });
  }
}

// dart format on
