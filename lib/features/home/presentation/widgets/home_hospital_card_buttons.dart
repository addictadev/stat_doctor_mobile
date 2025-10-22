import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';

class HomeHospitalCardButtons extends StatelessWidget {
  final Function()? onAccommodationTap;
  final Function()? onTravelTap;
  const HomeHospitalCardButtons({super.key, this.onAccommodationTap, this.onTravelTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15.w,
      children: [
        Expanded(
          child: InkWell(
            onTap: onAccommodationTap,
            overlayColor: WidgetStatePropertyAll(AppColors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5.w,
              children: [
                AppIcons.icon(icon: AppIcons.failure, size: 12, color: AppColors.red),
                Text("Accommodation", style: TextStyles.textViewSemiBold13,),
              ],
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: onTravelTap,
            overlayColor: WidgetStatePropertyAll(AppColors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5.w,
              children: [
                AppIcons.icon(icon: AppIcons.right, size: 12, color: AppColors.lightGreen),
                Text("Travel", style: TextStyles.textViewSemiBold13,),
              ],
            ),
          ),
        )
      ],
    );
  }
}