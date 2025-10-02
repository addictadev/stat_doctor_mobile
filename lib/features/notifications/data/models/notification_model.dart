import 'package:stat_doctor/features/notifications/domain/entities/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel({
    required super.id,
    required super.title,
    required super.message,
    required super.timestamp,
    required super.type,
    required super.status,
    super.hospitalName,
    super.shiftDate,
    required super.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      timestamp: json['timestamp'] as String,
      type: _parseNotificationType(json['type'] as String),
      status: _parseNotificationStatus(json['status'] as String),
      hospitalName: json['hospitalName'] as String?,
      shiftDate: json['shiftDate'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'timestamp': timestamp,
      'type': _notificationTypeToString(type),
      'status': _notificationStatusToString(status),
      'hospitalName': hospitalName,
      'shiftDate': shiftDate,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  static NotificationType _parseNotificationType(String type) {
    switch (type.toLowerCase()) {
      case 'application_accepted':
        return NotificationType.applicationAccepted;
      case 'application_unsuccessful':
        return NotificationType.applicationUnsuccessful;
      case 'shift_unavailable':
        return NotificationType.shiftUnavailable;
      case 'shift_reminder':
        return NotificationType.shiftReminder;
      case 'general':
        return NotificationType.general;
      default:
        return NotificationType.general;
    }
  }

  static NotificationStatus _parseNotificationStatus(String status) {
    switch (status.toLowerCase()) {
      case 'read':
        return NotificationStatus.read;
      case 'unread':
        return NotificationStatus.unread;
      default:
        return NotificationStatus.unread;
    }
  }

  static String _notificationTypeToString(NotificationType type) {
    switch (type) {
      case NotificationType.applicationAccepted:
        return 'application_accepted';
      case NotificationType.applicationUnsuccessful:
        return 'application_unsuccessful';
      case NotificationType.shiftUnavailable:
        return 'shift_unavailable';
      case NotificationType.shiftReminder:
        return 'shift_reminder';
      case NotificationType.general:
        return 'general';
    }
  }

  static String _notificationStatusToString(NotificationStatus status) {
    switch (status) {
      case NotificationStatus.read:
        return 'read';
      case NotificationStatus.unread:
        return 'unread';
    }
  }

  // Factory method to create sample data for testing
  factory NotificationModel.sample({
    required String id,
    required String title,
    required String message,
    required String timestamp,
    required NotificationType type,
    NotificationStatus status = NotificationStatus.unread,
    String? hospitalName,
    String? shiftDate,
    required DateTime createdAt,
  }) {
    return NotificationModel(
      id: id,
      title: title,
      message: message,
      timestamp: timestamp,
      type: type,
      status: status,
      hospitalName: hospitalName,
      shiftDate: shiftDate,
      createdAt: createdAt,
    );
  }
}
