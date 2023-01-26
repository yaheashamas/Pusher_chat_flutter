import 'package:chat/core/error/failures.dart';

extension FailureExtention on Failure {
  String errorMessage() {
    if (this is ServerFailure) {
      return (this as ServerFailure).error.toString();
    } else {
      return "check about your internet";
    }
  }
}
