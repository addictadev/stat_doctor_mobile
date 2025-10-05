import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/core/utils/responsive_utils.dart';
import 'package:stat_doctor/core/navigation_services/navigation_manager.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
          'Privacy Policy',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            
            Text(
              'Last updated: January 2025',
              style: TextStyles.textViewRegular14.copyWith(
                color: AppColors.textSecondary,
                fontSize: 14.sp,
              ),
            ),
            
            SizedBox(height: 3.h),
            
            _buildSection(
              '1. Information We Collect',
              'We collect information you provide directly to us, such as when you create an account, use our services, or contact us for support.',
            ),
            
            _buildSection(
              '2. How We Use Your Information',
              'We use the information we collect to provide, maintain, and improve our services, process transactions, and communicate with you.',
            ),
            
            _buildSection(
              '3. Information Sharing',
              'We do not sell, trade, or otherwise transfer your personal information to third parties without your consent, except as described in this policy.',
            ),
            
            _buildSection(
              '4. Data Security',
              'We implement appropriate security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction.',
            ),
            
            _buildSection(
              '5. Location Information',
              'With your permission, we may collect and use location information to provide location-based services and improve our app functionality.',
            ),
            
            _buildSection(
              '6. Biometric Data',
              'We may use biometric authentication features to secure your account. Biometric data is stored locally on your device and is not transmitted to our servers.',
            ),
            
            _buildSection(
              '7. Cookies and Tracking',
              'We use cookies and similar tracking technologies to collect information about your browsing activities and preferences.',
            ),
            
            _buildSection(
              '8. Your Rights',
              'You have the right to access, update, or delete your personal information. You may also opt out of certain communications from us.',
            ),
            
            _buildSection(
              '9. Children\'s Privacy',
              'Our services are not intended for children under 13. We do not knowingly collect personal information from children under 13.',
            ),
            
            _buildSection(
              '10. Changes to This Policy',
              'We may update this privacy policy from time to time. We will notify you of any changes by posting the new policy on this page.',
            ),
            
            SizedBox(height: 4.h),
            
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: AppColors.scaffoldBackground,
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Text(
                'If you have any questions about this Privacy Policy, please contact us at privacy@statdoctor.com',
                style: TextStyles.textViewRegular14.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.textViewBold16.copyWith(
            color: AppColors.textPrimary,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 1.h),
        Text(
          content,
          style: TextStyles.textViewRegular14.copyWith(
            color: AppColors.textSecondary,
            fontSize: 14.sp,
            height: 1.5,
          ),
        ),
        SizedBox(height: 2.h),
      ],
    );
  }
}
