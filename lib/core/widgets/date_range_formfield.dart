import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/theme/calendar_theme.dart';
import 'package:stat_doctor/core/utils/validator.dart';
import 'package:stat_doctor/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class DateRangeFormfield extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;

  const DateRangeFormfield({
    required this.controller,
    this.hintText,
    this.labelText,
    super.key,
  });

  DateTimeRange? initialDateRange(String? dateRange) {
    if (dateRange == null || dateRange.isEmpty) return null;
    List<String> dates = dateRange.split(' - ');
    if (dates.length == 2) {
      DateTime startDate = DateTime.parse(dates[0]);
      DateTime endDate = DateTime.parse(dates[1]);
      return DateTimeRange(start: startDate, end: endDate);
    }
    return null;
  }

  void onTapDateRange({required BuildContext context}) {
    showDateRangePicker(
      context: context,
      initialDateRange: initialDateRange(controller.text),
      firstDate: DateTime.now().subtract(Duration(days: 365 * 100)),
      lastDate: DateTime.now().add(Duration(days: 365 * 100)),
      builder: (context, child) => Theme(data: CalendarTheme.getCalendarTheme(context),  child: child!),
    ).then((value) {
      if (value != null) {
        controller.text = "${value.start.toString().split(' ').first} - ${value.end.toString().split(' ').first}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      readOnly: true,
      onTap: () {
        onTapDateRange(context: context);
      },
      controller: controller,
      hintText: hintText,
      label: labelText,
      suffixIcon: AppIcons.calendar,
      validator: (value) => Validator.defaultValidator(value),
    );
  }
}