import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/core/navigation_services/navigation_manager.dart';

class AddToCalendarScreen extends StatelessWidget {
  final String hospitalName;
  final String shiftDate;
  final String shiftTime;
  
  const AddToCalendarScreen({
    super.key,
    required this.hospitalName,
    required this.shiftDate,
    required this.shiftTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(6.w),
          child: Column(
            children: [
              SizedBox(height: 8.h),
              
              // StatDoctor Logo
              _buildLogo(),
              
              SizedBox(height: 8.h),
              
              // Shift Information
              _buildShiftInfo(),
              
              Spacer(),
              
              // Add to Calendar Button
              _buildAddToCalendarButton(),
              
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 25.w,
      height: 25.w,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Iconsax.calendar_1,
        color: AppColors.primary,
        size: 12.w,
      ),
    );
  }

  Widget _buildShiftInfo() {
    return Container(
      padding: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        color: AppColors.borderLight.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            'Shift Details',
            style: TextStyles.textViewBold18.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            hospitalName,
            style: TextStyles.textViewBold16.copyWith(
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 1.h),
          Text(
            shiftDate,
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 0.5.h),
          Text(
            shiftTime,
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddToCalendarButton() {
    return Container(
      width: double.infinity,
      height: 6.h,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30.w),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30.w),
          onTap: () {
            _addToCalendar();
          },
          child: Center(
            child: Text(
              'Add to calendar',
              style: TextStyles.textViewBold16.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _addToCalendar() {
    // TODO: Implement actual calendar integration
    // This would typically use a package like add_2_calendar or device_calendar
    
    // For now, show success message
    ScaffoldMessenger.of(NavigationManager.getContext()).showSnackBar(
      SnackBar(
        content: Text(
          'Shift added to your calendar successfully!',
          style: TextStyles.textViewRegular14.copyWith(
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.success,
      ),
    );
    
    // Navigate back
    NavigationManager.pop();
  }
}
