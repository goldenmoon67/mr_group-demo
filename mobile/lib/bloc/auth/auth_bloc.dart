import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deeplink_project_for_mr_group/core/repository/auth_repository.dart';
import 'package:deeplink_project_for_mr_group/core/utils/exception_utils.dart';
import 'package:deeplink_project_for_mr_group/core/utils/token_manager.dart';
import 'package:deeplink_project_for_mr_group/data/models/auth/login/login_request.dart';
import 'package:deeplink_project_for_mr_group/data/models/auth/register/register_request.dart';
import 'package:deeplink_project_for_mr_group/data/models/auth/token/refresh_token_request.dart';
import 'package:deeplink_project_for_mr_group/locator.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final tokenManager = getIt<TokenManager>();
  AuthBloc({required this.authRepository}) : super(const AuthState.initial()) {
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<CheckTokenStatus>(_onCheckTokenStatus);
    on<RefreshToken>(_onRefreshToken);
  }
  Future<void> _onCheckTokenStatus(
      CheckTokenStatus event, Emitter<AuthState> emit) async {
    emit(const AuthState.checking());

    try {
      final isExpired = await tokenManager.isAccessTokenExpired();
      if (isExpired) {
        final refreshToken = await tokenManager.getRefreshToken();
        if (refreshToken != null) {
          add(RefreshToken(refreshToken));
        } else {
          emit(const AuthState.unauthenticated());
        }
      } else {
        emit(const AuthState.authenticated());
      }
    } catch (ex, stacktrace) {
      String? message = ExceptionUtils.handleException(ex, stacktrace);
      emit(AuthState.error(message ?? ""));
    }
  }

  Future<void> _onRefreshToken(
      RefreshToken event, Emitter<AuthState> emit) async {
    try {
      final response = await authRepository
          .refreshToken(RefreshTokenRequest(refreshToken: event.refreshToken));
      final newAccessToken = response.accessToken;
      await tokenManager.saveAccessToken(newAccessToken);
      emit(const AuthState.authenticated());
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _onLoginRequested(
      LoginRequested event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      var loginResponse = await authRepository
          .login(LoginRequest(email: event.email, password: event.password));

      await tokenManager.saveTokens(loginResponse.accessToken,
          loginResponse.refreshToken, loginResponse.expiresIn);
      emit(const AuthState.authenticated());
    } catch (ex, stacktrace) {
      String? message = ExceptionUtils.handleException(ex, stacktrace);
      emit(AuthState.error(message ?? ""));
    }
  }

  Future<void> _onRegisterRequested(
      RegisterRequested event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      await authRepository.register(
        RegisterRequest(
          name: event.name,
          email: event.email,
          password: event.password,
          referredBy: event.referralLink,
        ),
      );
      emit(const AuthState.authenticated());
    } catch (ex, stacktrace) {
      String? message = ExceptionUtils.handleException(ex, stacktrace);
      emit(AuthState.error(message ?? ""));
    }
  }
}
