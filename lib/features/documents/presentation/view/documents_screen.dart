import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/core/utils/responsive_utils.dart';
import 'package:stat_doctor/core/navigation_services/navigation_manager.dart';
import 'package:stat_doctor/features/documents/data/models/document_model.dart';
import 'package:stat_doctor/features/documents/presentation/widgets/document_upload_button.dart';
import 'package:stat_doctor/features/documents/presentation/widgets/section_header.dart';
import 'edit_documents_screen.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({super.key});

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  // Sample data - in real app, this would come from a service/repository
  final List<DocumentModel> _documents = [
    DocumentModel(
      id: '1',
      type: DocumentType.proofOfIdentity,
      name: 'Proof of identity',
      fileName: 'Not supplied',
      status: DocumentStatus.notSupplied,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(1.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.textSecondary,
              size: 4.w,
            ),
            onPressed: () => NavigationManager.pop(),
          ),
        ),
        title: Text(
          'Documents',
          style: TextStyles.textViewBold18.copyWith(
            color: AppColors.textPrimary,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.all(2.w),
            child: GestureDetector(
              onTap: () => _navigateToEditDocuments(),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: 1.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.w),
                  border: Border.all(
                    color: AppColors.grayColor.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Iconsax.edit,
                      color: AppColors.textPrimary,
                      size: 3.w,
                    ),
                    SizedBox(width: 1.w),
                    Text(
                      'Edit',
                      style: TextStyles.textViewMedium14.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Proof of identity section
            _buildProofOfIdentitySection(),
            
            SizedBox(height: 3.h),
            
            // Centrelink card section
            _buildCentrelinkCardSection(),
            
            SizedBox(height: 3.h),
            
            // Other documentation section
            _buildOtherDocumentationSection(),
            
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }

  Widget _buildProofOfIdentitySection() {
    final proofOfIdentityDocs = _documents.where(
      (doc) => doc.type == DocumentType.proofOfIdentity,
    ).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Proof of identity',
          showInfoIcon: true,
          onInfoTap: () => _showInfoDialog('Proof of identity', 'Information about proof of identity requirements.'),
        ),
        
        // Primary document
        _buildDocumentItem(
          label: 'Select primary document',
          documents: proofOfIdentityDocs,
        ),
      ],
    );
  }

  Widget _buildCentrelinkCardSection() {
    final centrelinkDocs = _documents.where(
      (doc) => doc.type == DocumentType.centrelinkCard,
    ).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Centrelink card',
        ),
        
        _buildDocumentItem(
          label: 'Centrelink card',
          documents: centrelinkDocs,
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
        SectionHeader(
          title: 'Other documentation',
          showInfoIcon: true,
          onInfoTap: () => _showInfoDialog('Other documentation', 'Information about other documentation requirements.'),
        ),
        
        ...otherDocs.map((doc) => _buildDocumentItem(
          label: doc.type.displayName,
          documents: [doc],
        )),
      ],
    );
  }

  Widget _buildDocumentItem({
    required String label,
    required List<DocumentModel> documents,
  }) {
    final document = documents.first;
    final hasDocument = document.status == DocumentStatus.uploaded;

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
        
        // Document card or upload button (read-only)
        if (hasDocument)
          _buildReadOnlyDocumentCard(document)
        else
          DocumentUploadButton(
            text: 'Upload Document',
            onTap: () => _uploadDocument(document),
          ),
      ],
    );
  }


  Widget _buildReadOnlyDocumentCard(DocumentModel document) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.5.h),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
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
      child: Row(
        children: [
          // PDF Icon
          Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(
              color: const Color(0xFFE53935).withOpacity(0.1),
              borderRadius: BorderRadius.circular(2.w),
            ),
            child: Icon(
              Icons.picture_as_pdf,
              color: const Color(0xFFE53935),
              size: 4.w,
            ),
          ),
          
          SizedBox(width: 3.w),
          
          // Document Name
          Expanded(
            child: Text(
              document.fileName,
              style: TextStyles.textViewRegular16.copyWith(
                color: AppColors.textPrimary,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }


  void _navigateToEditDocuments() {
    NavigationManager.navigateTo(const EditDocumentsScreen());
  }

  void _uploadDocument(DocumentModel document) {
    // Navigate to edit documents screen for uploading
    NavigationManager.navigateTo(const EditDocumentsScreen());
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
}
