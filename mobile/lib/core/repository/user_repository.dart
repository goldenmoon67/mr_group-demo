import 'package:deeplink_project_for_mr_group/data/models/coupon/coupon_request.dart';
import 'package:deeplink_project_for_mr_group/data/models/user/user.dart';

abstract class UserRepository {
  Future<User> sessionUser();
  Future<void> useCoupon(CouponRequest request);
}
