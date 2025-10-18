import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPopup {
  static void appShowModalBottomSheet({required BuildContext context, required Widget Function(BuildContext) builder}) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
      clipBehavior: Clip.hardEdge,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      barrierColor: Theme.of(context).primaryColor.withValues(alpha: 0.25),
      elevation: 0,
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
