import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/storage/data/storage.dart';
import 'package:stat_doctor/core/widgets/custom_container.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeFilterCalendar extends StatefulWidget {
  final DateTime? selectedDay;
  final Function(DateTime) onDaySelected;
  const HomeFilterCalendar({super.key, this.selectedDay, required this.onDaySelected});
  @override
  State<HomeFilterCalendar> createState() => _HomeFilterCalendarState();
}

class _HomeFilterCalendarState extends State<HomeFilterCalendar> {
  DateTime kToday = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: TableCalendar(
          firstDay: DateTime(kToday.year-1, kToday.month - 3, kToday.day),
          lastDay: DateTime(kToday.year, kToday.month + 3, kToday.day),
          focusedDay: widget.selectedDay ?? _focusedDay,
          currentDay: widget.selectedDay ?? DateTime.now(),
          calendarFormat: _calendarFormat,
          calendarBuilders: CalendarBuilders(
            headerTitleBuilder: (context, date) => Center(child: Text(DateFormat('MMMM yyyy', sl<Storage>().getLang()).format(date), style: TextStyles.textViewBold16)),
            defaultBuilder: (context, day, focusedDay) => Center(child: Text(day.day.toString(), style: TextStyles.textViewRegular16)),
            todayBuilder: (context, day, focusedDay) => Center(child: Text(day.day.toString(), style: TextStyles.textViewRegular16.copyWith(color: Theme.of(context).primaryColor))),
            selectedBuilder: (context, day, focusedDay) => Center(
              child: CustomContainer(
                color: Theme.of(context).primaryColor,
                margin: EdgeInsets.all(5.r),
                radius: 10.r,
                child: Text(day.day.toString(), style: TextStyles.textViewRegular16.copyWith(color: AppColors.cardColorLight)),
              ),
            ),

          ),
          availableGestures: AvailableGestures.none,
          headerStyle: HeaderStyle(
            headerPadding: EdgeInsets.symmetric(vertical: 15.h),
            leftChevronPadding: EdgeInsets.zero,
            rightChevronPadding: EdgeInsets.zero,
            rightChevronMargin: EdgeInsets.zero,
            leftChevronMargin: EdgeInsets.zero,
            headerMargin: EdgeInsets.zero,
            titleCentered: true,
            formatButtonVisible: false,
            rightChevronIcon: CustomContainer(
              size: 35,
              color: Theme.of(context).cardColor,
              border: Border.all(color: Theme.of(context).dividerColor),
              radius: 10.r,
              child: Icon(Icons.arrow_forward, color: Theme.of(context).colorScheme.onSurface, size: 15.r),
            ),
            leftChevronIcon: CustomContainer(
              size: 35,
              color: Theme.of(context).cardColor,
              border: Border.all(color: Theme.of(context).dividerColor),
              radius: 10.r,
              child: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.onSurface, size: 15.r),
            )
          ),

          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyles.textViewMedium14.copyWith(color: Theme.of(context).primaryColor),
            weekendStyle: TextStyles.textViewMedium14.copyWith(color: Theme.of(context).primaryColor),
          ),
          selectedDayPredicate: (day) {return isSameDay(_selectedDay, day);},
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              widget.onDaySelected(selectedDay);
            });}
          },
          onFormatChanged: (format) {if (_calendarFormat != format) {setState(() {_calendarFormat = format;});}},
          onPageChanged: (focusedDay) {_focusedDay = focusedDay;},
        ),
    );
  }
}