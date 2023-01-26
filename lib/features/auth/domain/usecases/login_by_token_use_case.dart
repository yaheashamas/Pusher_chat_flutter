import 'package:chat/core/error/failures.dart';
import 'package:chat/features/auth/domain/entities/user/user_model.dart';
import 'package:chat/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginByTokenUseCase {
  AuthRepository authRepository;
  LoginByTokenUseCase(this.authRepository);
  Future<Either<Failure, AuthModel?>> call() async {
    return await authRepository.loginByToken();
  }
}
