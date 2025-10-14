import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/styles/styles.dart';
import '../../../core/widgets/primary_button.dart';

class EditMedicalProfileScreen extends StatelessWidget {
  const EditMedicalProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: _Header(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            // Medical Degree Field
            _DropdownField(
              label: 'Select your medical degree',
              value: 'Doctor of medicine',
              items: const [
                'Doctor of medicine',
                'Bachelor of Medicine',
                'Master of Medicine',
                'Doctor of Osteopathic Medicine',
              ],
            ),
            
            SizedBox(height: 3.h),
            
            // Skill Level Field
            _DropdownField(
              label: 'What is your skill level',
              value: 'VMO/SMO',
              items: const [
                'VMO/SMO',
                'Registrar',
                'Resident',
                'Intern',
                'Consultant',
              ],
            ),
            
            SizedBox(height: 3.h),
            
            // Specialties Field
            _DropdownField(
              label: 'Add your specialties',
              value: 'Emergency Medicine',
              items: const [
                'Emergency Medicine',
                'Intensive Care Medicine',
                'General Practice',
                'Surgery',
                'Pediatrics',
                'Cardiology',
                'Neurology',
                'Orthopedics',
              ],
            ),
            
            SizedBox(height: 3.h),
            
            // AHPRA Restrictions Toggle
            _ToggleField(
              label: 'Do you have any restrictions on your AHPRA license?',
              value: true,
            ),
            
            SizedBox(height: 3.h),
            
            // ABN Field
            _InputField(
              label: 'Enter your ABN (optional)',
              value: '12 345 678 901',
            ),
            
            SizedBox(height: 3.h),
            
            // Bio Field
            _BioField(
              label: 'Bio',
              value: 'I am a PGY6 doctor with ED, paediatric, and surgical experience. Currently in an unaccredited surgical registrar role in Melbourne. Taking 6 months off for locum work in Victoria before starting surgical training. Competent in airway skills.',
            ),
            
            SizedBox(height: 3.h),
            
            // CV/Resume Section
            _CVSection(),
            
            SizedBox(height: 4.h),
          ],
        ),
      ),
      bottomNavigationBar: _BottomNavigationBar(),
    );
  }
}

class _Header extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.textPrimary,
          size: 20,
        ),
      ),
      title: Text(
        'Edit Medical profile',
        style: TextStyles.textViewBold18.copyWith(
          color: AppColors.textPrimary,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _InputField extends StatelessWidget {
  final String label;
  final String value;

  const _InputField({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.textViewMedium16.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 1.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.borderLight,
              width: 1,
            ),
          ),
          child: Text(
            value,
            style: TextStyles.textViewRegular16.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}

class _DropdownField extends StatelessWidget {
  final String label;
  final String value;
  final List<String> items;

  const _DropdownField({
    required this.label,
    required this.value,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.textViewMedium16.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 1.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.borderLight,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: TextStyles.textViewRegular16.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.textSecondary,
                size: 24,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ToggleField extends StatelessWidget {
  final String label;
  final bool value;

  const _ToggleField({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.textViewMedium16.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            _ToggleOption(
              text: 'NO',
              isSelected: !value,
            ),
            SizedBox(width: 2.w),
            _ToggleOption(
              text: 'Yes',
              isSelected: value,
            ),
          ],
        ),
      ],
    );
  }
}

class _ToggleOption extends StatelessWidget {
  final String text;
  final bool isSelected;

  const _ToggleOption({
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.borderLight,
        borderRadius: BorderRadius.circular(8),
        border: isSelected 
            ? Border.all(color: AppColors.primary, width: 1)
            : null,
      ),
      child: Text(
        text,
        style: TextStyles.textViewMedium16.copyWith(
          color: isSelected ? AppColors.white : AppColors.textSecondary,
        ),
      ),
    );
  }
}

class _BioField extends StatelessWidget {
  final String label;
  final String value;

  const _BioField({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.textViewMedium16.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 1.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.borderLight,
              width: 1,
            ),
          ),
          child: Text(
            value,
            style: TextStyles.textViewRegular16.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}

class _CVSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CV / Resume',
          style: TextStyles.textViewMedium16.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 1.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.borderLight,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 8.w,
                height: 8.w,
                decoration: BoxDecoration(
                  color: AppColors.error,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  Icons.picture_as_pdf,
                  color: AppColors.white,
                  size: 4.w,
                ),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: Text(
                  'Medical Degree',
                  style: TextStyles.textViewRegular16.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Container(
                width: 6.w,
                height: 6.w,
                decoration: BoxDecoration(
                  color: AppColors.borderLight,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  color: AppColors.textSecondary,
                  size: 3.w,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: PrimaryButton(
          text: 'Next',
          onPressed: () {
            // TODO: Implement next action
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Next action coming soon'),
                backgroundColor: AppColors.info,
              ),
            );
          },
        ),
      ),
    );
  }
}
