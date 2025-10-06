import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';

import '../navigation_services/navigation_manager.dart';

enum ToastType { error, success, info }

BuildContext getContext() {
  try {
    return (NavigationManager.navigatorKey.currentState!.overlay!.context);
  } catch (e) {
    // Fallback to root context if overlay context is not available
    return NavigationManager.navigatorKey.currentContext!;
  }
}

showCustomedToast(String message, ToastType toastType) {
  // Add a small delay to ensure the context is ready
  Future.delayed(const Duration(milliseconds: 100), () {
    try {
      CherryToast.success(
        description: Text(
          message,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        displayCloseButton: false,
        backgroundColor: toastType == ToastType.success ? Colors.green : Colors.red,
        animationType: toastType == ToastType.success
            ? AnimationType.fromBottom
            : AnimationType.fromTop,
        animationDuration: const Duration(milliseconds: 2600),
        autoDismiss: true,
        toastPosition:
            toastType == ToastType.success ? Position.bottom : Position.top,
        borderRadius: 12,
        iconWidget: toastType == ToastType.success
            ? const Icon(Icons.check_circle, color: Colors.white)
            : const Icon(Icons.error_outline, color: Colors.white),
      ).show(getContext());
    } catch (e) {
      print('Error showing toast: $e');
    }
  });
}

Widget loadingIndicator = const Center(
  child: SizedBox(
    width: 50,
    height: 50,
    child: SpinKitCircle(
      color: AppColors.primary,
    ),
  ),
);
