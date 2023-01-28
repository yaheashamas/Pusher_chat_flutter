import 'package:chat/core/error/failures.dart';
import 'package:intl/intl.dart';

extension StringHelper on String {
  String get messageFailure => (this as ServerFailure).error.toString();
  DateTime get parseDateTime =>
      DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(this).toLocal();
}
