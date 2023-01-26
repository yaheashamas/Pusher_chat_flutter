import 'package:formz/formz.dart';

class Email extends FormzInput<String, String> {
  const Email.pure() : super.pure('');
  const Email.dirty(String value) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((([a-zA-Z\-0-9]+\.)+[a-zA-Z]{3,}))$',
    multiLine: false,
    caseSensitive: false,
  );

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return "email is Required";
    } else if (!_emailRegExp.hasMatch(value)) {
      return "format email address not correct";
    } else {
      return null;
    }
  }
}
