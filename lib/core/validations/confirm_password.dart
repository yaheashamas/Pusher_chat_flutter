import 'package:chat/core/validations/password.dart';
import 'package:formz/formz.dart';

class ConfirmPassword extends FormzInput<String, String> {
  final Password original;

  const ConfirmPassword.pure()
      : original = const Password.pure(),
        super.pure('');

  const ConfirmPassword.dirty({
    required this.original,
    required String value,
  }) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return "Confirm password is empty";
    } else if (original.value != value) {
      return "password does not match";
    } else {
      return null;
    }
  }
}
