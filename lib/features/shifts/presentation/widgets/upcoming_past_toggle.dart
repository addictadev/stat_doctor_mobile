import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';

class UpcomingPastToggle extends StatelessWidget {
  final bool isUpcoming;
  final ValueChanged<bool> onToggle;

  const UpcomingPastToggle({
    super.key,
    required this.isUpcoming,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.5.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(25.w),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildToggleButton('Upcoming', true),
          _buildToggleButton('Past', false),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String label, bool value) {
    final isSelected = isUpcoming == value;
    
    return GestureDetector(
      onTap: () => onToggle(value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: Text(
          label,
          style: TextStyles.textViewSemiBold14.copyWith(
            color: isSelected ? AppColors.primary : Colors.white,
          ),
        ),
      ),
    );
  }
}
