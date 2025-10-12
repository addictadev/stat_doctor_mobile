import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:stat_doctor/core/images_preview/app_assets.dart';
import 'package:stat_doctor/core/images_preview/custom_asset_img.dart' show CustomImageAsset;
import 'package:stat_doctor/core/images_preview/custom_svg_img.dart';
import 'package:stat_doctor/features/apply_shifts/presentation/widgets/expandable_section.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../references/presentation/widgets/reference_card.dart';
import '../../../references/data/models/reference_model.dart';

class ApplyScreen extends StatefulWidget {
  final int numberOfShifts;
  final String hospitalName;

  const ApplyScreen({
    super.key,
    required this.numberOfShifts,
    required this.hospitalName,
  });

  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [          
                  SizedBox(height: 2.h),
        Padding(padding: EdgeInsets.symmetric(horizontal: 1.w),
        child:               Text(
            '${'you_are_applying_for'.tr()} ${widget.numberOfShifts} ${'shifts'.tr()} ${widget.hospitalName}',
            style: TextStyles.textViewBold16.copyWith(
              color: AppColors.textPrimary,
            ),
          ),),
          SizedBox(height: 2.h),
                  Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.borderLight),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [    
         
                 _buildApplicationInfoSection(),
                  SizedBox(height: 1.5.h),
                  _buildPersonalDetailsSection(),
                  SizedBox(height: 1.5.h),
                  _buildMedicalProfileSection(),
                  SizedBox(height: 1.5.h),
                  _buildReferencesSection(),
                  SizedBox(height: 1.5.h),
                  _buildNextStepsSection(),],),
                  ),
                  
                  SizedBox(height: 4.h),
                ],
              ),
            ),
          ),
          _buildConfirmButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(
        left: 4.w,
        right: 4.w,
        top: 8.h,
        bottom: 2.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(1.w),
           
              child: Icon(
                Iconsax.close_square,
                color: AppColors.textPrimary,
                size: 7.w,
              ),
            ),
          ),
          SizedBox(width: 2.w),
          Expanded(
            child: Text(
              'apply'.tr(),
              style: TextStyles.textViewBold18.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApplicationInfoSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: .5.h),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Application summary
          Text(
'Your application info',
            style: TextStyles.textViewBold16.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 1.h),
          
          // Description
          Text(
            'review_details_before_applying'.tr(),
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
          SizedBox(height: 1.5.h),
          Divider(color: AppColors.borderLight,),
        ],
      ),
    );
  }

  Widget _buildPersonalDetailsSection() {
    return ExpandableSection(
      title: 'your_personal_details'.tr(),
      child: Container(
        padding: EdgeInsets.only(top:2.w),
        child: Row(
          children: [
            // Profile image
            CircleAvatar(
              radius: 6.w,
              backgroundColor: AppColors.primary.withOpacity(0.1),
              child: Icon(
                Iconsax.user,
                color: AppColors.primary,
                size: 8.w,
              ),
            ),
            SizedBox(width: 3.w),
            // User details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'dr_sarah_cooper'.tr(),
                    style: TextStyles.textViewBold16.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    'sarahcooper_gmail_com'.tr(),
                    style: TextStyles.textViewRegular14.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicalProfileSection() {
    return ExpandableSection(
      title: 'medical_profile'.tr(),
      child: Container(
        padding: EdgeInsets.all(3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMedicalInfoRow('medical_degree'.tr(), 'doctor_of_medicine'.tr()),
            SizedBox(height: 1.h),
            _buildMedicalInfoRow('skill level', 'vmo_smo'.tr()),
            SizedBox(height: 1.h),
            _buildMedicalInfoRow('specialty', 'emergency_medicine'.tr()),
            SizedBox(height: 1.h),
            _buildMedicalInfoRow('AHPRA Number', 'MED0002352779'),
            SizedBox(height: 1.h),
            _buildMedicalInfoRow('AHPRA restrictions', 'no'.tr()),
            SizedBox(height: 1.5.h),
            
            // Bio section
            Text(
              'Bio',
              style: TextStyles.textViewSemiBold14.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 0.5.h),
            Text(
              'bio_description'.tr(),
              style: TextStyles.textViewRegular14.copyWith(
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
            SizedBox(height: 1.5.h),
              Text(
              'Cv/Resume',
              style: TextStyles.textViewSemiBold14.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
              SizedBox(height: 1.h),
            // CV section
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            decoration: BoxDecoration(
        
              borderRadius: BorderRadius.circular(20.w),
              border: Border.all(color: AppColors.borderLight),
            ),
          child:   Row(
              children: [
              CustomSvgImage(assetName: AppAssets.pdfIc,width: 6.w,height: 6.w,),
                SizedBox(width: 2.w),
                Text(
                  'medical_degree'.tr(),
                  style: TextStyles.textViewSemiBold14.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          )
          ],
        ),
      ),
    );
  }

  Widget _buildMedicalInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 35.w,
          child: Text(
            label,
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyles.textViewSemiBold14.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReferencesSection() {
    return ExpandableSection(
      title: 'references'.tr(),
      child: Column(
        children: [
          _buildReferenceCard(
            name: 'dr_james_branden'.tr(),
            status: ReferenceStatus.pending,
            phone: '0498 765 432',
            email: 'jamesbranden@gmail.com',
            specialty: 'psychiatry'.tr(),
            seniority: 'senior'.tr(),
            hospital: 'the_royal_melbourne_hospital'.tr(),
            dueDate: DateTime(2023, 10, 20),
          ),
          SizedBox(height: 1.5.h),
          _buildReferenceCard(
            name: 'dr_rebecca_ryan'.tr(),
            status: ReferenceStatus.verified,
            phone: '0437 233 423',
            email: 'rebeccaryan@gmail.com',
            specialty: 'intensive_care_medicine'.tr(),
            seniority: 'registrar'.tr(),
            hospital: 'john_fawkner_private_hospital'.tr(),
            dueDate: DateTime(2023, 10, 20),
          ),
        ],
      ),
    );
  }

  Widget _buildReferenceCard({
    required String name,
    required ReferenceStatus status,
    required String phone,
    required String email,
    required String specialty,
    required String seniority,
    required String hospital,
    required DateTime dueDate,
  }) {
    final reference = ReferenceModel(
      id: '1',
      name: name,
      phoneNumber: phone,
      email: email,
      specialty: specialty,
      seniority: seniority,
      currentHospital: hospital,
      dueDate: dueDate,
      status: status,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return ReferenceCard(
      reference: reference,
      // No onEdit callback to hide the edit button
    );
  }


  Widget _buildNextStepsSection() {
    return Container(
      padding: EdgeInsets.only(left: 4.w, right: 4.w, top: .5.h, bottom: 0.h),
    //   decoration: BoxDecoration(
    //     color: AppColors.white,
    //       borderRadius: BorderRadius.circular(12),
    //  border: Border.all(color: AppColors.borderLight),
    //   ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: AppColors.borderLight,),
          SizedBox(height: 1.5.h),
          Text(
            'next_steps'.tr(),
            style: TextStyles.textViewBold16.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 1.5.h),
          _buildNextStepItem('1.', 'application_successful_notification'.tr()),
          SizedBox(height: 1.h),
          _buildNextStepItem('2.', 'new_hospital_medicare_application'.tr()),
          SizedBox(height: 1.h),
          _buildNextStepItem('3.', 'hospital_contact_finalise_paperwork'.tr()),
        ],
      ),
    );
  }

  Widget _buildNextStepItem(String number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: TextStyles.textViewSemiBold14.copyWith(
            color: AppColors.black,
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: Text(
            text,
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.black,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmButton() {
    return Container(
      padding: EdgeInsets.only(
        left: 4.w,
        right: 4.w,
        top: 2.h,
        bottom: 3.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        height: 6.h,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {
              // Handle application confirmation
              _showApplicationConfirmation();
            },
            child: Center(
              child: Text(
                'confirm_application'.tr(),
                style: TextStyles.textViewBold16.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showApplicationConfirmation() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => _buildSuccessDialog(),
    );
  }

  Widget _buildSuccessDialog() {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 80.w,
        padding: EdgeInsets.all(6.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(6.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success Icon
      
            CustomImageAsset(assetName: AppAssets.successIcon,width: 25.w,height: 25.w,),
            SizedBox(height: 1.h),
            
            // Success Message
            Text(
              'Your application is successfully confirmed',
              textAlign: TextAlign.center,
              style: TextStyles.textViewBold18.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            
            SizedBox(height: 2.h),
            
            // Home Button
            Container(
              width: double.infinity,
              height: 6.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30.w),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.of(context).pop(); // Close dialog
                    Navigator.of(context).pop(); // Go back to shift details
                    Navigator.of(context).pop(); // Go back to home
                  },
                  child: Center(
                    child: Text(
                      'home'.tr(),
                      style: TextStyles.textViewBold16.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
