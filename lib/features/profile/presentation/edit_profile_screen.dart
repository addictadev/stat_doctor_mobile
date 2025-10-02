import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/styles/styles.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_textform_field.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/navigation_services/navigation_manager.dart';
import '../domain/entities/user_profile_entity.dart';

class EditProfileScreen extends StatefulWidget {
  final UserProfileEntity userProfile;

  const EditProfileScreen({
    super.key,
    required this.userProfile,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _firstNameController = TextEditingController(text: widget.userProfile.firstName);
    _lastNameController = TextEditingController(text: widget.userProfile.lastName);
    _phoneController = TextEditingController(text: widget.userProfile.phoneNumber);
    _emailController = TextEditingController(text: widget.userProfile.email);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    // Validate form
    if (_firstNameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter your first name'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (_lastNameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter your last name'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (_phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter your phone number'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (_emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter your email'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    // In a real app, this would save to a service
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile updated successfully'),
        backgroundColor: AppColors.success,
      ),
    );

    NavigationManager.pop();
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Account'),
          content: Text('Are you sure you want to delete your account? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // TODO: Implement account deletion
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Account deletion coming soon'),
                    backgroundColor: AppColors.info,
                  ),
                );
              },
              child: Text(
                'Delete',
                style: TextStyle(color: AppColors.error),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomAppBar(
        title: 'Edit Profile',
        backgroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            // Profile Image Section
            _buildProfileImageSection(),
            
            SizedBox(height: 4.h),
            
            // Form Fields
            _buildFormFields(),
            
            SizedBox(height: 4.h),
            
            // Delete Account Button
            _buildDeleteAccountButton(),
            
            SizedBox(height: 4.h),
            
            // Save Button
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImageSection() {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 25.w,
            height: 25.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.borderLight,
                width: 2,
              ),
            ),
            child: ClipOval(
              child: widget.userProfile.profileImage != null
                  ? Image.network(
                      widget.userProfile.profileImage!,
                      width: 25.w,
                      height: 25.w,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildPlaceholder();
                      },
                    )
                  : _buildPlaceholder(),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                // TODO: Implement image picker
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Image picker coming soon'),
                    backgroundColor: AppColors.info,
                  ),
                );
              },
              child: Container(
                width: 8.w,
                height: 8.w,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.white,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Iconsax.camera,
                  color: AppColors.white,
                  size: 4.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: 25.w,
      height: 25.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.borderLight,
      ),
      child: Icon(
        Icons.person,
        color: AppColors.textSecondary,
        size: 12.w,
      ),
    );
  }

  Widget _buildFormFields() {
    return Container(
      padding: EdgeInsets.all(4.w),
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
          // Name Field
          CustomTextFormField(
            controller: _firstNameController,
            label: 'Name',
            placeholder: 'Enter your first name',
            prefixIcon: Icon(Iconsax.user),
          ),
          
          SizedBox(height: 3.h),
          
          // Surname Field
          CustomTextFormField(
            controller: _lastNameController,
            label: 'Surname',
            placeholder: 'Enter your last name',
            prefixIcon: Icon(Iconsax.user),
          ),
          
          SizedBox(height: 3.h),
          
          // Phone Number Field
          CustomTextFormField(
            controller: _phoneController,
            label: 'Phone Number',
            placeholder: 'Enter your phone number',
            prefixIcon: Icon(Iconsax.call),
            keyboardType: TextInputType.phone,
          ),
          
          SizedBox(height: 3.h),
          
          // Email Field
          CustomTextFormField(
            controller: _emailController,
            label: 'Email',
            placeholder: 'Enter your email',
            prefixIcon: Icon(Iconsax.sms),
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }

  Widget _buildDeleteAccountButton() {
    return GestureDetector(
      onTap: _showDeleteAccountDialog,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Text(
          'Delete Account',
          style: TextStyles.textViewMedium16.copyWith(
            color: AppColors.error,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: 6.h,
      child: PrimaryButton(
        text: 'Save changes',
        onPressed: _saveChanges,
      ),
    );
  }
}
