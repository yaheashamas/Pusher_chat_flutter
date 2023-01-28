import 'package:chat/core/error/failures.dart';
import 'package:chat/features/auth/domain/entities/user/user_model.dart';
import 'package:chat/features/auth/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllUsersUseCase {
  UserRepository authRepository;
  GetAllUsersUseCase(this.authRepository);
  Future<Either<Failure, List<UserModel>>> call() async {
    return await authRepository.getAllUsers();
  }
}
