import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/core/utils/responsive_utils.dart';
import 'package:stat_doctor/core/navigation_services/navigation_manager.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

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
          'Terms of Service',
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
              '1. Acceptance of Terms',
              'By accessing and using StatDoctor, you accept and agree to be bound by the terms and provision of this agreement.',
            ),
            
            _buildSection(
              '2. Use License',
              'Permission is granted to temporarily download one copy of StatDoctor for personal, non-commercial transitory viewing only.',
            ),
            
            _buildSection(
              '3. Disclaimer',
              'The materials on StatDoctor are provided on an "as is" basis. StatDoctor makes no warranties, expressed or implied.',
            ),
            
            _buildSection(
              '4. Limitations',
              'In no event shall StatDoctor or its suppliers be liable for any damages arising out of the use or inability to use StatDoctor.',
            ),
            
            _buildSection(
              '5. Accuracy of Materials',
              'The materials appearing on StatDoctor could include technical, typographical, or photographic errors.',
            ),
            
            _buildSection(
              '6. Links',
              'StatDoctor has not reviewed all of the sites linked to our website and is not responsible for the contents of any such linked site.',
            ),
            
            _buildSection(
              '7. Modifications',
              'StatDoctor may revise these terms of service at any time without notice.',
            ),
            
            _buildSection(
              '8. Governing Law',
              'These terms and conditions are governed by and construed in accordance with the laws of Australia.',
            ),
            
            SizedBox(height: 4.h),
            
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: AppColors.scaffoldBackground,
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Text(
                'If you have any questions about these Terms of Service, please contact us at support@statdoctor.com',
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
