import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/utils/styles/styles.dart';

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28.w,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.greenOverlay : AppColors.scaffoldBackground,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? AppColors.success : Colors.transparent,
            width: 1,
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyles.textViewSemiBold16.copyWith(
            fontWeight: FontWeight.bold,
            color: isSelected ? AppColors.success : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
