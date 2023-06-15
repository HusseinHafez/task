import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task/core/api/dio_consumer.dart';
import 'package:task/core/repository/sign_in_repo/sign_in_repo_imple.dart';
import 'package:task/core/repository/sign_up_repo/sign_up_repo_imple.dart';
import 'package:task/modules/bottom_nav_screen/controller/bottom_nav_cubit.dart';
import 'package:task/modules/sign_in_screen/controller/signin_cubit.dart';
import 'package:task/modules/sign_up_screen/view/controller/signup_cubit.dart';

import '../../modules/home_screen/controller/home_cubit.dart';
import '../api/dio_interceptor.dart';
import '../repository/home_repo/home_repo_imple.dart';

final GetIt getIt = GetIt.instance;

Future<void> getItInit() async {
  // sign up
  getIt.registerLazySingleton<SignUpRepoImple>(
    () => SignUpRepoImple(),
  );
  getIt.registerLazySingleton<SignupCubit>(
    () => SignupCubit(signUpRepoImple: getIt()),
  );
  // sign in
  getIt.registerLazySingleton<SignInRepoImple>(
    () => SignInRepoImple(),
  );
  getIt.registerLazySingleton<SigninCubit>(
    () => SigninCubit(signInRepoImple: getIt()),
  );
  // dio_interceptors
  getIt.registerLazySingleton<DioInterceptor>(
    () => DioInterceptor(),
  );
  getIt.registerLazySingleton<LogInterceptor>(() => LogInterceptor(
        request: true,
        error: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ));



  // dio
  getIt.registerLazySingleton<DioConsumer>(
    () => DioConsumer(
      client: Dio(),
    ),
  );
  //home

  getIt.registerLazySingleton<HomeRepoImple>(
    () => HomeRepoImple(
      dio: getIt(),
    ),
  );
  getIt.registerLazySingleton<HomeCubit>(
    () => HomeCubit(
      homeRepoImple: getIt(),
    ),
  );

  // BottomNav
  getIt.registerLazySingleton<BottomNavCubit>(
    () => BottomNavCubit(),
  );
}
