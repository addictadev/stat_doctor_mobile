import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/widgets/custom_textform_field.dart';
import '../../../../core/widgets/custom_dropdown_field.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/utils/styles/font_utils.dart';

class ReferenceData {
  final TextEditingController nameController;
  final TextEditingController mobileController;
  final TextEditingController emailController;
  final TextEditingController hospitalController;
  String? specialty;
  String? seniority;

  ReferenceData({
    required this.nameController,
    required this.mobileController,
    required this.emailController,
    required this.hospitalController,
    this.specialty,
    this.seniority,
  });

  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    hospitalController.dispose();
  }
}

class ReferencesStep extends StatefulWidget {
  const ReferencesStep({super.key});

  @override
  State<ReferencesStep> createState() => _ReferencesStepState();
}

class _ReferencesStepState extends State<ReferencesStep> {
  final _formKey = GlobalKey<FormState>();
  
  // List to store all references
  final List<ReferenceData> _references = [];
  
  @override
  void initState() {
    super.initState();
    // Initialize with first reference with default data
    _references.add(ReferenceData(
      nameController: TextEditingController(),
      mobileController: TextEditingController(),
      emailController: TextEditingController(),
      hospitalController: TextEditingController(),
    ));
  }

  final List<String> _specialties = [
    'General Practice',
    'Cardiology',
    'Dermatology',
    'Pediatrics',
    'Orthopedics',
    'Neurology',
    'Psychiatry',
    'Emergency Medicine',
    'Internal Medicine',
    'Surgery',
    'Radiology',
    'Anesthesiology',
    'Pathology',
    'Oncology',
    'Other',
  ];

  final List<String> _seniorityLevels = [
    'Junior',
    'Senior',
    'Consultant',
    'Specialist',
    'Professor',
    'Head of Department',
    'Director',
    'Other',
  ];

  @override
  void dispose() {
    for (var reference in _references) {
      reference.dispose();
    }
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
            // Instructional text
            Text(
              'references_assessment_info'.tr(),
              style: TextStyles.textViewRegular14.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            SizedBox(height: 30),
            
            // All References
            ...List.generate(_references.length, (index) {
              final reference = _references[index];
              final isFirst = index == 0;
              return Column(
                children: [
                  _buildReferenceSection(
                    title: isFirst ? 'Reference one' : 'Reference ${index + 1}',
                    reference: reference,
                    index: index,
                  ),
                  SizedBox(height: 20),
                ],
              );
            }),
            
            // Add Another Reference Button (only show if less than 3 references)
            if (_references.length < 3) ...[
              _buildAddReferenceButton(),
              SizedBox(height: 20),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAddReferenceButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _references.add(ReferenceData(
            nameController: TextEditingController(),
            mobileController: TextEditingController(),
            emailController: TextEditingController(),
            hospitalController: TextEditingController(),
          ));
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add,
              color: AppColors.primary,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              'add_another_reference'.tr(),
              style: TextStyles.textViewRegular14.copyWith(
                fontWeight: AppFont.semiBold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReferenceSection({
    required String title,
    required ReferenceData reference,
    required int index,
  }) {
    return Container(
      padding: EdgeInsets.all(4.w),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child:                 Text(
                  title.tr(),
                  style: TextStyles.textViewRegular16.copyWith(
                    fontWeight: AppFont.semiBold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              // Remove button for references after the first one
              if (index > 0)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _references[index].dispose();
                      _references.removeAt(index);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.close,
                      color: AppColors.error,
                      size: 20,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 20),
          
          // Reference's full name
          CustomTextFormField(
            controller: reference.nameController,
            placeholder: 'reference_full_name'.tr(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please_enter_reference_name'.tr();
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          
          // Reference's mobile
          CustomTextFormField(
            controller: reference.mobileController,
            placeholder: 'reference_mobile'.tr(),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please_enter_mobile_number'.tr();
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          
          // Reference's email
          CustomTextFormField(
            controller: reference.emailController,
            placeholder: 'reference_email'.tr(),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please_enter_email_address'.tr();
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'please_enter_valid_email'.tr();
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          
          // Select reference's specialty
          CustomDropdownField(
            label: 'select_reference_specialty'.tr(),
            hint: 'select'.tr(),
            value: reference.specialty,
            items: _specialties.map((specialty) {
              return DropdownMenuItem<String>(
                value: specialty,
                child: Text(specialty),
              );
            }).toList(),
            onChanged: (value) => setState(() => reference.specialty = value),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please_select_specialty'.tr();
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          
          // Select reference's seniority
          CustomDropdownField(
            label: 'select_reference_seniority'.tr(),
            hint: 'select'.tr(),
            value: reference.seniority,
            items: _seniorityLevels.map((seniority) {
              return DropdownMenuItem<String>(
                value: seniority,
                child: Text(seniority),
              );
            }).toList(),
            onChanged: (value) => setState(() => reference.seniority = value),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please_select_seniority'.tr();
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          
          // Reference's current hospital
          CustomTextFormField(
            controller: reference.hospitalController,
            placeholder: 'reference_current_hospital'.tr(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please_enter_hospital_name'.tr();
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
