// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseImpl _$$PurchaseImplFromJson(Map<String, dynamic> json) =>
    _$PurchaseImpl(
      userId: json['userId'] as String,
      amount: (json['amount'] as num).toDouble(),
      firstPurchase: json['firstPurchase'] as bool,
    );

Map<String, dynamic> _$$PurchaseImplToJson(_$PurchaseImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'amount': instance.amount,
      'firstPurchase': instance.firstPurchase,
    };
