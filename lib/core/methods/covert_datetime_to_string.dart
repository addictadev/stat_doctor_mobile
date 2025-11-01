import 'package:intl/intl.dart';

class ConvertDateTime {
  static String formatDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date); 
}