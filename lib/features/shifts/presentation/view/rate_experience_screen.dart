import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/core/navigation_services/navigation_manager.dart';

class RateExperienceScreen extends StatefulWidget {
  final String hospitalName;
  final String shiftDate;
  
  const RateExperienceScreen({
    super.key,
    required this.hospitalName,
    required this.shiftDate,
  });

  @override
  State<RateExperienceScreen> createState() => _RateExperienceScreenState();
}

class _RateExperienceScreenState extends State<RateExperienceScreen> {
  int _selectedRating = 4; // Default to 4 stars as shown in the image
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(1.w),
          decoration: BoxDecoration(
            color: AppColors.borderLight.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.textPrimary,
              size: 4.w,
            ),
            onPressed: () => NavigationManager.pop(),
          ),
        ),
        title: Text(
          'Rate Your Experience',
          style: TextStyles.textViewBold18.copyWith(
            color: AppColors.textPrimary,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(6.w),
        child: Column(
          children: [
            SizedBox(height: 4.h),
            
            // Header Icon
            _buildHeaderIcon(),
            
            SizedBox(height: 4.h),
            
            // Title
            Text(
              'Rate Your Experience',
              style: TextStyles.textViewBold20.copyWith(
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 2.h),
            
            // Shift Info
            _buildShiftInfo(),
            
            SizedBox(height: 4.h),
            
            // Star Rating
            _buildStarRating(),
            
            SizedBox(height: 4.h),
            
            // Comment Section
            _buildCommentSection(),
            
            SizedBox(height: 6.h),
            
            // Submit Button
            _buildSubmitButton(),
            
            SizedBox(height: 2.h),
            
            // Not Now Button
            _buildNotNowButton(),
            
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderIcon() {
    return Container(
      width: 20.w,
      height: 20.w,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Iconsax.star,
        color: AppColors.primary,
        size: 10.w,
      ),
    );
  }

  Widget _buildShiftInfo() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.borderLight.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            widget.hospitalName,
            style: TextStyles.textViewBold16.copyWith(
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 1.h),
          Text(
            widget.shiftDate,
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedRating = index + 1;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.w),
            child: Icon(
              index < _selectedRating ? Icons.star : Icons.star_border,
              color: index < _selectedRating ? Colors.amber : AppColors.borderLight,
              size: 8.w,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildCommentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Write a comment (optional)',
          style: TextStyles.textViewMedium16.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 1.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.borderLight,
              width: 1,
            ),
          ),
          child: TextField(
            controller: _commentController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Write a comment (optional)',
              hintStyle: TextStyles.textViewRegular14.copyWith(
                color: AppColors.textLight,
              ),
              border: InputBorder.none,
            ),
            style: TextStyles.textViewRegular16.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      width: double.infinity,
      height: 6.h,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30.w),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30.w),
          onTap: () {
            _submitRating();
          },
          child: Center(
            child: Text(
              'Submit',
              style: TextStyles.textViewBold16.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotNowButton() {
    return TextButton(
      onPressed: () {
        NavigationManager.pop();
      },
      child: Text(
        'Not Now',
        style: TextStyles.textViewRegular14.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
    );
  }

  void _submitRating() {
    // TODO: Implement rating submission logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Thank you for your rating!',
          style: TextStyles.textViewRegular14.copyWith(
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.success,
      ),
    );
    
    // Navigate back
    NavigationManager.pop();
  }
}
