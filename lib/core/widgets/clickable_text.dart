import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClickableText extends StatelessWidget {
  final String? text;
  final Widget? child;
  final Color? color;
  final TextStyle? textStyle;
  final Function()? onTap;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  const ClickableText({
    this.color,
    this.child,
    this.text,
    this.textStyle,
    this.onTap,
    this.icon,
    super.key,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        splashFactory: NoSplash.splashFactory,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 10.w,
          children: [
            if (icon != null) icon!,
            if(text != null) Text(text!, style: textStyle ?? TextStyles.textViewRegular14.copyWith(color: color ?? Theme.of(context).primaryColor,),),
            if(child != null) child!,
          ],
        ),
      ),
    );
  }
}
