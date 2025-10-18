import 'package:flutter/material.dart';
import 'package:stat_doctor/core/toast/toast_service.dart';

/// Shows a toast notification with the specified parameters
/// 
/// [context] - The build context
/// [type] - The type of toast (success, error, warning)
/// [message] - The main message to display
/// [description] - Optional description text
/// [options] - Additional configuration options
Future<void> appToast({
  required BuildContext context,
  required ToastType type,
  required String message,
  String? description,
  ToastOptions? options,
}) => ToastService.showToast(
  context,
  type: type,
  message: message,
  description: description,
  options: options,
);

/// Configuration options for toast appearance and behavior
class ToastOptions {
  final TextStyle? messageStyle;
  final TextStyle? descriptionStyle;
  final Curve? slideCurve;
  final bool topView;
  final bool isClosable;
  final double expandedHeight;
  final Curve positionCurve;
  final ToastLength length;
  final DismissDirection dismissDirection;

  const ToastOptions({
    this.messageStyle,
    this.descriptionStyle,
    this.slideCurve,
    this.topView = false,
    this.isClosable = false,
    this.expandedHeight = 100,
    this.positionCurve = Curves.elasticOut,
    this.length = ToastLength.medium,
    this.dismissDirection = DismissDirection.down,
  });

  /// Creates a copy of this ToastOptions with the given fields replaced
  ToastOptions copyWith({
    TextStyle? messageStyle,
    TextStyle? descriptionStyle,
    Curve? slideCurve,
    bool? topView,
    bool? isClosable,
    double? expandedHeight,
    Curve? positionCurve,
    ToastLength? length,
    DismissDirection? dismissDirection,
  }) {
    return ToastOptions(
      messageStyle: messageStyle ?? this.messageStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      slideCurve: slideCurve ?? this.slideCurve,
      topView: topView ?? this.topView,
      isClosable: isClosable ?? this.isClosable,
      expandedHeight: expandedHeight ?? this.expandedHeight,
      positionCurve: positionCurve ?? this.positionCurve,
      length: length ?? this.length,
      dismissDirection: dismissDirection ?? this.dismissDirection,
    );
  }
}

/// Types of toast notifications
enum ToastType {
  success,
  error,
  warning,
}

/// Duration options for toast display
enum ToastLength {
  short,
  medium, 
  long, 
  ages, 
  never
}