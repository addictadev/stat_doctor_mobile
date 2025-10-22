import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPopup {
  static void appShowModalBottomSheet({
    required BuildContext context,
    required Widget Function(BuildContext) builder,
    bool? isScrollControlled,
    bool? useSafeArea,
    double? scrollControlDisabledMaxHeightRatio,
    Color? barrierColor,
    Color? backgroundColor,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
      clipBehavior: Clip.hardEdge,
      backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      barrierColor: barrierColor ?? Theme.of(context).primaryColor.withValues(alpha: 0.25),
      elevation: 0,
      isScrollControlled: isScrollControlled ?? false,
      useSafeArea: useSafeArea ?? false,
      scrollControlDisabledMaxHeightRatio: scrollControlDisabledMaxHeightRatio ?? 9.0 / 16.0,
      builder: builder,
    );
  }

  static void appShowDialog({required BuildContext context, required Widget Function(BuildContext) builder}) {
    showDialog(
      context: context,
      builder: builder,
    );
  }
}