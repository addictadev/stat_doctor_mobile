import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/features/documents/data/models/document_model.dart';

class DocumentCard extends StatelessWidget {
  final DocumentModel document;
  final VoidCallback? onEdit;
  final VoidCallback? onRemove;

  const DocumentCard({
    super.key,
    required this.document,
    this.onEdit,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
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
          
          // Remove Button (if uploaded)
          if (document.status == DocumentStatus.uploaded && onRemove != null)
            GestureDetector(
              onTap: onRemove,
              child: Container(
                width: 6.w,
                height: 6.w,
                decoration: BoxDecoration(
                  color: AppColors.textSecondary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  color: AppColors.textSecondary,
                  size: 3.w,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
