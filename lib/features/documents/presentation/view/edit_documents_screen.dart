import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/images_preview/app_assets.dart';
import 'package:stat_doctor/core/images_preview/custom_svg_img.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/font_utils.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/core/utils/responsive_utils.dart';
import 'package:stat_doctor/core/navigation_services/navigation_manager.dart';
import 'package:stat_doctor/features/documents/data/models/document_model.dart';
import 'package:stat_doctor/features/documents/presentation/widgets/document_card.dart';


class EditDocumentsScreen extends StatefulWidget {
  const EditDocumentsScreen({super.key});

  @override
  State<EditDocumentsScreen> createState() => _EditDocumentsScreenState();
}

class _EditDocumentsScreenState extends State<EditDocumentsScreen> {
  // Sample data - in real app, this would come from a service/repository
  final List<DocumentModel> _documents = [
    DocumentModel(
      id: '1',
      type: DocumentType.proofOfIdentity,
      name: 'Proof of identity',
      fileName: 'DocumentName',
      status: DocumentStatus.uploaded,
      points: 70,
    ),
    DocumentModel(
      id: '2',
      type: DocumentType.centrelinkCard,
      name: 'Centrelink card',
      fileName: 'DocumentName',
      status: DocumentStatus.uploaded,
      points: 40,
    ),
    DocumentModel(
      id: '3',
      type: DocumentType.medicalDegree,
      name: 'Medical degree',
      fileName: 'Medical Degree',
      status: DocumentStatus.uploaded,
    ),
    DocumentModel(
      id: '4',
      type: DocumentType.policeCheck,
      name: 'Police check',
      fileName: 'Medical Degree',
      status: DocumentStatus.uploaded,
    ),
    DocumentModel(
      id: '5',
      type: DocumentType.workVisa,
      name: 'Work visa (if applicable)',
      fileName: 'Not uploaded',
      status: DocumentStatus.notSupplied,
    ),
    DocumentModel(
      id: '6',
      type: DocumentType.medicalIndemnityInsurance,
      name: 'Medical indemnity insurance',
      fileName: 'Medical Degree',
      status: DocumentStatus.uploaded,
    ),
    DocumentModel(
      id: '7',
      type: DocumentType.workingWithChildrenCheck,
      name: 'Working with children check',
      fileName: 'Medical Degree',
      status: DocumentStatus.uploaded,
    ),
    DocumentModel(
      id: '8',
      type: DocumentType.vaccinationCertificate,
      name: 'Vaccination certificate',
      fileName: 'Medical Degree',
      status: DocumentStatus.uploaded,
    ),
    DocumentModel(
      id: '9',
      type: DocumentType.medicareCard,
      name: 'Medicare card',
      fileName: 'Medical Degree',
      status: DocumentStatus.uploaded,
    ),
    DocumentModel(
      id: '10',
      type: DocumentType.approvalForSecondaryEmployment,
      name: 'Approval for secondary employment',
      fileName: 'Not uploaded',
      status: DocumentStatus.notSupplied,
    ),
  ];

  String _selectedPrimaryDocument = 'Australian Passport (70 points)';
  String _selectedOtherDocument = 'Centrelink card (40 points)';

  final List<String> _primaryDocumentOptions = [
    'Australian Passport (70 points)',
    'Australian Birth Certificate (70 points)',
    'Australian Citizenship Certificate (70 points)',
  ];

  final List<String> _otherDocumentOptions = [
    'Centrelink card (40 points)',
    'Australian Driver License (40 points)',
    'Medicare card (25 points)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.textPrimary,
            size: context.responsiveIconSize * 0.8,
          ),
          onPressed: () => NavigationManager.pop(),
        ),
        title: Text(
          'Edit Documents',
          style: TextStyles.textViewBold18.copyWith(
            color: AppColors.textPrimary,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Proof of identity section
                  _buildProofOfIdentitySection(),
                  
                  SizedBox(height: 3.h),
                  
                  // Other documentation section
                  _buildOtherDocumentationSection(),
                  
                  SizedBox(height: 4.h),
                ],
              ),
            ),
          ),
          
          // Save changes button
          Container(
            padding: EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context)),
            child: _buildSaveButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildProofOfIdentitySection() {
    final proofOfIdentityDocs = _documents.where(
      (doc) => doc.type == DocumentType.proofOfIdentity,
    ).toList();

    final centrelinkDocs = _documents.where(
      (doc) => doc.type == DocumentType.centrelinkCard,
    ).toList();

    final totalPoints = _getTotalPoints();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SectionHeader(
        //   title: 'Proof of identity',
        //   showInfoIcon: true,
        //   onInfoTap: () => _showInfoDialog(
        //     'Proof of identity',
        //     'Documents must equal to minimum 100 points. You must provide AT LEAST 1 primary document. Documents must be certified copies.',
        //   ),
        //   subtitle: 'Documents must equal to minimum 100 points. You must provide AT LEAST 1 primary document. Documents must be certified copies.',
        // ),
        
        // Primary document dropdown
        _buildDropdownField(
          label: 'Select primary document',
          value: _selectedPrimaryDocument,
          options: _primaryDocumentOptions,
          onChanged: (value) => setState(() => _selectedPrimaryDocument = value),
        ),
        
        SizedBox(height: 1.h),
        
        // Uploaded primary document
        if (proofOfIdentityDocs.isNotEmpty && proofOfIdentityDocs.first.status == DocumentStatus.uploaded)
          DocumentCard(
            document: proofOfIdentityDocs.first,
          ),
        
        SizedBox(height: 2.h),
        
        // Other document dropdown
        _buildDropdownField(
          label: 'Select other document',
          value: _selectedOtherDocument,
          options: _otherDocumentOptions,
          onChanged: (value) => setState(() => _selectedOtherDocument = value),
        ),
        
        SizedBox(height: 1.h),
        
        // Uploaded other document
        if (centrelinkDocs.isNotEmpty && centrelinkDocs.first.status == DocumentStatus.uploaded)
          DocumentCard(
            document: centrelinkDocs.first,
          ),
        
        SizedBox(height: 2.h),
        
        // Upload other document button
        GestureDetector(
          onTap: () => _uploadDocument(),
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: AppColors.primary,
                size: 4.w,
              ),
              SizedBox(width: 1.w),
              Text(
                'Upload other document',
                style: TextStyles.textViewMedium16.copyWith(
                  color: AppColors.primary,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
        
        SizedBox(height: 2.h),
        
        // Total points display
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
                  '100',
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
         
        
        SizedBox(height: 1.h),
        
        // Help link
        GestureDetector(
          onTap: () => _showHelpDialog(),
          child: Container(
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
        ),
      ],
    );
  }

  Widget _buildOtherDocumentationSection() {
    final otherDocs = _documents.where(
      (doc) => doc.type != DocumentType.proofOfIdentity && 
               doc.type != DocumentType.centrelinkCard,
    ).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SectionHeader(
        //   title: 'Other documentation',
        //   showInfoIcon: true,
        //   onInfoTap: () => _showInfoDialog(
        //     'Other documentation',
        //     'Information about other documentation requirements.',
        //   ),
        // ),
        
        ...otherDocs.map((doc) => _buildDocumentItem(doc)),
      ],
    );
  }

  Widget _buildDocumentItem(DocumentModel document) {
    final hasDocument = document.status == DocumentStatus.uploaded;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          document.type.displayName,
          style: TextStyles.textViewRegular16.copyWith(
            color: AppColors.textPrimary,
            fontSize: 14.sp,
          ),
        ),
        
        SizedBox(height: 1.h),
        
        if (hasDocument)
          DocumentCard(
            document: document,
          )
        else
        SizedBox()

          // DocumentUploadButton(
          //   text: 'Upload Document',
          //   onTap: () => _uploadDocument(),
          // ),
        
        // SizedBox(height: 2.h),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> options,
    required ValueChanged<String> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.textViewRegular16.copyWith(
            color: AppColors.textPrimary,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 1.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.w),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowLight.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: InkWell(
            onTap: () => _showDropdown(context, label, options, onChanged),
            borderRadius: BorderRadius.circular(12.w),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 2.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      value,
                      style: TextStyles.textViewRegular16.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.textSecondary,
                    size: 5.w,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return Container(
      width: double.infinity,
      height: 6.h,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _saveChanges,
          borderRadius: BorderRadius.circular(12.w),
          child: Center(
            child: Text(
              'Save changes',
              style: TextStyles.textViewBold16.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDropdown(
    BuildContext context,
    String title,
    List<String> options,
    ValueChanged<String> onChanged,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(4.w),
        ),
      ),
      builder: (context) => Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        padding: EdgeInsets.all(4.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24.w,
              height: 0.5.h,
              decoration: BoxDecoration(
                color: AppColors.borderLight,
                borderRadius: BorderRadius.circular(1.w),
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              title,
              style: TextStyles.textViewBold18.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 3.h),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: options.length,
                separatorBuilder: (context, index) => SizedBox(height: 1.h),
                itemBuilder: (context, index) {
                  final option = options[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      onChanged(option);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        option,
                        style: TextStyles.textViewRegular16.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }

  void _uploadDocument() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Document upload functionality coming soon'),
        backgroundColor: AppColors.info,
      ),
    );
  }


  void _saveChanges() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Changes saved successfully'),
        backgroundColor: AppColors.success,
      ),
    );
    
    NavigationManager.pop();
  }

  int _getTotalPoints() {
    return _documents
        .where((doc) => doc.status == DocumentStatus.uploaded)
        .fold(0, (sum, doc) => sum + doc.points);
  }

  void _showInfoDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('How to upload documents'),
        content: Text('Guidelines for uploading documents correctly will be shown here.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
