import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deeplink_project_for_mr_group/core/repository/user_repository.dart';
import 'package:deeplink_project_for_mr_group/core/utils/exception_utils.dart';
import 'package:deeplink_project_for_mr_group/core/utils/user_manager.dart';
import 'package:deeplink_project_for_mr_group/data/models/coupon/coupon_request.dart';
import 'package:deeplink_project_for_mr_group/data/models/user/user.dart';
import 'package:deeplink_project_for_mr_group/locator.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  final UserManager userManager = getIt<UserManager>();
  UserBloc({required this.userRepository}) : super(const UserState.initial()) {
    on<StartUser>(_onAppStarted);
    on<UpdateBalance>(_onUpdateBalance);
    on<RefreshUser>(_refreshUser);
    on<UseCoupon>(_useCoupon);
  }

  Future<void> _onAppStarted(StartUser event, Emitter<UserState> emit) async {
    emit(const UserState.loading());

    try {
      final user = await userRepository.sessionUser();
      userManager.setUser(user);
      emit(UserState.loaded(user));
    } catch (ex, stacktrace) {
      String? message = ExceptionUtils.handleException(ex, stacktrace);

      emit(UserState.error(message ?? ""));
    }
  }

  Future<void> _onUpdateBalance(
      UpdateBalance event, Emitter<UserState> emit) async {
    emit(UserState.initial());
    final user = userManager.user!;
    final updatedUser = user.copyWith(balance: user.balance - event.amount);
    userManager.setUser(updatedUser);
    emit(UserState.loaded(updatedUser));
  }

  Future<void> _useCoupon(UseCoupon event, Emitter<UserState> emit) async {
    emit(UserState.initial());
    final user = userManager.user!;
    await userRepository.useCoupon(CouponRequest(couponCode: event.couponCode));
    final updatedCoupons = user.coupons.map((coupon) {
      if (coupon.code == event.couponCode) {
        return coupon.copyWith(isUsed: true);
      }
      return coupon;
    }).toList();
    final updatedUser = user.copyWith(coupons: updatedCoupons);
    userManager.setUser(updatedUser);
    emit(UserState.loaded(updatedUser));
  }

  FutureOr<void> _refreshUser(RefreshUser event, Emitter<UserState> emit) {
    final user = userManager.user!;

    emit(UserState.loaded(user));
  }
}
