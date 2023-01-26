abstract class Failure {}

class ServerFailure extends Failure {
  String error;
  ServerFailure({required this.error});
}

class UnknownFailure extends Failure {}

class CacheFailure extends Failure {}

class OffLineFailure extends Failure {}
