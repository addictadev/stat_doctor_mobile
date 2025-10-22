import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/styles/styles.dart';

class AppButtonLoading extends StatelessWidget{
  final String text;
  final TextStyle? style;
  final Color? textColor;
  final Color? color;
  final Border? border;
  final Color? borderColor;
  final EdgeInsetsGeometry? margin;
  final double? height;
  const AppButtonLoading({super.key, required this.text, this.style, this.textColor, this.margin, this.color, this.borderColor, this.border, this.height});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      border: border ?? Border.all(color: borderColor ?? AppColors.transparent, strokeAlign: BorderSide.strokeAlignInside),
      margin: margin,
      heigh: height,
      color:color?? Theme.of(context).primaryColor.withValues(alpha: 0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
      spacing: 15.w,
      children: [
        Text(text, style: style?? TextStyles.textViewBold16.copyWith(color: textColor??AppColors.scaffoldColorLight)),
        CustomLoading(size: 15,)
    ],),);
  }

}