import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';

class HomeOtherShiftsCardButtons extends StatelessWidget {
  final Function()? onAccommodationTap;
  final Function()? onTravelTap;
  const HomeOtherShiftsCardButtons({super.key, this.onAccommodationTap, this.onTravelTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.w,
      children: [
        Expanded(
          child: InkWell(
            onTap: onTravelTap,
            overlayColor: WidgetStatePropertyAll(AppColors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5.w,
              children: [
                AppIcons.icon(icon: AppIcons.right, size: 8, color: AppColors.lightGreen),
                Expanded(child: Text("Travel", style: TextStyles.textViewSemiBold8.copyWith(color: AppColors.cardColorLight),)),
              ],
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: onAccommodationTap,
            overlayColor: WidgetStatePropertyAll(AppColors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5.w,
              children: [
                AppIcons.icon(icon: AppIcons.failure, size: 10, color: AppColors.red),
                Expanded(child: Text("Accommodation", style: TextStyles.textViewSemiBold8.copyWith(color: AppColors.cardColorLight),)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}