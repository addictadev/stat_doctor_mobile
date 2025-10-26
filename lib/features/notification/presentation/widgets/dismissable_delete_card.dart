import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';

class DismissableDeleteCard extends StatelessWidget {
  const DismissableDeleteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 10.h),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.red.withValues(alpha: 0.075),
            border: Border.all(color: AppColors.red),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: AppIcons.icon(icon: AppIcons.trash, color: AppColors.red),
        ),
      ],
    );
  }
}