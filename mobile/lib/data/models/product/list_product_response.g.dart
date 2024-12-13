// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListProductResponseImpl _$$ListProductResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListProductResponseImpl(
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListProductResponseImplToJson(
        _$ListProductResponseImpl instance) =>
    <String, dynamic>{
      'products': instance.products,
    };
