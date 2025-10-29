import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/custom_container.dart';
import 'package:stat_doctor/core/widgets/default_container.dart';


class HomeFilterCalendar extends StatelessWidget {
  final List<DateTime> selectedDates;
  final Function(List<DateTime>) onSelectedDatesChanged;
  const HomeFilterCalendar({super.key, required this.selectedDates, required this.onSelectedDatesChanged});

  static List<String> weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      padding: EdgeInsets.only(top: 30.h, right: 15.w, left: 15.w,),
      child: CalendarDatePicker2(
        config: CalendarDatePicker2Config(
          calendarViewScrollPhysics: const NeverScrollableScrollPhysics(),
          calendarType: CalendarDatePicker2Type.range,
          currentDate: DateTime.now(),
          selectedDayHighlightColor: Theme.of(context).primaryColor,
          controlsTextStyle: TextStyles.textViewBold16,
          disableModePicker: true,
          centerAlignModePicker: true,
          modePickersGap: 10.w,
          weekdayLabelBuilder: ({isScrollViewTopHeader, required weekday}) => Center(child: Text(weekdays[weekday], style: TextStyles.textViewBold13.copyWith(color: Theme.of(context).primaryColor))),
          nextMonthIcon: CustomContainer(
            size: 35,
            color: Theme.of(context).cardColor,
            border: Border.all(color: Theme.of(context).dividerColor),
            radius: 10.r,
            child: Icon(Icons.arrow_forward, color: Theme.of(context).colorScheme.onSurface, size: 16.r),
          ),
          firstDate: DateTime.now(),
          lastMonthIcon: CustomContainer(
            size: 35,
            color: Theme.of(context).cardColor,
            border: Border.all(color: Theme.of(context).dividerColor),
            radius: 10.r,
            child: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.onSurface, size: 16.r),
          ),
          modePickerBuilder: ({isMonthPicker, required monthDate, required viewMode}) => Center(
            child:  Text(DateFormat(isMonthPicker ==true ? 'MMMM' : 'yyyy', "en").format(monthDate), style: TextStyles.textViewBold16),
          ),
        ),
        value: selectedDates,
        onValueChanged: onSelectedDatesChanged,
      ),
    );
  }
}