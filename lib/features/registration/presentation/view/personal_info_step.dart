import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:stat_doctor/core/images_preview/app_assets.dart';
import 'package:stat_doctor/core/images_preview/custom_svg_img.dart' show CustomSvgImage;
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/widgets/custom_textform_field.dart';
import '../../../../core/widgets/profile_image_picker.dart';
import '../../../../core/widgets/custom_toggle_switch.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/utils/styles/font_utils.dart';

class PersonalInfoStep extends StatefulWidget {
  const PersonalInfoStep({super.key});

  @override
  State<PersonalInfoStep> createState() => _PersonalInfoStepState();
}

class _PersonalInfoStepState extends State<PersonalInfoStep> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController(text: 'Ahmed');
  final _lastNameController = TextEditingController(text: 'mobark');
  final _emailController = TextEditingController(text: 'mobark@gmail.com');
  
  bool _useFaceID = true;
  bool _useTouchID = true;
  String? _profileImagePath;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context)),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Professional Data Section
            _buildSectionTitle('professional_data'.tr()),
            SizedBox(height: 20),
            
            // Photo Profile
            ProfileImagePicker(
                imagePath: _profileImagePath,
                onTap: _pickProfileImage,
                size: 100,
              
            ),
            SizedBox(height: 30),
            
            // First Name
            CustomTextFormField(
              controller: _firstNameController,
              placeholder: 'first_name'.tr(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please_enter_first_name'.tr();
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            
            // Last Name
            CustomTextFormField(
              controller: _lastNameController,
              placeholder: 'last_name'.tr(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please_enter_last_name'.tr();
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            
            // Email Address
            CustomTextFormField(
              controller: _emailController,
              placeholder: 'email_address'.tr(),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please_enter_email'.tr();
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                  return 'please_enter_valid_email'.tr();
                }
                return null;
              },
            ),
            SizedBox(height: 40),
            
            // Login Methods Section
            _buildSectionTitle('login_methods'.tr()),
            SizedBox(height: 20),
            
            // FaceID Option
            _buildLoginMethodCard(
              icon: AppAssets.faceId,
              title: 'faceid'.tr(),
              subtitle: 'do_you_want_to_use_faceid'.tr(),
              value: _useFaceID,
              onChanged: (value) => setState(() => _useFaceID = value),
            ),
            SizedBox(height: 1.h),
            
            // TouchID Option
            _buildLoginMethodCard(
              icon: AppAssets.touchId,
              title: 'touchid'.tr(),
              subtitle: 'do_you_want_to_use_touchid'.tr(),
              value: _useTouchID,
              onChanged: (value) => setState(() => _useTouchID = value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyles.textViewRegular18.copyWith(
        fontWeight: AppFont.semiBold,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildLoginMethodCard({
    required String icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          ResponsiveUtils.getResponsiveBorderRadius(context),
        ),
        border: Border.all(
          color: AppColors.borderLight,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              // color: AppColors.bgProfile,
              borderRadius: BorderRadius.circular(8),
            ),
            child: CustomSvgImage(assetName: icon),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.textViewRegular14.copyWith(
                    fontWeight: AppFont.semiBold,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyles.textViewRegular12.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          CustomToggleSwitch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.success,
          ),
        ],
      ),
    );
  }

  void _pickProfileImage() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('pick_profile_image'.tr()),
        content: Text('image_picker_placeholder'.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('ok'.tr()),
          ),
        ],
      ),
    );
  }
}
