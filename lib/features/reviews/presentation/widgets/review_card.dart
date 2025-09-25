import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';

class ReviewCard extends StatelessWidget {
  final Map<String, dynamic> review;
  final bool isLast;

  const ReviewCard({
    super.key,
    required this.review,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 0 : 2.h),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 5.w,
                backgroundColor: AppColors.primary.withOpacity(0.1),
                child: Text(
                  review['name']?.substring(0, 1) ?? 'D',
                  style: TextStyles.textViewBold16.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          review['name'] ?? 'Dr. Sarah Cooper',
                          style: TextStyles.textViewSemiBold16.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                          decoration: BoxDecoration(
                            color: AppColors.warning.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.warning,
                                size: 4.w,
                              ),
                              SizedBox(width: 1.w),
                              Text(
                                review['rating'] ?? '4.0',
                                style: TextStyles.textViewRegular14.copyWith(
                                  color: AppColors.warning,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.2.h),
                    Text(
                      review['date'] ?? '25 Oct 2025',
                      style: TextStyles.textViewRegular12.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 0.5.h),
          Text(
            review['comment'] ?? 'The treatment of the hospital is very good, the environment is clean and hygienic, and I am very honored to participate in this shift.',
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textPrimary,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
