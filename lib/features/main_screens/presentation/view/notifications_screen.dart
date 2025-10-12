import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../notifications/data/datasources/notification_local_datasource.dart';
import '../../../notifications/domain/entities/notification_entity.dart';
import '../../../notifications/presentation/widgets/notification_card.dart';
import '../../../notifications/presentation/widgets/delete_all_dialog.dart';
import '../../../notifications/presentation/widgets/notification_section_header.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final NotificationLocalDataSource _dataSource = NotificationLocalDataSource();
  List<NotificationEntity> _notifications = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final notifications = await _dataSource.getAllNotifications();
      
      setState(() {
        _notifications = notifications;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _deleteNotification(String notificationId) async {
    try {
      await _dataSource.deleteNotification(notificationId);
      setState(() {
        _notifications.removeWhere((n) => n.id == notificationId);
      });
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete notification: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  Future<void> _deleteAllNotifications() async {
    try {
      await _dataSource.deleteAllNotifications();
      setState(() {
        _notifications.clear();
      });
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete all notifications: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  Future<void> _markAsRead(String notificationId) async {
    try {
      await _dataSource.markAsRead(notificationId);
      setState(() {
        final index = _notifications.indexWhere((n) => n.id == notificationId);
        if (index != -1) {
          _notifications[index] = _notifications[index].copyWith(
            status: NotificationStatus.read,
          );
        }
      });
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> _showDeleteAllDialog() async {
    final result = await DeleteAllDialog.show(context);
    if (result == true) {
      await _deleteAllNotifications();
    }
  }

  List<NotificationEntity> get _todayNotifications {
    return _notifications.where((n) => n.isToday).toList();
  }

  List<NotificationEntity> get _last7DaysNotifications {
    return _notifications.where((n) => n.isLast7Days).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomAppBar(
        title: 'Notification',
        backgroundColor: AppColors.white,
        showBackButton: false,
        actions: [
          if (_notifications.isNotEmpty)
            IconButton(
              onPressed: _showDeleteAllDialog,
              icon: Icon(
                Iconsax.trash,
                color: AppColors.error,
                size: context.responsiveIconSize,
              ),
            ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return _buildLoadingState();
    }

    if (_error != null) {
      return _buildErrorState();
    }

    if (_notifications.isEmpty) {
      return _buildEmptyState();
    }

    return _buildNotificationsList();
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: AppColors.primary,
          ),
          SizedBox(height: 2.h),
          Text(
            'Loading notifications...',
            style: TextStyles.textViewRegular16.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 15.w,
            color: AppColors.error,
          ),
          SizedBox(height: 2.h),
          Text(
            'Failed to load notifications',
            style: TextStyles.textViewSemiBold16.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            _error ?? 'Unknown error',
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 3.h),
          ElevatedButton(
            onPressed: _loadNotifications,
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_none,
            size: 15.w,
            color: AppColors.textSecondary,
          ),
          SizedBox(height: 2.h),
          Text(
            'No notifications yet',
            style: TextStyles.textViewSemiBold18.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            'You\'ll see your notifications here when you receive them.',
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsList() {
    return RefreshIndicator(
      onRefresh: _loadNotifications,
      color: AppColors.primary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Today's notifications
          if (_todayNotifications.isNotEmpty) ...[
            NotificationSectionHeader(
              title: 'Today',
              count: _todayNotifications.length,
            ),
            ..._todayNotifications.map((notification) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: NotificationCard(
                notification: notification,
                onTap: () => _markAsRead(notification.id),
                onDelete: () => _deleteNotification(notification.id),
              ),
            )),
          ],

          // Last 7 days notifications
          if (_last7DaysNotifications.isNotEmpty) ...[
            NotificationSectionHeader(
              title: 'Last 7 days',
              count: _last7DaysNotifications.length,
            ),
            ..._last7DaysNotifications.map((notification) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: NotificationCard(
                notification: notification,
                onTap: () => _markAsRead(notification.id),
                onDelete: () => _deleteNotification(notification.id),
              ),
            )),
          ],

          // Bottom padding for better scrolling
          SizedBox(height: 4.h),
        ],
      ),
    );
  }
}
