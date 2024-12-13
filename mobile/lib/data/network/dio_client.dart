import 'dart:io';

import 'package:deeplink_project_for_mr_group/core/utils/token_manager.dart';
import 'package:deeplink_project_for_mr_group/data/network/interceptors/auth_interceptor.dart';
import 'package:deeplink_project_for_mr_group/data/network/interceptors/error_interceptor.dart';
import 'package:deeplink_project_for_mr_group/locator.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:logger/logger.dart';

class DioClient {
  static final DioClient _singleton = DioClient._internal();
  final tokenManager = getIt<TokenManager>();

  factory DioClient() {
    return _singleton;
  }

  late Dio _dio;

  static Dio get dio => _singleton._dio;

  DioClient._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: Platform.isAndroid
          ? dotenv.env['BASE_URL_ANDROID'] ?? ""
          : dotenv.env['BASE_URL_IOS'] ?? "",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
      },
    ));
    _dio.interceptors.add(AuthInterceptor(_dio, tokenManager));

    if (kDebugMode) {
      final logger = getIt<Logger>();
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        logPrint: (object) => logger.i(object),
      ));
    }
    if (kDebugMode) {
      (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      };
    }
    _dio.interceptors.add(ErrorInterceptor());
  }
}
