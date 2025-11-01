import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/methods/covert_datetime_to_string.dart';
import 'package:stat_doctor/core/widgets/custom_rich_text.dart';
import 'package:stat_doctor/core/widgets/default_container.dart';
import 'package:stat_doctor/features/home/data/models/home_shift_model.dart';

class MyShiftsDetailsRate extends StatelessWidget {
  final HomeShiftModel homeShiftModel;
  const MyShiftsDetailsRate({required this.homeShiftModel, super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRichText(
            startSubText: "Rate:  ",
            endSubText: "${homeShiftModel.shiftsDetailVO.otherRate??'--'} / hr" ,
            startSubTextStyle: TextStyles.textViewMedium14,
            endSubTextStyle: TextStyles.textViewBold18,
          ),
          Row(
            spacing: 10.w,
            children: [
              AppIcons.icon(icon: AppIcons.calendar, size: 16, color: Theme.of(context).colorScheme.onSurface),
              Text(ConvertDateTime.formatDateTimeToDay(homeShiftModel.shiftsDaysVOList.first.shiftsDays), style: TextStyles.textViewMedium14),
            ],
          ),
          Row(
            spacing: 10.w,
            children: [
              AppIcons.icon(icon: AppIcons.clock, size: 16, color: Theme.of(context).colorScheme.onSurface),
              Text("${ConvertDateTime.formatDateTimeToTime(homeShiftModel.shiftsDaysVOList.first.startTimeS)} - ${ConvertDateTime.formatDateTimeToTime(homeShiftModel.shiftsDaysVOList.first.endTimeS)} (${homeShiftModel.shiftsDaysVOList.first.durationTime})", style: TextStyles.textViewMedium14),
            ],
          ),
        ],
      ),
    );
  }
}
