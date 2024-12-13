import 'package:equatable/equatable.dart';

enum AuthStatus {
  initial,
  checking,
  loading,
  authenticated,
  unauthenticated,
  error
}

class AuthState extends Equatable {
  final AuthStatus status;
  final String? errorMessage;

  const AuthState._({required this.status, this.errorMessage});

  const AuthState.initial() : this._(status: AuthStatus.initial);
  const AuthState.loading() : this._(status: AuthStatus.loading);
  const AuthState.checking() : this._(status: AuthStatus.checking);

  const AuthState.authenticated() : this._(status: AuthStatus.authenticated);
  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);
  const AuthState.error(String message)
      : this._(status: AuthStatus.error, errorMessage: message);

  @override
  List<Object?> get props => [status, errorMessage];
}
