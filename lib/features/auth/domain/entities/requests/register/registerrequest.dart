import 'dart:convert';

import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable {
  final String email;
  final String password;
  final String password_confirmation;
  const RegisterRequest({
    required this.email,
    required this.password,
    required this.password_confirmation,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'password_confirmation': password_confirmation,
    };
  }

  factory RegisterRequest.fromMap(Map<String, dynamic> map) {
    return RegisterRequest(
      email: map['email'],
      password: map['password'],
      password_confirmation: map['password_confirmation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterRequest.fromJson(String source) =>
      RegisterRequest.fromMap(json.decode(source));

  @override
  List<Object> get props => [email, password, password_confirmation];
}
