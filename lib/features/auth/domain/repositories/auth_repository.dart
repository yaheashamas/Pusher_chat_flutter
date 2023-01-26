import 'package:chat/core/error/failures.dart';
import 'package:chat/features/auth/domain/entities/requests/login/loginrequest.dart';
import 'package:chat/features/auth/domain/entities/requests/register/registerrequest.dart';
import 'package:chat/features/auth/domain/entities/user/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthModel?>> register(RegisterRequest registerRequest);
  Future<Either<Failure, AuthModel?>> login(LoginRequest loginRequest);
  Future<Either<Failure, AuthModel?>> loginByToken();
  Future<Either<Failure, Unit>> logout();
}
