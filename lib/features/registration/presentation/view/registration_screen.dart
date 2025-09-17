import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/widgets/registration_step_indicator.dart';
import '../../../../core/widgets/primary_button.dart';
import 'personal_info_step.dart';
import 'medical_info_step.dart';
import 'references_step.dart';
import 'documentation_step.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int currentStep = 1;
  final PageController _pageController = PageController();
  
  List<String> get stepLabels => [
    'personal_info'.tr(),
    'medical_info'.tr(),
    'references'.tr(),
    'documentation'.tr(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (currentStep < 4) {
      setState(() {
        currentStep++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousStep() {
    if (currentStep > 1) {
      setState(() {
        currentStep--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.textPrimary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'enter_your_data_to_create_account'.tr(),
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
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 2.h),
          // Step indicator
          RegistrationStepIndicator(
            currentStep: currentStep,
            totalSteps: 4,
            
            stepLabels: stepLabels,
            activeColor: AppColors.primary,
            completedColor: AppColors.primary,
            inactiveColor: AppColors.borderLight,
            textColor: AppColors.textPrimary,
            completedTextColor: AppColors.primary,
          ),
          
          // Content area
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                PersonalInfoStep(),
                MedicalInfoStep(),
                ReferencesStep(),
                DocumentationStep(),
              ],
            ),
          ),
          
          // Navigation buttons
          Container(
            padding: EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context)),
            child: Row(
              children: [
                if (currentStep > 1)
                    Expanded(
                      child: PrimaryButton(
                        text: 'previous'.tr(),
                      onPressed: _previousStep,
                      color: AppColors.white,
                      textStyle: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                if (currentStep > 1) SizedBox(width: 16),
                  Expanded(
                    child: PrimaryButton(
                      text: currentStep == 4 ? 'complete'.tr() : 'next'.tr(),
                    onPressed: _nextStep,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
