import 'package:chat/core/error/failures.dart';
import 'package:chat/features/auth/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class LogoutUseCase {
  UserRepository authRepository;
  LogoutUseCase(this.authRepository);
  Future<Either<Failure, Unit>> call() async {
    return await authRepository.logout();
  }
}
