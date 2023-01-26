import 'package:chat/core/validations/confirm_password.dart';
import 'package:chat/core/validations/email.dart';
import 'package:chat/core/validations/password.dart';
import 'package:chat/features/auth/presentation/blocs/validate_bloc/validate_event.dart';
import 'package:chat/features/auth/presentation/blocs/validate_bloc/validate_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidateBloc extends Bloc<ValidateEvent, ValidateState> {
  static ValidateBloc of(context) => BlocProvider.of(context);
  ValidateBloc() : super(ValidateState.inital()) {
    on<ValidateEmailEvent>((event, emit) {
      emit(state.copyWith(email: Email.dirty(event.value)));
    });
    on<ValidatePasswordEvent>((event, emit) {
      emit(state.copyWith(password: Password.dirty(event.value)));
    });
    on<ValidateConfirmPasswordEvent>((event, emit) {
      emit(
        state.copyWith(
          confirmPassword: ConfirmPassword.dirty(
            original: state.password,
            value: event.value,
          ),
        ),
      );
    });
    on<ValidatePassViewEvent>((event, emit) {
      emit(state.copyWith(passView: !state.passView));
    });
    on<ValidateConfPassViewEvent>((event, emit) {
      emit(state.copyWith(confPassview: !state.confPassview));
    });
  }
}
