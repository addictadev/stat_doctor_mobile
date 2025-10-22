import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/toast/app_toast.dart';

/// A customizable toast widget that displays messages with different types
class CustomToast extends StatefulWidget {
  /// Animation controller for slide transitions
  final AnimationController? controller;
  
  /// Type of toast (success, error, warning)
  final ToastType type;
  
  /// Main message text
  final String message;
  
  /// Optional description text
  final String? description;
  
  /// Custom style for the message text
  final TextStyle? messageStyle;
  
  /// Custom style for the description text
  final TextStyle? descriptionStyle;
  
  /// Callback when toast is tapped
  final VoidCallback? onTap;
  
  /// Animation curve for slide transitions
  final Curve? curve;
  
  /// Whether the toast can be closed manually
  final bool isClosable;
  
  /// Whether this toast is in the front layer
  final bool isInFront;
  
  /// Callback when toast is closed
  final VoidCallback? onClose;

  const CustomToast({
    super.key,
    required this.controller,
    required this.type,
    required this.message,
    required this.isInFront,
    this.description,
    this.messageStyle,
    this.descriptionStyle,
    this.onTap,
    this.onClose,
    this.curve,
    this.isClosable = false,
  });

  @override
  State<CustomToast> createState() => _CustomToastState();
}

class _CustomToastState extends State<CustomToast> {
  /// Returns the appropriate color based on toast type
  Color get _toastColor => switch (widget.type) {
    ToastType.success => AppColors.darkGreen,
    ToastType.warning => AppColors.orange,
    ToastType.error => AppColors.red,
  };

  Color  _toastBackgroundColor(BuildContext context) => switch (widget.type) {
    ToastType.success => AdaptiveTheme.of(context).brightness == Brightness.dark ? AppColors.toastSuccessDarkBackground : AppColors.toastSuccessLightBackground,
    ToastType.warning => AdaptiveTheme.of(context).brightness == Brightness.dark ? AppColors.toastWarningDarkBackground : AppColors.toastWarningLightBackground,
    ToastType.error => AdaptiveTheme.of(context).brightness == Brightness.dark ? AppColors.toastErrorDarkBackground : AppColors.toastErrorLightBackground,
  };

  /// Returns the appropriate Lottie animation based on toast type
  Widget get _toastIcon => switch (widget.type) {
    ToastType.success => AppIcons.icon(icon: AppIcons.success),
    ToastType.warning => AppIcons.icon(icon: AppIcons.warning),
    ToastType.error => AppIcons.icon(icon: AppIcons.error),
  };

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller!,
      builder: (context, _) {
        return Material(
          color: Colors.transparent,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: const Offset(0.0, 0.0),
            ).animate(
              CurvedAnimation(
                parent: widget.controller!,
                curve: widget.curve ?? Curves.elasticOut,
                reverseCurve: widget.curve ?? Curves.elasticOut,
              ),
            ),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsetsDirectional.symmetric(horizontal: 15.r, vertical: 15.h),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: _toastBackgroundColor(context),
                border: Border.all(color: _toastColor, strokeAlign: BorderSide.strokeAlignOutside),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.w,
                children: [
                  Container(
                    height: 25.h,
                    width: 25.w,
                    padding: EdgeInsets.all(7.r),
                    decoration: BoxDecoration(
                      color: _toastColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: _toastIcon,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 3.h,
                      children: [
                        Text(
                          widget.message,
                          style: widget.messageStyle ?? TextStyles.textViewBold14,
                        ),
                        if (widget.description != null)
                        Text(
                          widget.description!,
                          style: widget.descriptionStyle ?? TextStyles.textViewMedium12,
                        ),
                      ],
                    ),
                  ),
                  AppIconButton(
                    onTap: widget.onClose,
                    child: AppIcons.icon(icon: AppIcons.close, color: _toastColor, size: 14),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}