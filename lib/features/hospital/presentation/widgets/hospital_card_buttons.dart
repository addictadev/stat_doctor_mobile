import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/features/home/data/models/home_shift_model.dart';

class HospitalCardButtons extends StatelessWidget {
  final HomeShiftModel homeShiftModel;
  const HospitalCardButtons({super.key, required this.homeShiftModel});

  Widget getFlag(bool value) {
    return value ? AppIcons.icon(icon: AppIcons.right, size: 12, color: AppColors.lightGreen) : AppIcons.icon(icon: AppIcons.failure, size: 12, color: AppColors.red);
  }

  bool get hasTravel => homeShiftModel.shiftsDetailVO.travelFlag == 1;
  bool get hasAccommodation => homeShiftModel.shiftsDetailVO.accommodationFlag == 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        Expanded(
          child: AppButton(
            color: hasAccommodation ? null : Theme.of(context).scaffoldBackgroundColor,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5.w,
              children: [
                getFlag(hasAccommodation),
                Expanded(
                  child: Text("Accommodation", style: TextStyles.textViewSemiBold13.copyWith(color: hasAccommodation ? AppColors.cardColorLight : null), maxLines: 1, overflow: TextOverflow.ellipsis,)
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: AppButton(
            color: hasTravel ? null : Theme.of(context).scaffoldBackgroundColor,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5.w,
              children: [
                getFlag(hasTravel),
                Expanded(
                  child: Text("Travel", style: TextStyles.textViewSemiBold13.copyWith(color: hasTravel ? AppColors.cardColorLight : null), maxLines: 1, overflow: TextOverflow.ellipsis,)
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}