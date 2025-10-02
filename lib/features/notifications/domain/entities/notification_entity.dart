import 'package:flutter/material.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';

enum NotificationType {
  applicationAccepted,
  applicationUnsuccessful,
  shiftUnavailable,
  shiftReminder,
  general,
}

enum NotificationStatus {
  read,
  unread,
}

class NotificationEntity {
  final String id;
  final String title;
  final String message;
  final String timestamp;
  final NotificationType type;
  final NotificationStatus status;
  final String? hospitalName;
  final String? shiftDate;
  final DateTime createdAt;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.message,
    required this.timestamp,
    required this.type,
    required this.status,
    this.hospitalName,
    this.shiftDate,
    required this.createdAt,
  });

  // Helper method to get icon data based on type
  String get iconData {
    switch (type) {
      case NotificationType.applicationAccepted:
        return 'check_circle';
      case NotificationType.applicationUnsuccessful:
        return 'cancel';
      case NotificationType.shiftUnavailable:
        return 'event_busy';
      case NotificationType.shiftReminder:
        return 'schedule';
      case NotificationType.general:
        return 'info';
    }
  }

  // Helper method to get icon color based on type
  Color get iconColor {
    switch (type) {
      case NotificationType.applicationAccepted:
        return AppColors.success;
      case NotificationType.applicationUnsuccessful:
        return AppColors.error;
      case NotificationType.shiftUnavailable:
        return AppColors.textSecondary;
      case NotificationType.shiftReminder:
        return AppColors.warning;
      case NotificationType.general:
        return AppColors.info;
    }
  }

  // Helper method to get background color for icon
  Color get iconBackgroundColor {
    switch (type) {
      case NotificationType.applicationAccepted:
        return AppColors.success.withOpacity(0.1);
      case NotificationType.applicationUnsuccessful:
        return AppColors.error.withOpacity(0.1);
      case NotificationType.shiftUnavailable:
        return AppColors.textSecondary.withOpacity(0.1);
      case NotificationType.shiftReminder:
        return AppColors.warning.withOpacity(0.1);
      case NotificationType.general:
        return AppColors.info.withOpacity(0.1);
    }
  }

  // Helper method to check if notification is from today
  bool get isToday {
    final now = DateTime.now();
    return createdAt.year == now.year &&
        createdAt.month == now.month &&
        createdAt.day == now.day;
  }

  // Helper method to check if notification is from last 7 days
  bool get isLast7Days {
    final now = DateTime.now();
    final difference = now.difference(createdAt).inDays;
    return difference <= 7 && difference > 0;
  }

  // Copy with method
  NotificationEntity copyWith({
    String? id,
    String? title,
    String? message,
    String? timestamp,
    NotificationType? type,
    NotificationStatus? status,
    String? hospitalName,
    String? shiftDate,
    DateTime? createdAt,
  }) {
    return NotificationEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
      status: status ?? this.status,
      hospitalName: hospitalName ?? this.hospitalName,
      shiftDate: shiftDate ?? this.shiftDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NotificationEntity && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
