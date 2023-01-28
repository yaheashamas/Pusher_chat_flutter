import 'package:chat/core/extensions/faliure_extention.dart';
import 'package:chat/features/auth/domain/entities/requests/login/loginrequest.dart';
import 'package:chat/features/auth/domain/entities/requests/register/registerrequest.dart';
import 'package:chat/features/auth/domain/usecases/login_use_case.dart';
import 'package:chat/features/auth/domain/usecases/register_use_case.dart';
import 'package:chat/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:chat/features/auth/presentation/blocs/loading_cubit/loading_cubit.dart';
import 'package:chat/features/auth/presentation/blocs/user_cubit/user_state.dart';
import 'package:chat/features/auth/presentation/blocs/validate_bloc/validate_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final LoadingCubit loadingCubit;
  final ValidateBloc validateBloc;
  final AuthCubit authCubit;
  UserCubit(
    this.authCubit,
    this.loadingCubit,
    this.loginUseCase,
    this.registerUseCase,
    this.validateBloc,
  ) : super(UserInitalState());

  registerUser() async {
    loadingCubit.show();
    var result = await registerUseCase(
      RegisterRequest(
        email: validateBloc.state.email.value,
        password: validateBloc.state.password.value,
        password_confirmation: validateBloc.state.confirmPassword.value,
      ),
    );
    result.fold(
      (l) => emit(UserRegisterErrorState(l.errorMessage())),
      (r) {
        authCubit.authenticated(
          isAuthinticated: true,
          token: r!.token,
          user: r.user,
        );
        emit(UserRegisterSucccessState());
      },
    );
    loadingCubit.hide();
    emit(UserInitalState());
  }

  loginUser() async {
    loadingCubit.show();

    final result = await loginUseCase(LoginRequest(
      email: validateBloc.state.email.value,
      password: validateBloc.state.password.value,
    ));

    result.fold(
      (l) => emit(UserLoginErrorState(l.errorMessage())),
      (r) {
        authCubit.authenticated(
          isAuthinticated: true,
          token: r!.token,
          user: r.user,
        );
        emit(UserLoginSuccessState());
      },
    );

    loadingCubit.hide();
    emit(UserInitalState());
  }

  logout() {
    authCubit.authenticated(
      isAuthinticated: false,
      token: null,
      user: null,
    );
  }
}
