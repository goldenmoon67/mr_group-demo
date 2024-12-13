import 'package:deeplink_project_for_mr_group/data/models/auth/login/login_request.dart';
import 'package:deeplink_project_for_mr_group/data/models/auth/login/login_response.dart';
import 'package:deeplink_project_for_mr_group/data/models/auth/register/register_request.dart';
import 'package:deeplink_project_for_mr_group/data/models/auth/token/refresh_token_request.dart';
import 'package:deeplink_project_for_mr_group/data/models/auth/token/refresh_token_response.dart';

abstract class AuthRepository {
  Future<void> register(RegisterRequest request);
  Future<LoginResponse> login(LoginRequest request);
  Future<RefreshTokenResponse> refreshToken(RefreshTokenRequest request);
}
