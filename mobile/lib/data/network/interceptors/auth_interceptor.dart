import 'package:deeplink_project_for_mr_group/core/repository/auth_repository.dart';
import 'package:deeplink_project_for_mr_group/core/utils/token_manager.dart';
import 'package:deeplink_project_for_mr_group/data/models/auth/token/refresh_token_request.dart';
import 'package:deeplink_project_for_mr_group/data/models/common/error_model.dart';
import 'package:deeplink_project_for_mr_group/locator.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final TokenManager tokenManager;
  void Function(Exception error)? onInvalid;

  AuthInterceptor(this._dio, this.tokenManager, {this.onInvalid});

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await tokenManager.getAccessToken();
    if (accessToken != null) {
      options.headers["Authorization"] = accessToken;
    }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    bool isTokenExpired = err.response?.statusCode == 401;
    if (!isTokenExpired && err.response?.statusCode == 403) {
      final response = err.response;
      if (response != null && response.data is Map<String, dynamic>) {
        final errorModel =
            ErrorModel.fromJson(response.data as Map<String, dynamic>);
        final message = errorModel.message;
        if (message != null && message.contains("Invalid Token")) {
          isTokenExpired = true;
        }
      }
    }

    if (isTokenExpired) {
      RequestOptions requestOptions = err.requestOptions;

      final accessToken = await tokenManager.getAccessToken();
      final bearerToken = "$accessToken";
      if (bearerToken != requestOptions.headers['Authorization']) {
        requestOptions.headers['Authorization'] = bearerToken;
        try {
          final response = await _dio.fetch(requestOptions);
          handler.resolve(response);
        } catch (err) {
          if (err is DioException) {
            handler.reject(err);
          } else {
            final dioError =
                DioException(requestOptions: requestOptions, error: err);
            handler.reject(dioError);
          }
        }
        return;
      }

      try {
        var authRepository = getIt<AuthRepository>();

        final oauthToken = await authRepository
            .refreshToken(RefreshTokenRequest(refreshToken: accessToken ?? ""));
        requestOptions.headers["Authorization"] = oauthToken.accessToken;

        final response = await _dio.fetch(requestOptions);
        handler.resolve(response);
      } catch (err) {
        if (err is DioException) {
          handler.reject(err);
        } else {
          final dioError =
              DioException(requestOptions: requestOptions, error: err);
          handler.reject(dioError);
        }
      }
    } else {
      super.onError(err, handler);
    }
  }
}
