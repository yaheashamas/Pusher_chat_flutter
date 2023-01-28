import 'package:chat/core/end_point.dart';
import 'package:chat/core/utils/dio_client/api.dart';
import 'package:chat/features/auth/domain/entities/requests/login/loginrequest.dart';
import 'package:chat/features/auth/domain/entities/requests/register/registerrequest.dart';
import 'package:chat/features/auth/domain/entities/user/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserDataSource {
  Future<AuthModel?> register(RegisterRequest registerRequest);
  Future<AuthModel?> login(LoginRequest loginRequest);
  Future<AuthModel?> loginByToken();
  Future<List<UserModel>> getAllUsers();
  Future<Unit> logout();
}

class UserDataSourceImpl extends UserDataSource {
  @override
  Future<AuthModel?> register(RegisterRequest registerRequest) async {
    final response = await Api.dio.post(
      Endpoints.register,
      data: registerRequest.toJson(),
    );
    return AuthModel.fromMap(response.data['data']);
  }

  @override
  Future<AuthModel?> login(LoginRequest loginRequest) async {
    final response = await Api.dio.post(
      Endpoints.login,
      data: loginRequest.toJson(),
    );
    return AuthModel.fromMap(response.data['data']);
  }

  @override
  Future<AuthModel?> loginByToken() async {
    final response = await Api.dio.post(Endpoints.loginWithToken);
    return AuthModel.fromMap(response.data);
  }

  @override
  Future<Unit> logout() async {
    await Api.dio.get(Endpoints.logout);
    return Future.value(unit);
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    final response = await Api.dio.get(Endpoints.getUsers);
    List<UserModel> users = [];
    response.data['data'].forEach(
      (user) => {
        users.add(UserModel.fromMap(user)),
      },
    );
    return users;
  }
}
