import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';
import '../widgets/review_card.dart';

class ViewAllReviewsScreen extends StatefulWidget {
  final List<Map<String, dynamic>> reviews;
  final String hospitalName;
  final double averageRating;
  final int totalReviews;

  const ViewAllReviewsScreen({
    super.key,
    required this.reviews,
    required this.hospitalName,
    required this.averageRating,
    required this.totalReviews,
  });

  @override
  State<ViewAllReviewsScreen> createState() => _ViewAllReviewsScreenState();
}

class _ViewAllReviewsScreenState extends State<ViewAllReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(
              Iconsax.arrow_left_2,
              color: AppColors.textPrimary,
              size: 5.w,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text(
          'Reviews',
          style: TextStyles.textViewBold18.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Overall Rating Summary
         Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Rating Number
                    Text(
                      '${widget.averageRating}/5.0',
                      style: TextStyles.textViewBold24.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                 
                    // Stars
                Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: List.generate(5, (index) {
                              if (index < widget.averageRating.floor()) {
                                return Icon(
                                  Icons.star,
                                  color: AppColors.warning,
                                  size: 4.5.w,
                                );
                              } else if (index == widget.averageRating.floor() && 
                                         widget.averageRating % 1 != 0) {
                                return Icon(
                                  Icons.star_half,
                                  color: AppColors.warning,
                                  size: 4.5.w,
                                );
                              } else {
                                return Icon(
                                  Icons.star_border,
                                  color: Colors.grey.withOpacity(0.3),
                                  size: 4.w,
                                );
                              }
                            }),
                          ),
                          SizedBox(height: 0.5.h),
                          Text(
                            '${widget.totalReviews}+ Reviews',
                            style: TextStyles.textViewSemiBold16.copyWith(
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    
                  ],
                ),
              
              SizedBox(height: 3.h),
              // Reviews List
         Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
              
                    ...widget.reviews.asMap().entries.map((entry) {
                      int index = entry.key;
                      Map<String, dynamic> review = entry.value;
                      return ReviewCard(
                        review: review,
                        isLast: index == widget.reviews.length - 1,
                      );
                    }),
                  ],
                ),
              
            ],
          ),
        ),
      ),
    );
  }

}
