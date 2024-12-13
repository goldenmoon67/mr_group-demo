import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_request.freezed.dart';
part 'coupon_request.g.dart';

@freezed
class CouponRequest with _$CouponRequest {
  const factory CouponRequest({
    required String couponCode,
  }) = _CouponRequest;

  factory CouponRequest.fromJson(Map<String, dynamic> json) =>
      _$CouponRequestFromJson(json);
}
