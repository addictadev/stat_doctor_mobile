import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';

class AppBadge extends StatelessWidget {
  final String title;
  final Color color;
  final Color? backgroundColor;
  final Color? textColor;
  const AppBadge({super.key, required this.title, required this.color, this.backgroundColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: backgroundColor ?? color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(1000.r),
        ),
        child: Text(title, style: TextStyles.textViewBold12.copyWith(color: textColor ?? color),),
      ),
    );
  }
}