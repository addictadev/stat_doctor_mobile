import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/widgets/custom_dropdown_field.dart';
import '../../../../core/widgets/custom_textform_field.dart';
import '../../../../core/widgets/custom_radio_tile.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/utils/styles/font_utils.dart';

class MedicalInfoStep extends StatefulWidget {
  const MedicalInfoStep({super.key});

  @override
  State<MedicalInfoStep> createState() => _MedicalInfoStepState();
}

class _MedicalInfoStepState extends State<MedicalInfoStep> {
  final _formKey = GlobalKey<FormState>();
  final _abnController = TextEditingController(text: '12 345 678 901');
  final _bioController = TextEditingController();
  
  String? _selectedDegree;
  String? _selectedSkillLevel;
  String? _selectedSpecialty;
  bool _hasRestrictions = true;

  final List<String> _medicalDegrees = [
    'MBBS',
    'MD',
    'DO',
    'PhD in Medicine',
    'BDS',
    'BPharm',
    'MPharm',
    'Other',
  ];

  final List<String> _skillLevels = [
    'Beginner',
    'Intermediate',
    'Advanced',
    'Expert',
  ];

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
    'Other',
  ];

  @override
  void dispose() {
    _abnController.dispose();
    _bioController.dispose();
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
            // Medical Degree Dropdown
            CustomDropdownField(
              label: 'select_your_medical_degree'.tr(),
              hint: 'select'.tr(),
              value: _selectedDegree,
              items: _medicalDegrees.map((degree) {
                return DropdownMenuItem<String>(
                  value: degree,
                  child: Text(degree),
                );
              }).toList(),
              onChanged: (value) => setState(() => _selectedDegree = value),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please_select_medical_degree'.tr();
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            
            // Skill Level Dropdown
            CustomDropdownField(
              label: 'what_is_your_skill_level'.tr(),
              hint: 'select'.tr(),
              value: _selectedSkillLevel,
              items: _skillLevels.map((level) {
                return DropdownMenuItem<String>(
                  value: level,
                  child: Text(level),
                );
              }).toList(),
              onChanged: (value) => setState(() => _selectedSkillLevel = value),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please_select_skill_level'.tr();
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            
            // Specialties Dropdown
            CustomDropdownField(
              label: 'add_your_specialties'.tr(),
              hint: 'select'.tr(),
              value: _selectedSpecialty,
              items: _specialties.map((specialty) {
                return DropdownMenuItem<String>(
                  value: specialty,
                  child: Text(specialty),
                );
              }).toList(),
              onChanged: (value) => setState(() => _selectedSpecialty = value),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please_select_specialty'.tr();
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            
            // AHPRA License Restrictions
            Text(
              'do_you_have_restrictions'.tr(),
              style: TextStyles.textViewRegular14.copyWith(
                fontWeight: AppFont.semiBold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 12),
            
            Row(
              children: [
                Expanded(
                  child: CustomRadioTile(
                    title: 'no'.tr(),
                    isSelected: !_hasRestrictions,
                    onTap: () => setState(() => _hasRestrictions = false),
                    selectedColor: AppColors.primary,
                    unselectedColor: AppColors.white,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: CustomRadioTile(
                    title: 'yes'.tr(),
                    isSelected: _hasRestrictions,
                    onTap: () => setState(() => _hasRestrictions = true),
                    selectedColor: AppColors.primary,
                    unselectedColor: AppColors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            
            // ABN Field
            CustomTextFormField(
              controller: _abnController,
              placeholder: 'enter_your_abn'.tr(),
              keyboardType: TextInputType.number,
              borderRadius: 25,
            ),
            SizedBox(height: 20),
            
            // Bio Text Area
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'write_work_bio'.tr(),
                  style: TextStyles.textViewRegular14.copyWith(
                    fontWeight: AppFont.semiBold,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 8),
                CustomTextFormField(
                  controller: _bioController,
                  placeholder: 'type'.tr(),
                  maxLines: 5,
                  maxLength: 850,
                  borderRadius: 25,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please_write_bio'.tr();
                    }
                    if (value.length < 50) {
                      return 'bio_min_length'.tr();
                    }
                    return null;
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            
            // CV Upload
            Text(
              'cv_resume'.tr(),
              style: TextStyles.textViewRegular14.copyWith(
                fontWeight: AppFont.semiBold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 8),
            
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: AppColors.borderLight,
                  width: 1,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: _uploadCV,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.upload,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'upload_document'.tr(),
                        style: TextStyles.textViewRegular14.copyWith(
                          fontWeight: AppFont.semiBold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _uploadCV() {
    // TODO: Implement file upload functionality
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('upload_cv'.tr()),
        content: Text('file_upload_placeholder'.tr()),
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
