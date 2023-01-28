import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserInitalState extends UserState {}
//login
class UserLoginSuccessState extends UserState {}

class UserLoginErrorState extends UserState {
  final String error;
  UserLoginErrorState(this.error);
}

//register
class UserRegisterSucccessState extends UserState {}

class UserRegisterErrorState extends UserState {
  final String error;
  UserRegisterErrorState(this.error);
}

//logout
class UserLogoutState extends UserState {}