// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['_id'] as String,
      email: json['email'] as String,
      referralId: json['referralId'] as String,
      name: json['name'] as String,
      balance: (json['balance'] as num).toDouble(),
      referralLink: json['referralLink'] as String,
      coupons: (json['coupons'] as List<dynamic>?)
              ?.map((e) => Coupon.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'referralId': instance.referralId,
      'name': instance.name,
      'balance': instance.balance,
      'referralLink': instance.referralLink,
      'coupons': instance.coupons,
    };
