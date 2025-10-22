import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';

class ActiveInactiveButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final Function() onTap;
  final EdgeInsetsGeometry? itemPadding;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? activeBorderColor;
  final Color? inactiveBorderColor;
  final Color? activeTextColor;
  final Color? inactiveTextColor;
  final TextStyle? activeTextStyle;
  final TextStyle? inactiveTextStyle;
  final bool viewBorder;
  final double? borderRadius;
  final TextStyle? textStyle;
  
  const ActiveInactiveButton({super.key, required this.text, required this.isActive, required this.onTap, this.itemPadding, this.activeColor, this.inactiveColor, this.activeBorderColor, this.inactiveBorderColor, this.activeTextColor, this.inactiveTextColor, this.activeTextStyle, this.inactiveTextStyle, this.viewBorder = true, this.borderRadius, this.textStyle,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: WidgetStatePropertyAll(AppColors.transparent),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        padding: itemPadding ?? EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? (activeColor ?? Theme.of(context).primaryColor) : (inactiveColor ?? Theme.of(context).primaryColor.withValues(alpha: 0.05)),
          border: viewBorder ? Border.all(color: isActive ? (activeBorderColor ?? Theme.of(context).primaryColor) : (inactiveBorderColor ?? Theme.of(context).hintColor),) : null,
          borderRadius: BorderRadius.circular(borderRadius ?? 1000.r),
        ),
        child: Text(
          text,
          style: (textStyle ?? TextStyles.textViewSemiBold14).copyWith(color: isActive ? (activeTextColor ?? AppColors.cardColorLight) : (inactiveTextColor ?? Theme.of(context).hintColor),),
        ),
      ),
    );
  }
}