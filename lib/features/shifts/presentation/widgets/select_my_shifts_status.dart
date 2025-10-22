import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/widgets/active_inactive_button.dart';

class SelectMyShiftsStatus extends StatelessWidget {
  final List<String> shiftStatuses;
  final int currentShiftStatusIndex;
  final Function(int) onShiftStatusChanged;
  const SelectMyShiftsStatus({super.key, required this.shiftStatuses, required this.currentShiftStatusIndex, required this.onShiftStatusChanged});

  @override
  Widget build(BuildContext context) {
    return SliverFloatingHeader(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: Row(
          children: List.generate(
            shiftStatuses.length,
            (index) => Expanded(
              child: ActiveInactiveButton(
                text: shiftStatuses[index],
                isActive: index == currentShiftStatusIndex,
                onTap: () {onShiftStatusChanged(index);},
              ),
            ),
          ),
        ),
      )
    );
  }
}