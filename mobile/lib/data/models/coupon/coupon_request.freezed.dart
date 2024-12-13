// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CouponRequest _$CouponRequestFromJson(Map<String, dynamic> json) {
  return _CouponRequest.fromJson(json);
}

/// @nodoc
mixin _$CouponRequest {
  String get couponCode => throw _privateConstructorUsedError;

  /// Serializes this CouponRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CouponRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CouponRequestCopyWith<CouponRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponRequestCopyWith<$Res> {
  factory $CouponRequestCopyWith(
          CouponRequest value, $Res Function(CouponRequest) then) =
      _$CouponRequestCopyWithImpl<$Res, CouponRequest>;
  @useResult
  $Res call({String couponCode});
}

/// @nodoc
class _$CouponRequestCopyWithImpl<$Res, $Val extends CouponRequest>
    implements $CouponRequestCopyWith<$Res> {
  _$CouponRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CouponRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? couponCode = null,
  }) {
    return _then(_value.copyWith(
      couponCode: null == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CouponRequestImplCopyWith<$Res>
    implements $CouponRequestCopyWith<$Res> {
  factory _$$CouponRequestImplCopyWith(
          _$CouponRequestImpl value, $Res Function(_$CouponRequestImpl) then) =
      __$$CouponRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String couponCode});
}

/// @nodoc
class __$$CouponRequestImplCopyWithImpl<$Res>
    extends _$CouponRequestCopyWithImpl<$Res, _$CouponRequestImpl>
    implements _$$CouponRequestImplCopyWith<$Res> {
  __$$CouponRequestImplCopyWithImpl(
      _$CouponRequestImpl _value, $Res Function(_$CouponRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CouponRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? couponCode = null,
  }) {
    return _then(_$CouponRequestImpl(
      couponCode: null == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CouponRequestImpl implements _CouponRequest {
  const _$CouponRequestImpl({required this.couponCode});

  factory _$CouponRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CouponRequestImplFromJson(json);

  @override
  final String couponCode;

  @override
  String toString() {
    return 'CouponRequest(couponCode: $couponCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponRequestImpl &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, couponCode);

  /// Create a copy of CouponRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponRequestImplCopyWith<_$CouponRequestImpl> get copyWith =>
      __$$CouponRequestImplCopyWithImpl<_$CouponRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CouponRequestImplToJson(
      this,
    );
  }
}

abstract class _CouponRequest implements CouponRequest {
  const factory _CouponRequest({required final String couponCode}) =
      _$CouponRequestImpl;

  factory _CouponRequest.fromJson(Map<String, dynamic> json) =
      _$CouponRequestImpl.fromJson;

  @override
  String get couponCode;

  /// Create a copy of CouponRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CouponRequestImplCopyWith<_$CouponRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
