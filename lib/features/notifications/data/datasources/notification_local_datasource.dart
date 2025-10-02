import 'package:stat_doctor/features/notifications/data/models/notification_model.dart';
import 'package:stat_doctor/features/notifications/domain/entities/notification_entity.dart';

class NotificationLocalDataSource {
  // Sample data based on the attached images
  static List<NotificationModel> _notifications = [
    // Today's notifications
    NotificationModel.sample(
      id: '1',
      title: 'Application Accepted',
      message: 'Your application for The Avenue Hospital has been accepted.',
      timestamp: '1:10 PM',
      type: NotificationType.applicationAccepted,
      status: NotificationStatus.unread,
      hospitalName: 'The Avenue Hospital',
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    NotificationModel.sample(
      id: '2',
      title: 'Application Unsuccessful',
      message: 'Your application for The Avenue Hospital on 25 Oct was unsuccessful.',
      timestamp: '9:15 AM',
      type: NotificationType.applicationUnsuccessful,
      status: NotificationStatus.read,
      hospitalName: 'The Avenue Hospital',
      shiftDate: '25 Oct',
      createdAt: DateTime.now().subtract(const Duration(hours: 6)),
    ),
    NotificationModel.sample(
      id: '3',
      title: 'Shift Unavailable',
      message: 'Applied for shift at Cabrini Prahran on 26 Oct is no longer available.',
      timestamp: '3:30 AM',
      type: NotificationType.shiftUnavailable,
      status: NotificationStatus.read,
      hospitalName: 'Cabrini Prahran',
      shiftDate: '26 Oct',
      createdAt: DateTime.now().subtract(const Duration(hours: 12)),
    ),
    NotificationModel.sample(
      id: '4',
      title: 'Shift Reminder',
      message: 'Your shift at The Alfred begins in 24 hours.',
      timestamp: '1:15 AM',
      type: NotificationType.shiftReminder,
      status: NotificationStatus.read,
      hospitalName: 'The Alfred',
      createdAt: DateTime.now().subtract(const Duration(hours: 14)),
    ),
    
    // Last 7 days notifications
    NotificationModel.sample(
      id: '5',
      title: 'Application Accepted',
      message: 'Your application for The Avenue Hospital has been accepted.',
      timestamp: '3 days ago',
      type: NotificationType.applicationAccepted,
      status: NotificationStatus.read,
      hospitalName: 'The Avenue Hospital',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
    NotificationModel.sample(
      id: '6',
      title: 'Application Unsuccessful',
      message: 'Your application for The Avenue Hospital on 25 Oct was unsuccessful.',
      timestamp: '5 days ago',
      type: NotificationType.applicationUnsuccessful,
      status: NotificationStatus.read,
      hospitalName: 'The Avenue Hospital',
      shiftDate: '25 Oct',
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
    NotificationModel.sample(
      id: '7',
      title: 'Shift Unavailable',
      message: 'Applied for shift at Cabrini Prahran on 26 Oct is no longer available.',
      timestamp: '7 days ago',
      type: NotificationType.shiftUnavailable,
      status: NotificationStatus.read,
      hospitalName: 'Cabrini Prahran',
      shiftDate: '26 Oct',
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
    ),
  ];

  Future<List<NotificationModel>> getAllNotifications() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return List.from(_notifications);
  }

  Future<List<NotificationModel>> getTodayNotifications() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _notifications.where((notification) => notification.isToday).toList();
  }

  Future<List<NotificationModel>> getLast7DaysNotifications() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _notifications.where((notification) => notification.isLast7Days).toList();
  }

  Future<void> markAsRead(String notificationId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      _notifications[index] = NotificationModel.sample(
        id: _notifications[index].id,
        title: _notifications[index].title,
        message: _notifications[index].message,
        timestamp: _notifications[index].timestamp,
        type: _notifications[index].type,
        status: NotificationStatus.read,
        hospitalName: _notifications[index].hospitalName,
        shiftDate: _notifications[index].shiftDate,
        createdAt: _notifications[index].createdAt,
      );
    }
  }

  Future<void> markAllAsRead() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _notifications = _notifications.map((notification) {
      return NotificationModel.sample(
        id: notification.id,
        title: notification.title,
        message: notification.message,
        timestamp: notification.timestamp,
        type: notification.type,
        status: NotificationStatus.read,
        hospitalName: notification.hospitalName,
        shiftDate: notification.shiftDate,
        createdAt: notification.createdAt,
      );
    }).toList();
  }

  Future<void> deleteNotification(String notificationId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _notifications.removeWhere((notification) => notification.id == notificationId);
  }

  Future<void> deleteAllNotifications() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _notifications.clear();
  }

  Future<int> getUnreadCount() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _notifications.where((n) => n.status == NotificationStatus.unread).length;
  }
}
