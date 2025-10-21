import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';

class HomeShiftsCardInfoItem extends StatelessWidget {
  final String? icon;
  final String text;
  final Color? textColor;
  final Color? iconColor;
  final double? iconSize;
  final TextStyle? textStyle;

  const HomeShiftsCardInfoItem({
    super.key,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.textStyle,
    this.textColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5.w,
        children: [
          if(icon != null) AppIcons.icon(icon: icon!, size: iconSize ?? 10, color: iconColor ?? Theme.of(context).primaryColor),
          Text(text, style: textStyle ?? TextStyles.textViewBold8.copyWith(color: textColor ?? Theme.of(context).primaryColor),),
        ],
      ),
    );
  }
}