// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseResponse _$PurchaseResponseFromJson(Map<String, dynamic> json) {
  return _PurchaseResponse.fromJson(json);
}

/// @nodoc
mixin _$PurchaseResponse {
  String get message => throw _privateConstructorUsedError;
  Purchase get purchase => throw _privateConstructorUsedError;

  /// Serializes this PurchaseResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseResponseCopyWith<PurchaseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseResponseCopyWith<$Res> {
  factory $PurchaseResponseCopyWith(
          PurchaseResponse value, $Res Function(PurchaseResponse) then) =
      _$PurchaseResponseCopyWithImpl<$Res, PurchaseResponse>;
  @useResult
  $Res call({String message, Purchase purchase});

  $PurchaseCopyWith<$Res> get purchase;
}

/// @nodoc
class _$PurchaseResponseCopyWithImpl<$Res, $Val extends PurchaseResponse>
    implements $PurchaseResponseCopyWith<$Res> {
  _$PurchaseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? purchase = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      purchase: null == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as Purchase,
    ) as $Val);
  }

  /// Create a copy of PurchaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseCopyWith<$Res> get purchase {
    return $PurchaseCopyWith<$Res>(_value.purchase, (value) {
      return _then(_value.copyWith(purchase: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseResponseImplCopyWith<$Res>
    implements $PurchaseResponseCopyWith<$Res> {
  factory _$$PurchaseResponseImplCopyWith(_$PurchaseResponseImpl value,
          $Res Function(_$PurchaseResponseImpl) then) =
      __$$PurchaseResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Purchase purchase});

  @override
  $PurchaseCopyWith<$Res> get purchase;
}

/// @nodoc
class __$$PurchaseResponseImplCopyWithImpl<$Res>
    extends _$PurchaseResponseCopyWithImpl<$Res, _$PurchaseResponseImpl>
    implements _$$PurchaseResponseImplCopyWith<$Res> {
  __$$PurchaseResponseImplCopyWithImpl(_$PurchaseResponseImpl _value,
      $Res Function(_$PurchaseResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? purchase = null,
  }) {
    return _then(_$PurchaseResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      purchase: null == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as Purchase,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseResponseImpl implements _PurchaseResponse {
  const _$PurchaseResponseImpl({required this.message, required this.purchase});

  factory _$PurchaseResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseResponseImplFromJson(json);

  @override
  final String message;
  @override
  final Purchase purchase;

  @override
  String toString() {
    return 'PurchaseResponse(message: $message, purchase: $purchase)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.purchase, purchase) ||
                other.purchase == purchase));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, purchase);

  /// Create a copy of PurchaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseResponseImplCopyWith<_$PurchaseResponseImpl> get copyWith =>
      __$$PurchaseResponseImplCopyWithImpl<_$PurchaseResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseResponseImplToJson(
      this,
    );
  }
}

abstract class _PurchaseResponse implements PurchaseResponse {
  const factory _PurchaseResponse(
      {required final String message,
      required final Purchase purchase}) = _$PurchaseResponseImpl;

  factory _PurchaseResponse.fromJson(Map<String, dynamic> json) =
      _$PurchaseResponseImpl.fromJson;

  @override
  String get message;
  @override
  Purchase get purchase;

  /// Create a copy of PurchaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseResponseImplCopyWith<_$PurchaseResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
