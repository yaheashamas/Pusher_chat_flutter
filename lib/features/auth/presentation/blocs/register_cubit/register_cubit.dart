import 'package:chat/core/extensions/faliure_extention.dart';
import 'package:chat/features/auth/domain/entities/requests/register/registerrequest.dart';
import 'package:chat/features/auth/domain/usecases/register_use_case.dart';
import 'package:chat/features/auth/presentation/blocs/loading_cubit/loading_cubit.dart';
import 'package:chat/features/auth/presentation/blocs/register_cubit/register_state.dart';
import 'package:chat/features/auth/presentation/blocs/validate_bloc/validate_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  static RegisterCubit of(context) => BlocProvider.of(context);
  final RegisterUseCase registerUseCase;
  final LoadingCubit loadingCubit;
  final ValidateBloc validateBloc;
  RegisterCubit(
    this.loadingCubit,
    this.registerUseCase,
    this.validateBloc,
  ) : super(RegisterInitalState());

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
      (l) => emit(RegisterErrorState(l.errorMessage())),
      (r) => emit(RegisterSucccessState()),
    );
    loadingCubit.hide();
    emit(RegisterInitalState());
  }
}
