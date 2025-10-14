import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/core/navigation_services/navigation_manager.dart';
import 'package:stat_doctor/features/settings/presentation/widgets/settings_toggle_item.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  // Notification settings state
  bool _notifySuccessfulApplications = true;
  bool _notifyUnsuccessfulApplications = false;
  bool _notifyAppliedShiftsRemoved = true;
  bool _notify48hrShiftReminder = false;
  bool _notify1hrShiftReminder = true;
  bool _notifyShiftsInterestedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(1.w),
          decoration: BoxDecoration(
            color: AppColors.borderLight.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.textPrimary,
              size: 4.w,
            ),
            onPressed: () => NavigationManager.pop(),
          ),
        ),
        title: Text(
          'Notifications',
          style: TextStyles.textViewBold18.copyWith(
            color: AppColors.textPrimary,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            SizedBox(height: 2.h),
            
            // Notification Preferences
            _buildNotificationPreferences(),
            
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationPreferences() {
    return Column(
      children: [
        SettingsToggleItem(
          title: 'Notify of successful applications',
          value: _notifySuccessfulApplications,
          onChanged: (value) {
            setState(() {
              _notifySuccessfulApplications = value;
            });
            _showToggleFeedback('Successful applications notifications', value);
          },
        ),
        
        SettingsToggleItem(
          title: 'Notify of un-successful applications',
          value: _notifyUnsuccessfulApplications,
          onChanged: (value) {
            setState(() {
              _notifyUnsuccessfulApplications = value;
            });
            _showToggleFeedback('Unsuccessful applications notifications', value);
          },
        ),
        
        SettingsToggleItem(
          title: 'Notify of applied for shifts removed',
          value: _notifyAppliedShiftsRemoved,
          onChanged: (value) {
            setState(() {
              _notifyAppliedShiftsRemoved = value;
            });
            _showToggleFeedback('Applied shifts removed notifications', value);
          },
        ),
        
        SettingsToggleItem(
          title: '48hr shift reminder',
          value: _notify48hrShiftReminder,
          onChanged: (value) {
            setState(() {
              _notify48hrShiftReminder = value;
            });
            _showToggleFeedback('48hr shift reminders', value);
          },
        ),
        
        SettingsToggleItem(
          title: '1hr shift reminder',
          value: _notify1hrShiftReminder,
          onChanged: (value) {
            setState(() {
              _notify1hrShiftReminder = value;
            });
            _showToggleFeedback('1hr shift reminders', value);
          },
        ),
        
        SettingsToggleItem(
          title: 'Notify of shifts you\'r interested in',
          value: _notifyShiftsInterestedIn,
          onChanged: (value) {
            setState(() {
              _notifyShiftsInterestedIn = value;
            });
            _showToggleFeedback('Shifts of interest notifications', value);
          },
        ),
      ],
    );
  }

  void _showToggleFeedback(String setting, bool enabled) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$setting ${enabled ? 'enabled' : 'disabled'}'),
        backgroundColor: enabled ? AppColors.success : AppColors.textSecondary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
