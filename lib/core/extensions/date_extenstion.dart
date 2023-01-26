import 'package:intl/intl.dart';

extension DateTimeHelper on String {
  DateTime get convertDate =>
      DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUtc(this).toLocal();

  String get convertDateWithTime => DateFormat.yMd().add_jms().format(this.convertDate);
}
