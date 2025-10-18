// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrollableText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? height;
  const ScrollableText({super.key, required this.text, this.style, this.height,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 20.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsetsDirectional.only(end: 5.w),
        children: [Center(child: Text(text, style: style,)),],
      )
    );
  }
}
