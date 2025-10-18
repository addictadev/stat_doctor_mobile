import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoading extends StatelessWidget {
  final double? size;
  final double? top;
  final double? bottom;
  const CustomLoading({this.top, this.bottom, this.size, super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top?.h ?? 0, bottom: bottom?.h ?? 0),
      child: Center(
        child: SizedBox(
          width: size?.w ?? 30.w,
          height: size?.h ?? 30.h,
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
            backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.25) ,
            strokeWidth: 5.r,
          ),
        ),
      ),
    );
  }
}
