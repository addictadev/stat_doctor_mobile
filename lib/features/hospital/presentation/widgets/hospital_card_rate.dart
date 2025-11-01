import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/methods/covert_datetime_to_string.dart';
import 'package:stat_doctor/features/home/data/models/shift_day_vo.dart';

class HospitalCardRate extends StatelessWidget {
  final ShiftDayVO shiftDayVO;
  const HospitalCardRate({required this.shiftDayVO, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: AppColors.green.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          Row(
            spacing: 10.w,
            children: [
              AppIcons.icon(icon: AppIcons.calendar, size: 18, color: Theme.of(context).hintColor),
              Expanded(child: Text(ConvertDateTime.formatDateTimeToDay(shiftDayVO.shiftsDays), style: TextStyles.textViewSemiBold12,)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.w,
            children: [
              AppIcons.icon(icon: AppIcons.clock, size: 18, color: Theme.of(context).hintColor),
              Expanded(child: Text("${ConvertDateTime.formatDateTimeToTime(shiftDayVO.startTimeS)} - ${ConvertDateTime.formatDateTimeToTime(shiftDayVO.endTimeS)} (${shiftDayVO.durationTime})", style: TextStyles.textViewSemiBold12,)),
            ],
          )
        ],
      ),
    );
  }
}