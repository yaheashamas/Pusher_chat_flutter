import 'package:chat/core/extensions/faliure_extention.dart';
import 'package:chat/features/auth/domain/entities/requests/login/loginrequest.dart';
import 'package:chat/features/auth/domain/usecases/login_use_case.dart';
import 'package:chat/features/auth/presentation/blocs/loading_cubit/loading_cubit.dart';
import 'package:chat/features/auth/presentation/blocs/login_cubit/login_state.dart';
import 'package:chat/features/auth/presentation/blocs/validate_bloc/validate_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  static LoginCubit of(context) => BlocProvider.of(context);

  LoginUseCase loginUseCase;
  LoadingCubit loadingCubit;
  ValidateBloc validateBloc;

  LoginCubit(
    this.loadingCubit,
    this.loginUseCase,
    this.validateBloc,
  ) : super(LoginInitailState());

  loginUser() async {
    loadingCubit.show();

    final result = await loginUseCase(LoginRequest(
      email: validateBloc.state.email.value,
      password: validateBloc.state.password.value,
    ));

    result.fold(
      (l) => emit(LoginErrorState(l.errorMessage())),
      (r) => emit(LoginSuccessState()),
    );

    loadingCubit.hide();
    emit(LoginInitailState());
  }
}
