// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_product_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListProductResponse _$ListProductResponseFromJson(Map<String, dynamic> json) {
  return _ListProductResponse.fromJson(json);
}

/// @nodoc
mixin _$ListProductResponse {
  List<Product> get products => throw _privateConstructorUsedError;

  /// Serializes this ListProductResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListProductResponseCopyWith<ListProductResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListProductResponseCopyWith<$Res> {
  factory $ListProductResponseCopyWith(
          ListProductResponse value, $Res Function(ListProductResponse) then) =
      _$ListProductResponseCopyWithImpl<$Res, ListProductResponse>;
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class _$ListProductResponseCopyWithImpl<$Res, $Val extends ListProductResponse>
    implements $ListProductResponseCopyWith<$Res> {
  _$ListProductResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListProductResponseImplCopyWith<$Res>
    implements $ListProductResponseCopyWith<$Res> {
  factory _$$ListProductResponseImplCopyWith(_$ListProductResponseImpl value,
          $Res Function(_$ListProductResponseImpl) then) =
      __$$ListProductResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class __$$ListProductResponseImplCopyWithImpl<$Res>
    extends _$ListProductResponseCopyWithImpl<$Res, _$ListProductResponseImpl>
    implements _$$ListProductResponseImplCopyWith<$Res> {
  __$$ListProductResponseImplCopyWithImpl(_$ListProductResponseImpl _value,
      $Res Function(_$ListProductResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$ListProductResponseImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListProductResponseImpl implements _ListProductResponse {
  const _$ListProductResponseImpl({required final List<Product> products})
      : _products = products;

  factory _$ListProductResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListProductResponseImplFromJson(json);

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ListProductResponse(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListProductResponseImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  /// Create a copy of ListProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListProductResponseImplCopyWith<_$ListProductResponseImpl> get copyWith =>
      __$$ListProductResponseImplCopyWithImpl<_$ListProductResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListProductResponseImplToJson(
      this,
    );
  }
}

abstract class _ListProductResponse implements ListProductResponse {
  const factory _ListProductResponse({required final List<Product> products}) =
      _$ListProductResponseImpl;

  factory _ListProductResponse.fromJson(Map<String, dynamic> json) =
      _$ListProductResponseImpl.fromJson;

  @override
  List<Product> get products;

  /// Create a copy of ListProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListProductResponseImplCopyWith<_$ListProductResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
