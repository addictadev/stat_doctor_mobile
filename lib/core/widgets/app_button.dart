import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final Function()? onTap;
  final Widget? child;
  final Color? color;
  final Color? textColor;
  final bool flexableHeight;
  final String? text;
  final Color? borderColor;
  final Gradient? gradient;
  final double? width;
  final double? heigh;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final List<BoxShadow>? boxShadow;
  final TextStyle? style;
  final Border? border;

  const AppButton({
    this.onTap,
    this.child,
    this.alignment,
    this.margin,
    this.padding,
    this.color,
    this.style,
    this.textColor,
    this.text,
    this.border,
    this.boxShadow,
    this.flexableHeight = false,
    this.borderColor,
    this.radius,
    this.gradient,
    this.width,
    this.heigh,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        onTap: onTap,
        child: Container(
          width: width ?? double.infinity,
          height: heigh,
          padding: padding ?? EdgeInsets.all(15.r),
          alignment: alignment ?? Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 1000.r),
            border: border ?? Border.all(color: borderColor ?? AppColors.transparent, strokeAlign: BorderSide.strokeAlignInside),
            color: color ?? Theme.of(context).primaryColor,
            gradient: gradient,
            boxShadow: boxShadow,
          ),
          child: text != null ?
          Text(text!, style: style?? TextStyles.textViewBold16.copyWith(color: textColor??AppColors.scaffoldColorLight)):
          child
        ),
      ),
    );
  }
}
