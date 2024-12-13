// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CouponImpl _$$CouponImplFromJson(Map<String, dynamic> json) => _$CouponImpl(
      id: json['_id'] as String,
      code: json['code'] as String,
      isUsed: json['isUsed'] as bool,
    );

Map<String, dynamic> _$$CouponImplToJson(_$CouponImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'code': instance.code,
      'isUsed': instance.isUsed,
    };
