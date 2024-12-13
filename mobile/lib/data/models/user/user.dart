import 'package:deeplink_project_for_mr_group/data/models/coupon/coupon.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: "_id") required String id,
    required String email,
    required String referralId,
    required String name,
    required double balance,
    required String referralLink,
    @Default([]) List<Coupon> coupons,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
