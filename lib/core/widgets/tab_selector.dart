import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';

class TabSelector extends StatelessWidget {
  final List<String> titles;
  final int currentIndex;
  final Function(int) onIndexChanged;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double? separatorWidth;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final EdgeInsetsGeometry? itemPadding;
  final double? borderRadius;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final Color? selectedBorderColor;
  final Color? unselectedBorderColor;
  final TextStyle? textStyle;
  final bool viewBorder;

  const TabSelector({
    super.key,
    required this.titles,
    required this.currentIndex,
    required this.onIndexChanged,
    this.height,
    this.padding,
    this.separatorWidth,
    this.animationDuration,
    this.animationCurve,
    this.itemPadding,
    this.borderRadius,
    this.selectedColor,
    this.unselectedColor,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.textStyle,
    this.viewBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40.h,
      child: ListView.separated(
        itemCount: titles.length,
        scrollDirection: Axis.horizontal,
        padding: padding,
        separatorBuilder: (context, index) => SizedBox(width: separatorWidth ?? 10.w),
        itemBuilder: (context, index) => IntrinsicWidth(
          child: InkWell(
            onTap: () {if (index != currentIndex) {onIndexChanged(index);}},
            overlayColor: WidgetStatePropertyAll(AppColors.transparent),
            child: AnimatedContainer(
              duration: animationDuration ?? const Duration(milliseconds: 500),
              curve: animationCurve ?? Curves.easeInOut,
              padding: itemPadding ?? EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: index == currentIndex ? (selectedColor ?? Theme.of(context).primaryColor) : (unselectedColor ?? Theme.of(context).primaryColor.withValues(alpha: 0.05)),
                border: viewBorder ? Border.all(color: index == currentIndex ? (selectedBorderColor ?? Theme.of(context).primaryColor) : (unselectedBorderColor ?? Theme.of(context).hintColor),) : null,
                borderRadius: BorderRadius.circular(borderRadius ?? 1000.r),
              ),
              child: Text(
                titles[index],
                style: (textStyle ?? TextStyles.textViewSemiBold14).copyWith(color: index == currentIndex ? (selectedTextColor ?? AppColors.cardColorLight) : (unselectedTextColor ?? Theme.of(context).hintColor),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
