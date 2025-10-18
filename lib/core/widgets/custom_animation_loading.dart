import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_images.dart';
import 'package:stat_doctor/core/extensions/theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomAnimationLoading extends StatelessWidget {
  final Color? color;
  const CustomAnimationLoading({super.key, this.color});
  
  @override
  Widget build(BuildContext context) {
    return  Material(
      color: color?? AppColors.transparent,
      child: Center(
        child: Image.asset(
          context.isDarkMode ? AppImages.logoDark : AppImages.logoLight,
          width: MediaQuery.sizeOf(context).width*0.4,
        ).animate(
          delay: 200.ms,
          onPlay: (controller) => controller.repeat(reverse: true)
        ).shimmer(duration: 1500.ms, color: Theme.of(context).scaffoldBackgroundColor),
      ),
    );
  }
}