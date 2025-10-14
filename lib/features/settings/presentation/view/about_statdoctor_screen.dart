import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/images_preview/app_assets.dart';
import 'package:stat_doctor/core/images_preview/custom_asset_img.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/core/utils/responsive_utils.dart';
import 'package:stat_doctor/core/navigation_services/navigation_manager.dart';
import 'package:stat_doctor/features/settings/presentation/view/terms_of_service_screen.dart';
import 'package:stat_doctor/features/settings/presentation/view/privacy_policy_screen.dart';
import 'package:stat_doctor/features/settings/presentation/view/contact_support_screen.dart';

class AboutStatDoctorScreen extends StatelessWidget {
  const AboutStatDoctorScreen({super.key});

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
          'About StatDoctor',
          style: TextStyles.textViewBold18.copyWith(
            color: AppColors.textPrimary,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context)),
        child: Column(
          children: [
            SizedBox(height: 2.h),
            
            // App Logo and Info
            _buildAppInfo(),
            
            SizedBox(height: 3.h),
            
            // App Details
            _buildAppDetails(),
            
            
            // Version and Build Info
            _buildVersionInfo(),
            
            SizedBox(height: 3.h),
            
        
          ],
        ),
      ),
    );
  }

  Widget _buildAppInfo() {
    return Container(
      padding: EdgeInsets.all(4.w),
  
      child: Column(
        children: [
          // App Icon
          SizedBox(
            width: 60.w,
            height: 20.w,
       
            child: CustomImageAsset(assetName: AppAssets.appIcon)
          ),
          
   
          
          SizedBox(height: 0.5.h),
          
          Text(
            'Connecting Healthcare Professionals',
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppDetails() {
    return Container(
      padding: EdgeInsets.all(4.w),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyles.textViewBold16.copyWith(
              color: AppColors.textPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            'StatDoctor is a comprehensive platform designed to connect healthcare professionals with opportunities across Australia. Our mission is to streamline the process of finding and securing medical positions, making healthcare more accessible and efficient.',
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
              fontSize: 14.sp,
              height: 1.5,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            'Features',
            style: TextStyles.textViewBold16.copyWith(
              color: AppColors.textPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 1.h),
          _buildFeatureItem('Job Matching & Recommendations'),
          _buildFeatureItem('Professional Document Management'),
          _buildFeatureItem('Reference Verification System'),
          _buildFeatureItem('Real-time Notifications'),
          _buildFeatureItem('Secure Profile Management'),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String feature) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: AppColors.success,
            size: 4.w,
          ),
          SizedBox(width: 2.w),
          Expanded(
            child: Text(
              feature,
              style: TextStyles.textViewRegular14.copyWith(
                color: AppColors.textSecondary,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVersionInfo() {
    return Container(
      padding: EdgeInsets.all(4.w),

      child: Column(
        children: [
          _buildInfoRow('Version', '1.0.0'),
          Divider(color: AppColors.borderLight.withOpacity(0.3)),
          _buildInfoRow('Build', '2025.01.15'),
          Divider(color: AppColors.borderLight.withOpacity(0.3)),
          _buildInfoRow('Platform', 'iOS & Android'),
          Divider(color: AppColors.borderLight.withOpacity(0.3)),
          _buildInfoRow('Last Updated', 'January 15, 2025'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyles.textViewMedium14.copyWith(
              color: AppColors.textPrimary,
              fontSize: 14.sp,
            ),
          ),
          Text(
            value,
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegalInfo() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Legal',
            style: TextStyles.textViewBold16.copyWith(
              color: AppColors.textPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 1.h),
          _buildLegalItem(
            'Terms of Service',
            () => NavigationManager.navigateTo(const TermsOfServiceScreen()),
          ),
          _buildLegalItem(
            'Privacy Policy',
            () => NavigationManager.navigateTo(const PrivacyPolicyScreen()),
          ),
          _buildLegalItem(
            'Contact Support',
            () => NavigationManager.navigateTo(const ContactSupportScreen()),
          ),
          SizedBox(height: 2.h),
          Text(
            '© 2025 StatDoctor. All rights reserved.',
            style: TextStyles.textViewRegular12.copyWith(
              color: AppColors.textSecondary,
              fontSize: 12.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLegalItem(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyles.textViewRegular14.copyWith(
                color: AppColors.textPrimary,
                fontSize: 14.sp,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.textSecondary,
              size: 3.w,
            ),
          ],
        ),
      ),
    );
  }
}
