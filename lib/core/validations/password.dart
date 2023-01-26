import 'package:formz/formz.dart';

class Password extends FormzInput<String, String> {
  const Password.pure() : super.pure('');
  const Password.dirty(String value) : super.dirty(value);

  static final RegExp _password = RegExp(r"^[A-Za-z1-9\d@$!%*#?&]{8,}$");

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return "Password is Required";
    } else if (!_password.hasMatch(value)) {
      return "Must include at least 8 letters";
    } else {
      return null;
    }
  }
}
