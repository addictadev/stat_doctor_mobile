import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';

class SettingsToggleItem extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingsToggleItem({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
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
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.white,
            activeTrackColor: AppColors.success,
            inactiveThumbColor: AppColors.white,
          
            inactiveTrackColor: AppColors.borderLight,
          ),
        ],
      ),
    );
  }
}
