import 'package:deeplink_project_for_mr_group/bloc/auth/auth_bloc.dart';
import 'package:deeplink_project_for_mr_group/bloc/product/product_bloc.dart';
import 'package:deeplink_project_for_mr_group/bloc/user/user_bloc.dart';
import 'package:deeplink_project_for_mr_group/core/repository/auth_repository.dart';
import 'package:deeplink_project_for_mr_group/core/repository/product_repository.dart';
import 'package:deeplink_project_for_mr_group/core/repository/user_repository.dart';
import 'package:deeplink_project_for_mr_group/core/utils/log_console.dart';
import 'package:deeplink_project_for_mr_group/core/utils/token_manager.dart';
import 'package:deeplink_project_for_mr_group/core/utils/user_manager.dart';
import 'package:deeplink_project_for_mr_group/data/network/api_service.dart';
import 'package:deeplink_project_for_mr_group/data/network/dio_client.dart';
import 'package:deeplink_project_for_mr_group/data/repository/auth_repository_impl.dart';
import 'package:deeplink_project_for_mr_group/data/repository/product_repository_impl.dart';
import 'package:deeplink_project_for_mr_group/data/repository/user_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;

void setupLocator() {
  Logger logger = Logger(
    printer: SimplePrinter(colors: false),
    output: LogConsole.wrap(),
  );
  getIt.registerSingleton<Logger>(logger);
  getIt.registerSingleton(FlutterSecureStorage(
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
    aOptions: const AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  ));
  getIt.registerSingleton(TokenManager());
  getIt.registerSingleton(UserManager());

  getIt.registerSingleton<Dio>(DioClient.dio);
  getIt.registerSingleton(ApiService(getIt<Dio>()));
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl());

  getIt.registerFactory<UserBloc>(() => UserBloc(userRepository: getIt()));
  getIt.registerFactory<AuthBloc>(() => AuthBloc(authRepository: getIt()));
  getIt.registerFactory<ProductBloc>(
      () => ProductBloc(productRepository: getIt(), userBloc: getIt()));
}
