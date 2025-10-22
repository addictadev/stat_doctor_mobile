import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/widgets/active_inactive_button.dart';

class SelectMyShiftsStatus extends StatelessWidget {
  final List<String> shiftStatuses;
  final int currentShiftStatusIndex;
  final Function(int) onShiftStatusChanged;
  const SelectMyShiftsStatus({super.key, required this.shiftStatuses, required this.currentShiftStatusIndex, required this.onShiftStatusChanged});

  @override
  Widget build(BuildContext context) {
    return SliverFloatingHeader(
      child: ColoredBox(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          child: Row(
            spacing: 10.w,
            children: List.generate(
              shiftStatuses.length,
              (index) => Expanded(
                child: ActiveInactiveButton(
                  onTap: () {onShiftStatusChanged(index);},
                  itemPadding: EdgeInsets.symmetric(vertical: 10.h),
                  text: shiftStatuses[index],
                  isActive: index == currentShiftStatusIndex,
                  activeColor: AppColors.green.withValues(alpha: 0.1),
                  activeBorderColor: AppColors.green,
                  activeTextColor: AppColors.green,
                  inactiveTextColor: Theme.of(context).hintColor,
                  inactiveBorderColor: Theme.of(context).dividerColor,
                  inactiveColor: Theme.of(context).cardColor,
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}