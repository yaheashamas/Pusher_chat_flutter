import 'package:chat/features/auth/data/datasources/auth_data_source.dart';
import 'package:chat/features/auth/data/repositories/auth_repository_impli.dart';
import 'package:chat/features/auth/domain/repositories/auth_repository.dart';
import 'package:chat/features/auth/domain/usecases/login_by_token_use_case.dart';
import 'package:chat/features/auth/domain/usecases/login_use_case.dart';
import 'package:chat/features/auth/domain/usecases/logout_use_case.dart';
import 'package:chat/features/auth/domain/usecases/register_use_case.dart';
import 'package:chat/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:chat/features/auth/presentation/blocs/loading_cubit/loading_cubit.dart';
import 'package:chat/features/auth/presentation/blocs/login_cubit/login_cubit.dart';
import 'package:chat/features/auth/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:chat/features/auth/presentation/blocs/validate_bloc/validate_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> configureInjection() async {
  //datasoource
  getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());

  //repository
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpli(
        getIt(),
      ));
  //usecase
  getIt.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(
        getIt(),
      ));
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(
        getIt(),
      ));
  getIt.registerLazySingleton<LoginByTokenUseCase>(() => LoginByTokenUseCase(
        getIt(),
      ));
  getIt.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(
        getIt(),
      ));
  //bloc
  getIt.registerSingleton<LoadingCubit>(LoadingCubit());
  // getIt.registerLazySingleton<AuthBloc>(() => AuthBloc());
  getIt.registerFactory<ValidateBloc>(() => ValidateBloc());
  getIt.registerFactory<LoginCubit>(() => LoginCubit(
        getIt(),
        getIt(),
        getIt(),
      ));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(
        getIt(),
        getIt(),
        getIt(),
      ));
}
