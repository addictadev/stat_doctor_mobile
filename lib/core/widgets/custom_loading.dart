import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoading extends StatelessWidget {
  final double? size;
  final double? top;
  final double? bottom;
  final Color? color;
  final Color? backgroundColor;
  final double? strokeWidth;
  const CustomLoading({this.top, this.bottom, this.size, this.color, this.backgroundColor, this.strokeWidth, super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top?.h ?? 0, bottom: bottom?.h ?? 0),
      child: Center(
        child: SizedBox(
          width: size?.w ?? 30.w,
          height: size?.h ?? 30.h,
          child: CircularProgressIndicator(
            color: color ?? Theme.of(context).primaryColor,
            backgroundColor: backgroundColor ?? Theme.of(context).primaryColor.withValues(alpha: 0.25) ,
            strokeWidth: strokeWidth?.r ?? 5.r,
          ),
        ),
      ),
    );
  }
}
