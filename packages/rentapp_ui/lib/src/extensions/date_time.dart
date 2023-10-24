import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String get toBirthdate {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String get monthDayYear => DateFormat.yMMMMd().format(toLocal());
}
