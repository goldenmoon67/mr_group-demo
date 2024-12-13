import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CheckTokenStatus extends AuthEvent {}

class RefreshToken extends AuthEvent {
  final String refreshToken;

  const RefreshToken(this.refreshToken);
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class RegisterRequested extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String? referralLink;

  const RegisterRequested(this.referralLink,
      {required this.name, required this.email, required this.password});

  @override
  List<Object> get props => [name, email, password];
}
