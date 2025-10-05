import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';

class SettingsNavigationItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SettingsNavigationItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyles.textViewRegular16.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 16.sp,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.textPrimary,
              size: 4.w,
            ),
          ],
        ),
      ),
    );
  }
}
