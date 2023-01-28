import 'package:chat/features/auth/data/datasources/user_data_source.dart';
import 'package:chat/features/auth/data/repositories/user_repository_impli.dart';
import 'package:chat/features/auth/domain/repositories/user_repository.dart';
import 'package:chat/features/auth/domain/usecases/get_all_users_use_case.dart';
import 'package:chat/features/auth/domain/usecases/login_by_token_use_case.dart';
import 'package:chat/features/auth/domain/usecases/login_use_case.dart';
import 'package:chat/features/auth/domain/usecases/logout_use_case.dart';
import 'package:chat/features/auth/domain/usecases/register_use_case.dart';
import 'package:chat/features/auth/presentation/blocs/loading_cubit/loading_cubit.dart';
import 'package:chat/features/auth/presentation/blocs/user_cubit/user_cubit.dart';
import 'package:chat/features/auth/presentation/blocs/validate_bloc/validate_bloc.dart';
import 'package:chat/features/chat/data/datasources/chat_data_source.dart';
import 'package:chat/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:chat/features/chat/domain/repositories/chat_repository.dart';
import 'package:chat/features/chat/domain/usecases/create_chat_message_use_case.dart';
import 'package:chat/features/chat/domain/usecases/create_chat_use_case.dart';
import 'package:chat/features/chat/domain/usecases/get_chat_messages_use_case.dart';
import 'package:chat/features/chat/domain/usecases/get_chats_use_case.dart';
import 'package:chat/features/chat/domain/usecases/get_single_chat_use_case.dart';
import 'package:chat/features/chat/presentation/bloc/chat/chat_bloc.dart';
import 'package:chat/features/chat/presentation/bloc/search/search_cubit.dart';
import 'package:get_it/get_it.dart';

import 'features/auth/presentation/blocs/auth/auth_bloc.dart';

final getIt = GetIt.instance;
Future<void> configureInjection() async {
  //?datasoource
  getIt.registerLazySingleton<UserDataSource>(() => UserDataSourceImpl());
  getIt.registerLazySingleton<ChatDataSource>(() => ChatDataSourceImpl());

  //?repository
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpli(
        getIt(),
      ));
  getIt.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(
        getIt(),
      ));
  //?usecase
  //user => login,register,logout,all user
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
  getIt.registerLazySingleton<GetAllUsersUseCase>(() => GetAllUsersUseCase(
        getIt(),
      ));

  getIt.registerLazySingleton<CreateChatUseCase>(() => CreateChatUseCase(
        getIt(),
      ));
  getIt.registerLazySingleton<GetSingleChatUseCase>(() => GetSingleChatUseCase(
        getIt(),
      ));
  getIt.registerLazySingleton<GetChatUseCase>(() => GetChatUseCase(
        getIt(),
      ));
  //chat => create message,get all message
  getIt.registerLazySingleton<CreateChatMessageUseCase>(
    () => CreateChatMessageUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetAllChatMessagesUseCase>(
      () => GetAllChatMessagesUseCase(getIt()));
  //?bloc
  //loading,info user,validation
  getIt.registerSingleton<LoadingCubit>(LoadingCubit());
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit());
  getIt.registerFactory<ValidateBloc>(() => ValidateBloc());
  //login,register
  getIt.registerFactory<UserCubit>(() => UserCubit(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ));
  //search
  getIt.registerFactory<SearchCubit>(() => SearchCubit(
        getIt(),
        getIt(),
      ));
  //chat message
  getIt.registerFactory<ChatBloc>(() => ChatBloc(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ));
}
