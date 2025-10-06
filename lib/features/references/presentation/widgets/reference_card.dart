import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/features/references/data/models/reference_model.dart';
import 'status_pill.dart';

class ReferenceCard extends StatelessWidget {
  final ReferenceModel reference;
  final VoidCallback? onEdit;

  const ReferenceCard({
    super.key,
    required this.reference,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: onEdit == null?0:4.w, vertical: 0.5.h),
      padding:          onEdit == null ? EdgeInsets.all(0.w) : EdgeInsets.all(4.w),

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
   
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status pill at top right
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              StatusPill(status: reference.status),
            ],
          ),
          
          SizedBox(height: 1.5.h),
          
          // Reference details
          _buildDetailRow('Name', reference.name),
          SizedBox(height: 1.2.h),
          _buildDetailRow('Phone number', reference.phoneNumber),
          SizedBox(height: 1.2.h),
          _buildDetailRow('Reference\'s email', reference.email),
          SizedBox(height: 1.2.h),
          _buildDetailRow('Specialty', reference.specialty),
          SizedBox(height: 1.2.h),
          _buildDetailRow('Seniority', reference.seniority),
          SizedBox(height: 1.2.h),
          _buildDetailRow('Current hospital', reference.currentHospital),
          SizedBox(height: 1.2.h),
          _buildDetailRow('Due date', _formatDate(reference.dueDate)),
          
          SizedBox(height: 2.5.h),
          
          // Edit button
          if (onEdit != null)
            Center(
              child: GestureDetector(
                onTap: onEdit,
                child: Container(
                  width: 100.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                    vertical: 1.2.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12.w),
                    border: Border.all(
                      color: AppColors.grayColor.withOpacity(.5),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.edit,
                        color: AppColors.primary,
                        size: 4.w,
                      ),
                      SizedBox(width: 1.5.w),
                      Text(
                        'Edit Reference',
                        style: TextStyles.textViewMedium14.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.textViewRegular14.copyWith(
            color: AppColors.textSecondary,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 0.3.h),
        Text(
          value,
          style: TextStyles.textViewBold16.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}
