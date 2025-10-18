import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGradientProgressIndicator extends StatelessWidget {
  final double progress;
  final double height;
  final List<Color> colors;
  final Color? backgroundColor;

  const CustomGradientProgressIndicator({
    super.key,
    required this.progress,
    this.height = 8,
    required this.colors,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height.h,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey[300],
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: colors),
            borderRadius: BorderRadius.circular(height / 2),
          ),
        ),
      ),
    );
  }
}