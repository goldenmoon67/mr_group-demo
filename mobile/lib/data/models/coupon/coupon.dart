import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon.freezed.dart';
part 'coupon.g.dart';

@freezed
class Coupon with _$Coupon {
  const factory Coupon({
    @JsonKey(name: "_id") required String id,
    required String code,
    required bool isUsed,
  }) = _Coupon;

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);
}
