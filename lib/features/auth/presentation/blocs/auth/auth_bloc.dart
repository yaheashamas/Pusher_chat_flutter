// import 'package:chat/features/auth/domain/entities/user/user_model.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';

// part 'auth_state.dart';
// part 'auth_event.dart';
// part 'auth_bloc.freezed.dart';

// class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
//   AuthBloc() : super(AuthState.inital()) {
//     on<Authenticated>((event, emit) {
//       emit(state.copyWith(
//         isAuthinticated: event.isAuthinticated,
//         token: event.token,
//         user: event.user,
//       ));
//     });
//   }

//   @override
//   AuthState? fromJson(Map<String, dynamic> json) {
//     return AuthState(
//       isAuthinticated: json['isAuthinticated'],
//       token: json['token'],
//       user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
//     );
//   }

//   @override
//   Map<String, dynamic>? toJson(AuthState state) {
//     return {
//       "isAuthinticated": state.isAuthinticated,
//       "token": state.token,
//       "user": state.user != null ? state.user!.toJson() : null,
//     };
//   }
// }
