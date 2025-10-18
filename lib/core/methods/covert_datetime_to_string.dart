import 'package:intl/intl.dart';

class ConvertDateTime {
  static String formatDateTimeToTime(String? inputDateTime) {
    if(inputDateTime == null) return "";
    DateTime dateTime = DateTime.parse(inputDateTime);
    DateTime timezoneDateTime = convertDateTimeToDeviceTimezone(dateTime);
    return DateFormat('hh:mm a').format(timezoneDateTime);
  }




  static String formatDateTimeToDate(String? inputDateTime) {
    if(inputDateTime == null) return "";
    DateTime dateTime = DateTime.parse(inputDateTime);
    DateTime timezoneDateTime = convertDateTimeToDeviceTimezone(dateTime);
    return DateFormat('yyyy-MM-dd').format(timezoneDateTime);
  }
  

  static String convertDateTimeToTime(DateTime dateTime) {
    DateTime timezoneDateTime = convertDateTimeToDeviceTimezone(dateTime);
    return DateFormat('hh:mm a').format(timezoneDateTime);
  }

  static String convertDateTimeToDate(DateTime dateTime, {String? format}) {
    DateTime timezoneDateTime = convertDateTimeToDeviceTimezone(dateTime);
    return DateFormat(format ?? 'yyyy-MM-dd').format(timezoneDateTime);
  }

  
  // Function to convert UTC DateTime to local timezone
  static DateTime convertDateTimeToDeviceTimezone(DateTime dateTime) {
    if (dateTime.isUtc) {
      return dateTime.toLocal();
    }
    return dateTime;
  }


  static String getDateRange(DateTime startDate, DateTime endDate) {
    String startDateString = ConvertDateTime.convertDateTimeToDate(startDate, format: 'MMM d, y');
    String endDateString = ConvertDateTime.convertDateTimeToDate(endDate, format: 'MMM d, y');
    return startDateString == endDateString ? startDateString : '$startDateString - $endDateString';
  }

  static String getTimeRange(DateTime startDate, DateTime endDate) {
    String startTime = ConvertDateTime.convertDateTimeToTime(startDate);
    String endTime = ConvertDateTime.convertDateTimeToTime(endDate);
    return startTime == endTime ? startTime : '$startTime - $endTime';
  }

  // Convert string date to UTC ISO format
  static String? convertStringToUtcIso(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      return DateTime.parse(dateString).toUtc().toIso8601String();
    } catch (e) {
      return null;
    }
  }
}