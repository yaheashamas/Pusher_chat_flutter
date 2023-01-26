import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterInitalState extends RegisterState {}

class RegisterSucccessState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String error;
  RegisterErrorState(this.error);
}
