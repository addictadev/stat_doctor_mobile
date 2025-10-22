import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';

class SelectMyShiftsType extends StatelessWidget {
  final List<String> shiftTypes;
  final int currentShiftTypeIndex;
  final Function(int) onShiftTypeChanged;
  const SelectMyShiftsType({super.key, required this.shiftTypes, required this.currentShiftTypeIndex, required this.onShiftTypeChanged});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: AppColors.cardColorLight.withValues(alpha: 0.25),
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Row(
            children: List.generate(
              shiftTypes.length,
              (index) => InkWell(
                onTap: () {if (index != currentShiftTypeIndex) {onShiftTypeChanged(index);}},
                overlayColor: WidgetStatePropertyAll(AppColors.transparent),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: index == currentShiftTypeIndex ? AppColors.cardColorLight.withValues(alpha: 0.25) : null,
                    borderRadius: index == currentShiftTypeIndex ? BorderRadius.circular(100.r) : null,
                  ),
                  child: Text(shiftTypes[index], style: TextStyles.textViewBold12.copyWith(color:AppColors.cardColorLight),),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}