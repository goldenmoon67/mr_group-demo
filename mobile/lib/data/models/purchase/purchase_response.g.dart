// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseResponseImpl _$$PurchaseResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseResponseImpl(
      message: json['message'] as String,
      purchase: Purchase.fromJson(json['purchase'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PurchaseResponseImplToJson(
        _$PurchaseResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'purchase': instance.purchase,
    };
