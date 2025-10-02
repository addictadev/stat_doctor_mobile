import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';

class NotificationSectionHeader extends StatelessWidget {
  final String title;
  final int count;

  const NotificationSectionHeader({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyles.textViewSemiBold16.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (count > 0) ...[
            SizedBox(width: 2.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                count.toString(),
                style: TextStyles.textViewMedium12.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
