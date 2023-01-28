import 'package:equatable/equatable.dart';
import 'package:chat/features/auth/domain/entities/user/user_model.dart';

class AuthState extends Equatable {
  final bool isAuthinticated;
  final UserModel? user;
  final String? token;
  factory AuthState.inital() {
    return const AuthState(
      isAuthinticated: false,
      token: null,
      user: null,
    );
  }
  const AuthState({
    required this.isAuthinticated,
    this.user,
    this.token,
  });

  AuthState copyWith({
    bool? isAuthinticated,
    UserModel? user,
    String? token,
  }) {
    return AuthState(
      isAuthinticated: isAuthinticated ?? this.isAuthinticated,
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  @override
  List<Object> get props => [isAuthinticated];
}
