import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/core/utils/responsive_utils.dart';
import 'package:stat_doctor/features/notifications/domain/entities/notification_entity.dart';

class NotificationCard extends StatelessWidget {
  final NotificationEntity notification;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final bool isDeleting;

  const NotificationCard({
    super.key,
    required this.notification,
    this.onTap,
    this.onDelete,
    this.isDeleting = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(notification.id),
      direction: DismissDirection.endToStart,
      background: _buildDeleteBackground(),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          onDelete?.call();
          return false; // Don't actually dismiss, let the parent handle it
        }
        return false;
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        child: Material(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(context.responsiveBorderRadius),
          elevation: 2,
          shadowColor: AppColors.shadowLight,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(context.responsiveBorderRadius),
            child: Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(context.responsiveBorderRadius),
                border: notification.status == NotificationStatus.unread
                    ? Border.all(color: AppColors.primary.withOpacity(0.1), width: 1)
                    : null,
              ),
              child: Row(
                children: [
                  // Icon Container
                  _buildIconContainer(context),
                  
                  SizedBox(width: 4.w),
                  
                  // Content
                  Expanded(
                    child: _buildContent(context),
                  ),
                  
                  // Unread indicator
                  if (notification.status == NotificationStatus.unread)
                    _buildUnreadIndicator(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteBackground() {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      decoration: BoxDecoration(
        color: AppColors.error.withOpacity(0.02),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 6.w),
      child: Container(
        width: 12.w,
        height: 14.w,
        decoration: BoxDecoration(
          color: AppColors.error.withOpacity(0.1),
          borderRadius: BorderRadius.circular(3.w),
          border: Border.all(color: AppColors.error.withOpacity(0.5), width: 1),
        ),
        child: Icon(
          Iconsax.trash,
          color: AppColors.error,
          size: 6.w,
        ),
      ),
    );
  }

  Widget _buildIconContainer(BuildContext context) {
    return Container(
      width: context.responsiveIconSize * 1.5,
      height: context.responsiveIconSize * 1.5,
      decoration: BoxDecoration(
        color: notification.iconBackgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        _getIconData(),
        color: notification.iconColor,
        size: context.responsiveIconSize * 0.8,
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Notification message
        Text(
          notification.message,
          style: TextStyles.textViewRegular14.copyWith(
            color: AppColors.textPrimary,
            height: 1.4,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        
        SizedBox(height: 1.h),
        
        // Timestamp
        Text(
          notification.timestamp,
          style: TextStyles.textViewRegular12.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildUnreadIndicator(BuildContext context) {
    return Container(
      width: 2.w,
      height: 2.w,
      decoration: BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
    );
  }

  IconData _getIconData() {
    switch (notification.type) {
      case NotificationType.applicationAccepted:
        return Icons.check_circle;
      case NotificationType.applicationUnsuccessful:
        return Icons.cancel;
      case NotificationType.shiftUnavailable:
        return Icons.event_busy;
      case NotificationType.shiftReminder:
        return Icons.schedule;
      case NotificationType.general:
        return Icons.info;
    }
  }
}
