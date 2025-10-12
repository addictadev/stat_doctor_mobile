import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/navigation_services/navigation_manager.dart';
import '../../../profile/data/models/user_profile_model.dart';
import '../../../profile/presentation/widgets/profile_header_card.dart';
import '../../../profile/presentation/widgets/profile_menu_item.dart';
import '../../../profile/presentation/widgets/logout_button.dart';
import '../../../profile/presentation/widgets/logout_confirmation_dialog.dart';
import '../../../profile/presentation/edit_profile_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late UserProfileModel _userProfile;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  void _loadUserProfile() {
    // In a real app, this would load from a service or local storage
    _userProfile = UserProfileModel.sample();
  }

  Future<void> _showLogoutDialog() async {
    final result = await LogoutConfirmationDialog.show(context);
    if (result == true) {
      _handleLogout();
    }
  }

  void _handleLogout() {
    // In a real app, this would clear user session and navigate to login
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Logged out successfully'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  void _navigateToEditProfile() {
    NavigationManager.navigateTo(EditProfileScreen(userProfile: _userProfile));
  }

  void _navigateToMedicalProfile() {
    // TODO: Implement medical profile screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Medical profile coming soon'),
        backgroundColor: AppColors.info,
      ),
    );
  }

  void _navigateToReferences() {
    // TODO: Implement references screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('References coming soon'),
        backgroundColor: AppColors.info,
      ),
    );
  }

  void _navigateToDocuments() {
    // TODO: Implement documents screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Documents coming soon'),
        backgroundColor: AppColors.info,
      ),
    );
  }

  void _navigateToNotifications() {
    // TODO: Navigate to notifications screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Notifications coming soon'),
        backgroundColor: AppColors.info,
      ),
    );
  }

  void _navigateToSettings() {
    // TODO: Implement settings screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Settings coming soon'),
        backgroundColor: AppColors.info,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Header Card
              ProfileHeaderCard(
                userProfile: _userProfile,
                onEditProfile: _navigateToEditProfile,
                onProfileImageTap: _navigateToEditProfile,
              ),

              // Menu Items
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ProfileMenuItem(
                      icon: Iconsax.heart,
                      title: 'Medical profile',
                      onTap: _navigateToMedicalProfile,
                    ),
                    ProfileMenuItem(
                      icon: Iconsax.verify,
                      title: 'References',
                      subtitle: '1/2 verified',
                      onTap: _navigateToReferences,
                      iconColor: AppColors.success,
                    ),
                    ProfileMenuItem(
                      icon: Iconsax.document_text,
                      title: 'Proof of ID & other documents',
                      onTap: _navigateToDocuments,
                    ),
                    ProfileMenuItem(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      onTap: _navigateToNotifications,
                    ),
                    ProfileMenuItem(
                      icon: Iconsax.setting,
                      title: 'StatDoctor Settings',
                      onTap: _navigateToSettings,
                      showDivider: false,
                    ),
                  ],
                ),
              ),

              // Logout Button
              LogoutButton(
                onLogout: _showLogoutDialog,
              ),

              // Copyright
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Text(
                  'StatDoctor © 2025 v1.0',
                  style: TextStyles.textViewRegular12.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),

              // Bottom padding for better scrolling
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }
}
