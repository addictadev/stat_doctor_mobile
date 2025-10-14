import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: _getStatusColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.w),
        border: Border.all(
          color: _getStatusColor(),
          width: 1,
        ),
      ),
      child: Text(
        status,
        style: TextStyles.textViewSemiBold12.copyWith(
          color: _getStatusColor(),
          fontSize: 10.sp,
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'applied':
        return AppColors.primary;
      case 'accepted':
        return AppColors.success;
      case 'cancelled':
        return AppColors.error;
      case 'archived':
        return AppColors.textSecondary;
      default:
        return AppColors.primary;
    }
  }
}
