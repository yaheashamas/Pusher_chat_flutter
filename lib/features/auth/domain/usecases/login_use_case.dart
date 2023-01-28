import 'package:chat/core/error/failures.dart';
import 'package:chat/features/auth/domain/entities/requests/login/loginrequest.dart';
import 'package:chat/features/auth/domain/entities/user/user_model.dart';
import 'package:chat/features/auth/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  UserRepository authRepository;
  LoginUseCase(this.authRepository);
  Future<Either<Failure, AuthModel?>> call(
    LoginRequest loginRequest,
  ) async {
    return await authRepository.login(loginRequest);
  }
}
