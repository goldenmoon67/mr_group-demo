part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class StartUser extends UserEvent {}

class RefreshUser extends UserEvent {}

class UseCoupon extends UserEvent {
  final String couponCode;

  const UseCoupon({required this.couponCode});
}

class UpdateBalance extends UserEvent {
  final double amount;

  const UpdateBalance(this.amount);

  @override
  List<Object?> get props => [amount];
}
