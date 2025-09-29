import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/utils/styles/styles.dart';
import 'shift_status_badge.dart';

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
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(25),
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
            _buildImageSection(),
            _buildContentSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      height: 18.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        image: DecorationImage(
          image: NetworkImage(shift['hospitalImage']),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Distance badge
          Positioned(
            bottom: 1.5.h,
            left: 2.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.greenOverlay,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                        Icons.location_on,
                    color: Colors.green,
                    size: 3.w,
                  ),
                  SizedBox(width: 1.w),
                  Text(
                    shift['distance'],
                    style: TextStyles.textViewSemiBold14.copyWith(
                      color: Colors.green,  
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Status badge
          Positioned(
            bottom: 1.5.h,
            right: 2.w,
            child: ShiftStatusBadge(
              status: shift['status'],
              groupSize: shift['isGroup'] ? shift['groupSize'].toString() : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection() {
    return Padding(
      padding: EdgeInsets.all(4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hospital name
          Text(
            shift['hospitalName'],
            style: TextStyles.textViewSemiBold16.copyWith(
              color: AppColors.textPrimary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 2.h),
          
          // Shift details container
          Container(
            padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
                color: AppColors.greenOverlay,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                // Date and time section
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Iconsax.calendar_1,
                            color: AppColors.textSecondary,
                            size: 3.5.w,
                          ),
                          SizedBox(width: 1.5.w),
                          Expanded(
                            child: Text(
                              shift['date'],
                              style: TextStyles.textViewBold14.copyWith(
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          Icon(
                            Iconsax.clock,
                            color: AppColors.textSecondary,
                            size: 3.5.w,
                          ),
                          SizedBox(width: 1.5.w),
                          Expanded(
                            child: Text(
                              shift['time'],
                              style: TextStyles.textViewBold14.copyWith(
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                // Divider
                Container(
                  height: 4.h,
                  width: 0.3.w,
                  margin: EdgeInsets.only(left: 2.w, right: 2.w),
                  color: AppColors.textSecondary.withOpacity(0.3),
                ),
                
                // Rate section
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rate:',
                        style: TextStyles.textViewRegular14.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      SizedBox(height: 0.5.h),
                      Text(
                        shift['rate'],
                        style: TextStyles.textViewBold16.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
