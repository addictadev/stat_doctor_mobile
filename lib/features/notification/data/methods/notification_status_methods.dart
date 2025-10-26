import 'package:flutter/material.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/features/notification/data/enum/notification_status.dart';

class NotificationStatusMethods {
  static String getIcon(NotificationStatus status) => switch (status) {
    NotificationStatus.neww => AppIcons.notificationOnshifts,
    NotificationStatus.oneHours => AppIcons.notificationOnhours,
    NotificationStatus.accepted => AppIcons.notificationAccepted,
    NotificationStatus.rejected => AppIcons.notificationRejected,
  };

  static Color getIconColor(BuildContext context, NotificationStatus status) => switch (status) {
    NotificationStatus.neww => AppColors.orange,
    NotificationStatus.oneHours => Theme.of(context).hintColor,
    NotificationStatus.accepted => AppColors.green,
    NotificationStatus.rejected => AppColors.red,
  };

  static NotificationStatus getNotificationStatus(String status) => switch (status) {
    'neww' => NotificationStatus.neww,
    'oneHours' => NotificationStatus.oneHours,
    'accepted' => NotificationStatus.accepted,
    'rejected' => NotificationStatus.rejected,
    _ => NotificationStatus.neww,
  };
}