import 'package:intl/intl.dart';

class ConvertDateTime {
  static String formatDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date); 

  static String formatDateTimeToDay(DateTime date) => DateFormat('EEE, dd MMM yyyy').format(date);

  static String formatDateTimeToTime(DateTime date) => DateFormat('h:mm a').format(date);
}