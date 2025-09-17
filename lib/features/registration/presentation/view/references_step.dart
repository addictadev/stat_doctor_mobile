import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/widgets/custom_textform_field.dart';
import '../../../../core/widgets/primary_button.dart';

class ReferencesStep extends StatefulWidget {
  const ReferencesStep({super.key});

  @override
  State<ReferencesStep> createState() => _ReferencesStepState();
}

class _ReferencesStepState extends State<ReferencesStep> {
  final _formKey = GlobalKey<FormState>();
  
  // Reference 1
  final _ref1NameController = TextEditingController();
  final _ref1TitleController = TextEditingController();
  final _ref1EmailController = TextEditingController();
  final _ref1PhoneController = TextEditingController();
  final _ref1RelationshipController = TextEditingController();
  
  // Reference 2
  final _ref2NameController = TextEditingController();
  final _ref2TitleController = TextEditingController();
  final _ref2EmailController = TextEditingController();
  final _ref2PhoneController = TextEditingController();
  final _ref2RelationshipController = TextEditingController();
  
  // Reference 3
  final _ref3NameController = TextEditingController();
  final _ref3TitleController = TextEditingController();
  final _ref3EmailController = TextEditingController();
  final _ref3PhoneController = TextEditingController();
  final _ref3RelationshipController = TextEditingController();

  @override
  void dispose() {
    _ref1NameController.dispose();
    _ref1TitleController.dispose();
    _ref1EmailController.dispose();
    _ref1PhoneController.dispose();
    _ref1RelationshipController.dispose();
    
    _ref2NameController.dispose();
    _ref2TitleController.dispose();
    _ref2EmailController.dispose();
    _ref2PhoneController.dispose();
    _ref2RelationshipController.dispose();
    
    _ref3NameController.dispose();
    _ref3TitleController.dispose();
    _ref3EmailController.dispose();
    _ref3PhoneController.dispose();
    _ref3RelationshipController.dispose();
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
            Text(
              'professional_references'.tr(),
              style: ResponsiveUtils.getResponsiveTextStyle(
                context,
                fontSize: ResponsiveUtils.getResponsiveFontSize(
                  context,
                  mobile: 18,
                  tablet: 20,
                  desktop: 22,
                ),
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'provide_references'.tr(),
              style: ResponsiveUtils.getResponsiveTextStyle(
                context,
                fontSize: ResponsiveUtils.getResponsiveFontSize(
                  context,
                  mobile: 14,
                  tablet: 16,
                  desktop: 18,
                ),
                color: AppColors.textSecondary,
              ),
            ),
            SizedBox(height: 30),
            
            // Reference 1
            _buildReferenceSection(
              title: 'reference 1',
              nameController: _ref1NameController,
              titleController: _ref1TitleController,
              emailController: _ref1EmailController,
              phoneController: _ref1PhoneController,
              relationshipController: _ref1RelationshipController,
              isRequired: true,
            ),
            SizedBox(height: 30),
            
            // Reference 2
            _buildReferenceSection(
              title: 'reference 2',
              nameController: _ref2NameController,
              titleController: _ref2TitleController,
              emailController: _ref2EmailController,
              phoneController: _ref2PhoneController,
              relationshipController: _ref2RelationshipController,
              isRequired: true,
            ),
            SizedBox(height: 30),
            
            // Reference 3
            _buildReferenceSection(
              title: 'reference_optional'.tr(),
              nameController: _ref3NameController,
              titleController: _ref3TitleController,
              emailController: _ref3EmailController,
              phoneController: _ref3PhoneController,
              relationshipController: _ref3RelationshipController,
              isRequired: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReferenceSection({
    required String title,
    required TextEditingController nameController,
    required TextEditingController titleController,
    required TextEditingController emailController,
    required TextEditingController phoneController,
    required TextEditingController relationshipController,
    required bool isRequired,
  }) {
    return Container(
      padding: EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: ResponsiveUtils.getResponsiveTextStyle(
              context,
              fontSize: ResponsiveUtils.getResponsiveFontSize(
                context,
                mobile: 16,
                tablet: 18,
                desktop: 20,
              ),
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 20),
          
          // Full Name
          CustomTextFormField(
            controller: nameController,
            placeholder: 'full_name'.tr(),
            validator: isRequired ? (value) {
              if (value == null || value.isEmpty) {
                return 'please_enter_reference_name'.tr();
              }
              return null;
            } : null,
          ),
          SizedBox(height: 16),
          
          // Job Title
          CustomTextFormField(
            controller: titleController,
            placeholder: 'job_title'.tr(),
            validator: isRequired ? (value) {
              if (value == null || value.isEmpty) {
                return 'please_enter_reference_title'.tr();
              }
              return null;
            } : null,
          ),
          SizedBox(height: 16),
          
          // Email
          CustomTextFormField(
            controller: emailController,
            placeholder: 'email_address'.tr(),
            keyboardType: TextInputType.emailAddress,
            validator: isRequired ? (value) {
              if (value == null || value.isEmpty) {
                return 'please_enter_reference_email'.tr();
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'please_enter_valid_reference_email'.tr();
              }
              return null;
            } : null,
          ),
          SizedBox(height: 16),
          
          // Phone
          CustomTextFormField(
            controller: phoneController,
            placeholder: 'phone_number'.tr(),
            keyboardType: TextInputType.phone,
            validator: isRequired ? (value) {
              if (value == null || value.isEmpty) {
                return 'please_enter_reference_phone'.tr();
              }
              return null;
            } : null,
          ),
          SizedBox(height: 16),
          
          // Relationship
          CustomTextFormField(
            controller: relationshipController,
            placeholder: 'professional_relationship'.tr(),
            validator: isRequired ? (value) {
              if (value == null || value.isEmpty) {
                return 'please_describe_relationship'.tr();
              }
              return null;
            } : null,
          ),
        ],
      ),
    );
  }
}
