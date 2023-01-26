import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'failures.dart';

typedef SafeCallBody<RV> = Future<Either<Failure, RV>> Function();

class BaseRepository {
  BaseRepository();

  Future<Either<Failure, RV>> body<RV>(SafeCallBody<RV> body) async {
    try {
      return await body();
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return left(OffLineFailure());
      } else {
        return left(ServerFailure(error: e.response!.data['message']));
      }
    }
  }
}
