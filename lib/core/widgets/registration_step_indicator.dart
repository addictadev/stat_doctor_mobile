import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/images_preview/app_assets.dart';
import 'package:stat_doctor/core/images_preview/custom_svg_img.dart';
import '../theme/app_colors.dart';
import '../utils/responsive_utils.dart';

class RegistrationStepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final List<String> stepLabels;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? completedColor;
  final Color? textColor;
  final Color? completedTextColor;

  const RegistrationStepIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.stepLabels,
    this.activeColor,
    this.inactiveColor,
    this.completedColor,
    this.textColor,
    this.completedTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.w),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(3.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Step circles and connecting lines
          
          Padding(
            padding: EdgeInsets.only(left: 10.w,top: 1.w),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(totalSteps, (index) {
              final stepNumber = index + 1;
              final isCompleted = stepNumber < currentStep;
              final isActive = stepNumber == currentStep;
              final isUpcoming = stepNumber > currentStep;

              return Expanded(
                child: 
                
                Row(
                  children: [
                    // Step circle
                    _buildStepCircle(
                      context,
                      stepNumber: stepNumber,
                      isCompleted: isCompleted,
                      isActive: isActive,
                      isUpcoming: isUpcoming,
                    ),
                    // Connecting line (except for last step)
                    if (index < totalSteps - 1)
                      Expanded(
                        child: Container(
                          height: 2,
                          margin: EdgeInsets.symmetric(horizontal: 0),
                          decoration: BoxDecoration(
                            color: stepNumber < currentStep
                                ? (completedColor ?? AppColors.primary)
                                : (inactiveColor ?? AppColors.borderLight),
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }),
          )),
          SizedBox(height: 16),
          // Step labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(totalSteps, (index) {
              final stepNumber = index + 1;
              final isCompleted = stepNumber < currentStep;
              final isActive = stepNumber == currentStep;

              return Expanded(
                child: Text(
                  stepLabels[index],
                  textAlign: TextAlign.center,
                  style: ResponsiveUtils.getResponsiveTextStyle(
                    context,
                    fontSize: ResponsiveUtils.getResponsiveFontSize(
                      context,
                      mobile: 12,
                      tablet: 14,
                      desktop: 16,
                    ),
                    fontWeight: FontWeight.w600,
                    color: isCompleted
                        ? (completedTextColor ?? AppColors.primary)
                        : isActive
                            ? (textColor ?? AppColors.textPrimary)
                            : (textColor ?? AppColors.textSecondary),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildStepCircle(
    BuildContext context, {
    required int stepNumber,
    required bool isCompleted,
    required bool isActive,
    required bool isUpcoming,
  }) {
    final size = ResponsiveUtils.getResponsiveIconSize(context) * 0.8;
    
    return isCompleted && !isActive?
    CustomSvgImage(assetName: AppAssets.check):
    isActive?
    CustomSvgImage(assetName: AppAssets.currentStep):

    CustomSvgImage(assetName: AppAssets.upcomingStep);
 
  }
}
