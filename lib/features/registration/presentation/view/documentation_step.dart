import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:stat_doctor/core/images_preview/app_assets.dart';
import 'package:stat_doctor/core/images_preview/custom_svg_img.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/utils/styles/font_utils.dart';
import '../../../../core/widgets/custom_dropdown_field.dart';

class DocumentationStep extends StatefulWidget {
  const DocumentationStep({super.key});

  @override
  State<DocumentationStep> createState() => _DocumentationStepState();
}

class _DocumentationStepState extends State<DocumentationStep> {
  final _formKey = GlobalKey<FormState>();
  
  // Proof of Identity
  String? _selectedPrimaryDocument;
  final List<String> _uploadedDocuments = [];
  final int _totalPoints = 100;
  
  // Other Documentation
  String? _medicalDegreePath = 'Medical Degree.pdf'; // Pre-uploaded as shown in design
  String? _policeCheckPath;
  String? _workVisaPath;
  String? _medicalIndemnityPath;
  String? _workingWithChildrenPath;
  String? _vaccinationCertificatePath;
  String? _medicareCardPath;
  String? _secondaryEmploymentPath;

  final List<String> _primaryDocuments = [
    'Passport',
    'Driver\'s License',
    'Birth Certificate',
    'Citizenship Certificate',
    'Other Government ID',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context)),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Proof of Identity Section
            _buildProofOfIdentitySection(),
            SizedBox(height: 30),
            
            // Other Documentation Section
            _buildOtherDocumentationSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProofOfIdentitySection() {
    return Container(
      padding: EdgeInsets.all(4.w),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'proof_of_identity'.tr(),
                style: TextStyles.textViewRegular16.copyWith(
                  fontWeight: AppFont.semiBold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(width: 8),
            Icon(Icons.info_outline, size: 5.w),
            ],
          ),
          SizedBox(height: 12),
          
          // Description
          RichText(
            text: TextSpan(
              style: TextStyles.textViewRegular14.copyWith(
                color: AppColors.textSecondary,
                height: 1.4,
              ),
              children: [
                TextSpan(text: '${'documents_must_equal_minimum'.tr()} '),
                TextSpan(
                  text: '100_points'.tr(),
                  style: TextStyle(fontWeight: AppFont.bold,color: AppColors.black),
                ),
                TextSpan(text: '. ${'documents_requirements'.tr()}'),
              ],
            ),
          ),
          SizedBox(height: 20),
          
          // Primary Document Dropdown
          CustomDropdownField(
            label: 'select_primary_document'.tr(),
            hint: 'select'.tr(),
            value: _selectedPrimaryDocument,
            items: _primaryDocuments.map((doc) {
              return DropdownMenuItem<String>(
                value: doc,
                child: Text(doc),
              );
            }).toList(),
            onChanged: (value) => setState(() => _selectedPrimaryDocument = value),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please_select_primary_document'.tr();
              }
              return null;
            },
          ),
          SizedBox(height: 12),
          
          // Upload Document Button
          _buildUploadButton(
            width: 45.w,
            label: 'upload_document'.tr(),
            onTap: () => _uploadDocument('primary'),
          ),
          SizedBox(height: 12),
          
          // Upload Other Document Link
          GestureDetector(
            onTap: () => _uploadDocument('other_identity'),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.primary,
                  size: 5.w,
                ),
                SizedBox(width: 4),
                Text(
                  'upload_other_document'.tr(),
                  style: TextStyles.textViewRegular16.copyWith(
                    fontWeight: AppFont.semiBold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          
          // Total Points Box
          Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(3.w),
              border: Border.all(
                color: AppColors.borderLight,
                width: 1,
              ),
            ),
            child: Row(
              children: [
           CustomSvgImage(assetName: AppAssets.goldStar),
                SizedBox(width: 12),
                Text(
                  'total_points'.tr(),
                  style: TextStyles.textViewRegular14.copyWith(
                    fontWeight: AppFont.semiBold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [    Text(
                  '$_totalPoints',
                  style: TextStyles.textViewRegular16.copyWith(
                    fontWeight: AppFont.bold,
                    color: AppColors.textPrimary,
                  ),
                ),     Text(
                  ' /100',
                  style: TextStyles.textViewRegular14.copyWith(
                    fontWeight: AppFont.semiBold,
                    color: AppColors.textPrimary,
                  ),
                ),],)
              ],
            ),
          ),
          SizedBox(height: 12),
          
          // Help Link
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.w),
            decoration: BoxDecoration(
              color: AppColors.yellow.withOpacity(.1),
              borderRadius: BorderRadius.circular(3.w),
              border: Border.all(
                color: AppColors.borderLight,
                width: 1,
              ),
            ),
            child: Row(
              children: [
            CustomSvgImage(assetName: AppAssets.upload),
           
                SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _showHelpDialog(),
                    child: Text(
                      'how_to_upload_documents_correctly'.tr(),
                      style: TextStyles.textViewRegular14.copyWith(
                        fontWeight: AppFont.semiBold,
           
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtherDocumentationSection() {
    return Container(
      padding: EdgeInsets.all(4.w),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'other_documentation'.tr(),
                style: TextStyles.textViewRegular16.copyWith(
                  fontWeight: AppFont.semiBold,
                  color: AppColors.textPrimary,
                ),
              ),
            Icon(Icons.info_outline, size: 5.w),
              
            ],
          ),
          SizedBox(height: 20),
          
          // Medical Degree (already uploaded)
          _buildDocumentItem(
            title: 'medical_degree'.tr(),
            isUploaded: _medicalDegreePath != null,
            fileName: _medicalDegreePath,
            onUpload: () => _uploadDocument('medical_degree'),
            onRemove: () => setState(() => _medicalDegreePath = null),
          ),
          SizedBox(height: 16),
          
          // Police Check
          _buildDocumentItem(
            title: 'police_check'.tr(),
            isUploaded: _policeCheckPath != null,
            fileName: _policeCheckPath,
            onUpload: () => _uploadDocument('police_check'),
            onRemove: () => setState(() => _policeCheckPath = null),
          ),
          SizedBox(height: 16),
          
          // Work Visa
          _buildDocumentItem(
            title: 'work_visa_if_applicable'.tr(),
            isUploaded: _workVisaPath != null,
            fileName: _workVisaPath,
            onUpload: () => _uploadDocument('work_visa'),
            onRemove: () => setState(() => _workVisaPath = null),
          ),
          SizedBox(height: 16),
          
          // Medical Indemnity Insurance
          _buildDocumentItem(
            title: 'medical_indemnity_insurance'.tr(),
            isUploaded: _medicalIndemnityPath != null,
            fileName: _medicalIndemnityPath,
            onUpload: () => _uploadDocument('medical_indemnity'),
            onRemove: () => setState(() => _medicalIndemnityPath = null),
          ),
          SizedBox(height: 16),
          
          // Working with Children Check
          _buildDocumentItem(
            title: 'working_with_children_check'.tr(),
            isUploaded: _workingWithChildrenPath != null,
            fileName: _workingWithChildrenPath,
            onUpload: () => _uploadDocument('working_with_children'),
            onRemove: () => setState(() => _workingWithChildrenPath = null),
          ),
          SizedBox(height: 16),
          
          // Vaccination Certificate
          _buildDocumentItem(
            title: 'vaccination_certificate'.tr(),
            isUploaded: _vaccinationCertificatePath != null,
            fileName: _vaccinationCertificatePath,
            onUpload: () => _uploadDocument('vaccination_certificate'),
            onRemove: () => setState(() => _vaccinationCertificatePath = null),
          ),
          SizedBox(height: 16),
          
          // Medicare Card
          _buildDocumentItem(
            title: 'medicare_card'.tr(),
            isUploaded: _medicareCardPath != null,
            fileName: _medicareCardPath,
            onUpload: () => _uploadDocument('medicare_card'),
            onRemove: () => setState(() => _medicareCardPath = null),
          ),
          SizedBox(height: 16),
          
          // Approval for Secondary Employment
          _buildDocumentItem(
            title: 'approval_secondary_employment'.tr(),
            isUploaded: _secondaryEmploymentPath != null,
            fileName: _secondaryEmploymentPath,
            onUpload: () => _uploadDocument('secondary_employment'),
            onRemove: () => setState(() => _secondaryEmploymentPath = null),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentItem({
    required String title,
    required bool isUploaded,
    String? fileName,
    required VoidCallback onUpload,
    required VoidCallback onRemove,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.textViewRegular14.copyWith(
            fontWeight: AppFont.medium,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8),
        if (isUploaded && fileName != null)
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.borderLight,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.picture_as_pdf,
                  color: AppColors.error,
                  size: 20,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    fileName,
                    style: TextStyles.textViewRegular14.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onRemove,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.error.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      color: AppColors.error,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          )
        else
          _buildUploadButton(
            label: 'upload_document'.tr(),
            onTap: onUpload,
          ),
      ],
    );
  }

  Widget _buildUploadButton({
    required String label,
    required VoidCallback onTap,
     double? width,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(9.w),
          border: Border.all(
            color: AppColors.borderLight,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.document_upload,
              color: AppColors.black,
              size: 5.w,
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyles.textViewRegular14.copyWith(
                fontWeight: AppFont.semiBold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _uploadDocument(String documentType) {
    // Simulate file upload
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('upload_document'.tr()),
        content: Text('select_file_to_upload'.tr()),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Simulate successful upload
              setState(() {
                switch (documentType) {
                  case 'primary':
                    _uploadedDocuments.add('Primary Document.pdf');
                    break;
                  case 'other_identity':
                    _uploadedDocuments.add('Other Identity Document.pdf');
                    break;
                  case 'medical_degree':
                    _medicalDegreePath = 'Medical Degree.pdf';
                    break;
                  case 'police_check':
                    _policeCheckPath = 'Police Check.pdf';
                    break;
                  case 'work_visa':
                    _workVisaPath = 'Work Visa.pdf';
                    break;
                  case 'medical_indemnity':
                    _medicalIndemnityPath = 'Medical Indemnity.pdf';
                    break;
                  case 'working_with_children':
                    _workingWithChildrenPath = 'Working with Children Check.pdf';
                    break;
                  case 'vaccination_certificate':
                    _vaccinationCertificatePath = 'Vaccination Certificate.pdf';
                    break;
                  case 'medicare_card':
                    _medicareCardPath = 'Medicare Card.pdf';
                    break;
                  case 'secondary_employment':
                    _secondaryEmploymentPath = 'Secondary Employment Approval.pdf';
                    break;
                }
              });
            },
            child: Text('upload'.tr()),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('cancel'.tr()),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('how_to_upload_documents'.tr()),
        content: Text(
          'upload_documents_instructions'.tr(),
        ),
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
