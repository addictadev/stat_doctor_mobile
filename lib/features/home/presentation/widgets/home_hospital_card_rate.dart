import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/methods/covert_datetime_to_string.dart';
import 'package:stat_doctor/core/widgets/custom_rich_text.dart';
import 'package:stat_doctor/features/home/data/models/home_shift_model.dart';

class HomeHospitalCardRate extends StatelessWidget {
  final HomeShiftModel homeShiftModel;
  const HomeHospitalCardRate({required this.homeShiftModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.h,
              children: [
                Row(
                  spacing: 10.w,
                  children: [
                    AppIcons.icon(icon: AppIcons.calendar, size: 18, color: Theme.of(context).hintColor),
                    Expanded(child: Text(ConvertDateTime.formatDateTimeToDay(homeShiftModel.shiftsDaysVOList.first.shiftsDays), style: TextStyles.textViewSemiBold12,)),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10.w,
                  children: [
                    AppIcons.icon(icon: AppIcons.clock, size: 18, color: Theme.of(context).hintColor),
                    Expanded(child: Text("${ConvertDateTime.formatDateTimeToTime(homeShiftModel.shiftsDaysVOList.first.startTimeS)} - ${ConvertDateTime.formatDateTimeToTime(homeShiftModel.shiftsDaysVOList.first.endTimeS)} (${homeShiftModel.shiftsDaysVOList.first.durationTime})", style: TextStyles.textViewSemiBold12,)),
                  ],
                )
              ],
            ),
          ),
          Center(
            child: Container(
              width: 1.5.w,
              height: 50.h,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                color: Theme.of(context).hintColor,
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.h,
            children: [
              Text("Rate:", style: TextStyles.textViewMedium14.copyWith(color: Theme.of(context).hintColor),),
              CustomRichText(
                startSubText: "\$${homeShiftModel.shiftsDaysVOList.first.ratePerHour.toInt()}",
                centerSubText: "/",
                endSubText: "hr",
                startSubTextStyle: TextStyles.textViewBold16.copyWith(color: Theme.of(context).primaryColor),
                centerSubTextStyle: TextStyles.textViewBold12.copyWith(color: Theme.of(context).primaryColor),
                endSubTextStyle: TextStyles.textViewBold12,
              )
            ],
          )
        ],
      ),
    );
  }
}