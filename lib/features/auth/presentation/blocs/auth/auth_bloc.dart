import 'package:chat/features/auth/domain/entities/user/user_model.dart';
import 'package:chat/features/auth/presentation/blocs/auth/auth_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit() : super(AuthState.inital());
  void authenticated({
    required bool isAuthinticated,
    required String? token,
    required UserModel? user,
  }) {
    emit(state.copyWith(
      isAuthinticated: isAuthinticated,
      token: token,
      user: user,
    ));
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState(
      isAuthinticated: json['isAuthinticated'],
      token: json['token'],
      user: json['user'] != null ? UserModel.fromMap(json['user']) : null,
    );
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return {
      "isAuthinticated": state.isAuthinticated,
      "token": state.token,
      "user": state.user != null ? state.user!.toMap() : null,
    };
  }
}