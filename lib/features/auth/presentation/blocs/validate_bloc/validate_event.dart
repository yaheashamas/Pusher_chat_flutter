import 'package:equatable/equatable.dart';

class ValidateEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ValidateEmailEvent extends ValidateEvent {
  final String value;
  ValidateEmailEvent(this.value);
}

class ValidatePasswordEvent extends ValidateEvent {
  final String value;
  ValidatePasswordEvent(this.value);
}

class ValidateConfirmPasswordEvent extends ValidateEvent {
  final String value;
  ValidateConfirmPasswordEvent(this.value);
}

class ValidatePassViewEvent extends ValidateEvent {}

class ValidateConfPassViewEvent extends ValidateEvent {}
