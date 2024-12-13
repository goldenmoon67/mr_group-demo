part of 'user_bloc.dart';

enum UserStatus { initial, loading, loaded, error }

class UserState extends Equatable {
  final UserStatus status;
  final User? user;
  final String? errorMessage;

  const UserState._({required this.status, this.user, this.errorMessage});

  const UserState.initial() : this._(status: UserStatus.initial);
  const UserState.loading() : this._(status: UserStatus.loading);
  const UserState.loaded(User user)
      : this._(status: UserStatus.loaded, user: user);
  const UserState.error(String message)
      : this._(status: UserStatus.error, errorMessage: message);

  @override
  List<Object?> get props => [status, user, errorMessage];
}
