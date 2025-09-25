import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/utils/styles/font_utils.dart';
import 'status_indicator.dart';

class ShiftCard extends StatelessWidget {
  final ShiftData shiftData;
  final bool isHorizontal;

  const ShiftCard({
    super.key,
    required this.shiftData,
    this.isHorizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: isHorizontal ? _buildHorizontalCard() : _buildVerticalCard(),
    );
  }

  Widget _buildHorizontalCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hospital image with badges
        Expanded(
          flex: 3,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  image: const DecorationImage(
                    image: NetworkImage('https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?w=400'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Distance badge
              Positioned(
                top: 2.h,
                right: 2.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColors.white,
                        size: 3.w,
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        shiftData.distance,
                        style: TextStyles.textViewRegular12.copyWith(
                          color: AppColors.white,
                          fontWeight: AppFont.semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Group badge
              if (shiftData.isGroup)
                Positioned(
                  bottom: 2.h,
                  right: 2.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    decoration: BoxDecoration(
                      color: AppColors.textSecondary.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'group_${shiftData.groupSize}'.tr(),
                      style: TextStyles.textViewRegular12.copyWith(
                        color: AppColors.white,
                        fontWeight: AppFont.semiBold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        
        // Content
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hospital name
                Text(
                  shiftData.hospitalName,
                  style: TextStyles.textViewSemiBold16.copyWith(
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 1.h),
                
                // Date and time
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 3.w,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: 1.w),
                    Text(
                      shiftData.date,
                      style: TextStyles.textViewRegular12.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.5.h),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 3.w,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: 1.w),
                    Text(
                      shiftData.time,
                      style: TextStyles.textViewRegular12.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'rate'.tr(),
                      style: TextStyles.textViewRegular12.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(width: 1.w),
                    Text(
                      shiftData.rate,
                      style: TextStyles.textViewSemiBold14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                
                // Requirements
                if (shiftData.requirements.isNotEmpty)
                  Column(
                    children: shiftData.requirements.map((req) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 0.5.h),
                        child: Row(
                          children: [
                            Container(
                              width: 1.w,
                              height: 1.w,
                              decoration: BoxDecoration(
                                color: AppColors.textSecondary,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Expanded(
                              child: Text(
                                req,
                                style: TextStyles.textViewRegular10.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                SizedBox(height: 1.h),
                
                // Status indicators
                Row(
                  children: [
                    StatusIndicator(
                      icon: Icons.hotel,
                      text: 'accommodation'.tr(),
                      isAvailable: shiftData.hasAccommodation,
                      isSmall: true,
                    ),
                    SizedBox(width: 2.w),
                    StatusIndicator(
                      icon: Icons.flight,
                      text: 'travel'.tr(),
                      isAvailable: shiftData.hasTravel,
                      isSmall: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hospital image with badges
        Expanded(
          flex: 2,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  image: const DecorationImage(
                    image: NetworkImage('https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?w=400'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Role badges
              Positioned(
                top: 1.h,
                left: 2.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        shiftData.role,
                        style: TextStyles.textViewRegular10.copyWith(
                          color: AppColors.white,
                          fontWeight: AppFont.semiBold,
                        ),
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        shiftData.seniority,
                        style: TextStyles.textViewRegular10.copyWith(
                          color: AppColors.white,
                          fontWeight: AppFont.semiBold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Distance and rate badges
              Positioned(
                top: 1.h,
                right: 2.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.white,
                            size: 2.5.w,
                          ),
                          SizedBox(width: 0.5.w),
                          Text(
                            shiftData.distance,
                            style: TextStyles.textViewRegular10.copyWith(
                              color: AppColors.white,
                              fontWeight: AppFont.semiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        shiftData.rate,
                        style: TextStyles.textViewRegular10.copyWith(
                          color: AppColors.white,
                          fontWeight: AppFont.semiBold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        // Content
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(2.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status indicators
                Row(
                  children: [
                    StatusIndicator(
                      icon: Icons.flight,
                      text: 'travel'.tr(),
                      isAvailable: shiftData.hasTravel,
                      isSmall: true,
                    ),
                    SizedBox(width: 2.w),
                    StatusIndicator(
                      icon: Icons.hotel,
                      text: 'accommodation'.tr(),
                      isAvailable: shiftData.hasAccommodation,
                      isSmall: true,
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                
                // Hospital name
                Text(
                  shiftData.hospitalName,
                  style: TextStyles.textViewSemiBold14.copyWith(
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 1.h),
                
                // Date
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 3.w,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: 1.w),
                    Text(
                      shiftData.date,
                      style: TextStyles.textViewRegular12.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.5.h),
                
                // Time
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 3.w,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: 1.w),
                    Text(
                      shiftData.time,
                      style: TextStyles.textViewRegular12.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ShiftData {
  final String hospitalName;
  final String date;
  final String time;
  final String rate;
  final String distance;
  final String role;
  final String seniority;
  final List<String> requirements;
  final bool hasAccommodation;
  final bool hasTravel;
  final bool isGroup;
  final int groupSize;

  ShiftData({
    required this.hospitalName,
    required this.date,
    required this.time,
    required this.rate,
    required this.distance,
    required this.role,
    required this.seniority,
    required this.requirements,
    required this.hasAccommodation,
    required this.hasTravel,
    required this.isGroup,
    required this.groupSize,
  });
}
