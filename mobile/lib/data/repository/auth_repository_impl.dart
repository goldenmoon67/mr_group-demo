import 'package:deeplink_project_for_mr_group/core/repository/auth_repository.dart';
import 'package:deeplink_project_for_mr_group/data/models/auth/login/login_request.dart';
import 'package:deeplink_project_for_mr_group/data/models/auth/login/login_response.dart';
import 'package:deeplink_project_for_mr_group/data/models/auth/register/register_request.dart';
import 'package:deeplink_project_for_mr_group/data/models/auth/token/refresh_token_request.dart';
import 'package:deeplink_project_for_mr_group/data/models/auth/token/refresh_token_response.dart';
import 'package:deeplink_project_for_mr_group/data/network/api_service.dart';
import 'package:deeplink_project_for_mr_group/locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  final client = getIt<ApiService>();
  @override
  Future<void> register(RegisterRequest request) async {
    await client.register(request);
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    return await client.login(request);
  }

  @override
  Future<RefreshTokenResponse> refreshToken(RefreshTokenRequest request) async {
    return await client.refreshToken(request);
  }
}
