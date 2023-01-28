import 'package:chat/core/error/failures.dart';
import 'package:chat/features/auth/domain/entities/requests/register/registerrequest.dart';
import 'package:chat/features/auth/domain/entities/user/user_model.dart';
import 'package:chat/features/auth/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase {
  UserRepository authRepository;
  RegisterUseCase(this.authRepository);
  Future<Either<Failure, AuthModel?>> call(
    RegisterRequest registerRequest,
  ) async {
    return await authRepository.register(registerRequest);
  }
}
