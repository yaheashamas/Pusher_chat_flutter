import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'package:chat/core/validations/confirm_password.dart';
import 'package:chat/core/validations/email.dart';
import 'package:chat/core/validations/password.dart';

class ValidateState extends Equatable {
  final Email email;
  final Password password;
  final ConfirmPassword confirmPassword;
  final bool passView;
  final bool confPassview;

  factory ValidateState.inital() {
    return const ValidateState(
      email: Email.pure(),
      password: Password.pure(),
      confirmPassword: ConfirmPassword.pure(),
      passView: true,
      confPassview: true,
    );
  }

  const ValidateState({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.passView,
    required this.confPassview,
  });

  bool get isSubmitLogin =>
      Formz.validate([email, password]) == FormzStatus.valid;

  bool get isSubmitRegister =>
      Formz.validate([email, password, confirmPassword]) == FormzStatus.valid;

  ValidateState copyWith({
    Email? email,
    Password? password,
    ConfirmPassword? confirmPassword,
    bool? passView,
    bool? confPassview,
  }) {
    return ValidateState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      passView: passView ?? this.passView,
      confPassview: confPassview ?? this.confPassview,
    );
  }

  @override
  List<Object> get props {
    return [
      email,
      password,
      confirmPassword,
      passView,
      confPassview,
    ];
  }
}
