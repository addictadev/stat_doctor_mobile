import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/core/utils/responsive_utils.dart';
import 'package:stat_doctor/core/navigation_services/navigation_manager.dart';
import 'package:stat_doctor/features/settings/presentation/widgets/settings_toggle_item.dart';
import 'package:stat_doctor/features/settings/presentation/widgets/settings_navigation_item.dart';
import 'package:stat_doctor/features/settings/presentation/view/terms_of_service_screen.dart';
import 'package:stat_doctor/features/settings/presentation/view/privacy_policy_screen.dart';
import 'package:stat_doctor/features/settings/presentation/view/contact_support_screen.dart';
import 'package:stat_doctor/features/settings/presentation/view/about_statdoctor_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Settings state
  bool _useBiometricLogin = true;
  bool _allowLocationAccess = true;

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
          'Settings',
          style: TextStyles.textViewBold18.copyWith(
            color: AppColors.textPrimary,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveUtils.getResponsivePadding(context),
        ),
        child: Column(
          children: [
            SizedBox(height: 2.h),
            
            // Toggle Settings
            _buildToggleSettings(),
            
            
            // Navigation Settings
            _buildNavigationSettings(),
            
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleSettings() {
    return Column(
      children: [
        SettingsToggleItem(
          title: 'Use Biometric login',
          value: _useBiometricLogin,
          onChanged: (value) {
            setState(() {
              _useBiometricLogin = value;
            });
            _showToggleFeedback('Biometric login', value);
          },
        ),
  
        SettingsToggleItem(
          title: 'Allow app to use your location',
          value: _allowLocationAccess,
          onChanged: (value) {
            setState(() {
              _allowLocationAccess = value;
            });
            _showToggleFeedback('Location access', value);
          },
        ),
      ],
    );
  }

  Widget _buildNavigationSettings() {
    return Column(
      children: [
        SettingsNavigationItem(
          title: 'Terms of Service',
          onTap: () => NavigationManager.navigateTo(const TermsOfServiceScreen()),
        ),
       
        SettingsNavigationItem(
          title: 'Privacy Policy',
          onTap: () => NavigationManager.navigateTo(const PrivacyPolicyScreen()),
        ),
      
        SettingsNavigationItem(
          title: 'Contact support',
          onTap: () => NavigationManager.navigateTo(const ContactSupportScreen()),
        ),
        Divider(
          height: 1,
          color: AppColors.borderLight.withOpacity(0.3),
          indent: 4.w,
          endIndent: 4.w,
        ),
        SettingsNavigationItem(
          title: 'About StatDoctor',
          onTap: () => NavigationManager.navigateTo(const AboutStatDoctorScreen()),
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
