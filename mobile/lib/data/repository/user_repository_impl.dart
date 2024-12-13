import 'package:deeplink_project_for_mr_group/core/repository/user_repository.dart';
import 'package:deeplink_project_for_mr_group/data/models/coupon/coupon_request.dart';

import 'package:deeplink_project_for_mr_group/data/models/user/user.dart';
import 'package:deeplink_project_for_mr_group/data/network/api_service.dart';
import 'package:deeplink_project_for_mr_group/locator.dart';

class UserRepositoryImpl extends UserRepository {
  final client = getIt<ApiService>();

  @override
  Future<User> sessionUser() async {
    return await client.sessionUser();
  }

  @override
  Future<void> useCoupon(CouponRequest request) async {
    await client.useCoupon(request);
  }
}
