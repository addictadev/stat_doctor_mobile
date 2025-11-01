import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/features/home/data/models/home_shift_model.dart';

class HomeHospitalCardButtons extends StatelessWidget {
  final HomeShiftModel homeShiftModel;
  const HomeHospitalCardButtons({super.key, required this.homeShiftModel});

  Widget getFlag(bool value) {
    return value ? AppIcons.icon(icon: AppIcons.right, size: 12, color: AppColors.lightGreen) : AppIcons.icon(icon: AppIcons.failure, size: 12, color: AppColors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5.w,
            children: [
              getFlag(homeShiftModel.shiftsDetailVO.accommodationFlag == 1),
              Text("Accommodation", style: TextStyles.textViewSemiBold13,),
            ],
          ),
        ),
        Expanded(
          child: InkWell(
            overlayColor: WidgetStatePropertyAll(AppColors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5.w,
              children: [
                getFlag(homeShiftModel.shiftsDetailVO.travelFlag == 1),
                Text("Travel", style: TextStyles.textViewSemiBold13,),
              ],
            ),
          ),
        )
      ],
    );
  }
}