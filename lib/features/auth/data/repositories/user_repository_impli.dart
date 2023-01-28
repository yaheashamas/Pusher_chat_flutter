import 'package:chat/core/error/error_handler_repository_impl.dart';
import 'package:chat/core/error/failures.dart';
import 'package:chat/features/auth/data/datasources/user_data_source.dart';
import 'package:chat/features/auth/domain/entities/requests/login/loginrequest.dart';
import 'package:chat/features/auth/domain/entities/requests/register/registerrequest.dart';
import 'package:chat/features/auth/domain/entities/user/user_model.dart';
import 'package:chat/features/auth/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpli extends BaseRepository implements UserRepository {
  final UserDataSource authDataSource;
  UserRepositoryImpli(this.authDataSource);

  @override
  Future<Either<Failure, AuthModel?>> login(LoginRequest loginRequest) async {
    return body(() async {
      var result = await authDataSource.login(loginRequest);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, AuthModel?>> loginByToken() async {
    return body(() async {
      var result = await authDataSource.loginByToken();
      return right(result);
    });
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    return body(() async {
      await authDataSource.logout();
      return right(unit);
    });
  }

  @override
  Future<Either<Failure, AuthModel?>> register(
    RegisterRequest registerRequest,
  ) async {
    return body(() async {
      var result = await authDataSource.register(registerRequest);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, List<UserModel>>> getAllUsers() async {
    return body(() async {
      var result = await authDataSource.getAllUsers();
      return right(result);
    });
  }
}
