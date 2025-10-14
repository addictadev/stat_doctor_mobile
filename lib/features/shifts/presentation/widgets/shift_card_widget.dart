import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';
import 'status_badge.dart';

class ShiftCardWidget extends StatelessWidget {
  final Map<String, dynamic> shift;
  final VoidCallback onTap;

  const ShiftCardWidget({
    super.key,
    required this.shift,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowLight,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with hospital info and status
            Row(
              children: [
                // Hospital Image
                Container(
                  width: 15.w,
                  height: 15.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(shift['hospitalImage']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shift['hospitalName'],
                        style: TextStyles.textViewBold16.copyWith(
                          color: AppColors.textPrimary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 0.5.h),
                      Row(
                        children: [
                          Icon(
                            Iconsax.location,
                            size: 3.w,
                            color: AppColors.textSecondary,
                          ),
                          SizedBox(width: 1.w),
                          Text(
                            shift['distance'],
                            style: TextStyles.textViewRegular14.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                StatusBadge(status: shift['status']),
              ],
            ),
            
            SizedBox(height: 2.h),
            
            // Shift details
            Row(
              children: [
                Icon(
                  Iconsax.calendar_1,
                  size: 4.w,
                  color: AppColors.textSecondary,
                ),
                SizedBox(width: 2.w),
                Expanded(
                  child: Text(
                    shift['date'],
                    style: TextStyles.textViewRegular14.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                Text(
                  shift['rate'],
                  style: TextStyles.textViewBold16.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 1.h),
            
            Row(
              children: [
                Icon(
                  Iconsax.clock,
                  size: 4.w,
                  color: AppColors.textSecondary,
                ),
                SizedBox(width: 2.w),
                Expanded(
                  child: Text(
                    shift['time'],
                    style: TextStyles.textViewRegular14.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
            
            // Group info if applicable
            if (shift['isGroup'] == true) ...[
              SizedBox(height: 1.h),
              Row(
                children: [
                  Icon(
                    Iconsax.people,
                    size: 4.w,
                    color: AppColors.textSecondary,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    'Group shift (${shift['groupSize']} doctors)',
                    style: TextStyles.textViewRegular14.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
            
            // Travel and accommodation info
            SizedBox(height: 1.h),
            Row(
              children: [
                if (shift['hasTravel'] == true) ...[
                  Icon(
                    Iconsax.car,
                    size: 4.w,
                    color: AppColors.success,
                  ),
                  SizedBox(width: 1.w),
                  Text(
                    'Travel included',
                    style: TextStyles.textViewRegular12.copyWith(
                      color: AppColors.success,
                    ),
                  ),
                  SizedBox(width: 3.w),
                ],
                if (shift['hasAccommodation'] == true) ...[
                  Icon(
                    Iconsax.home,
                    size: 4.w,
                    color: AppColors.success,
                  ),
                  SizedBox(width: 1.w),
                  Text(
                    'Accommodation included',
                    style: TextStyles.textViewRegular12.copyWith(
                      color: AppColors.success,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
