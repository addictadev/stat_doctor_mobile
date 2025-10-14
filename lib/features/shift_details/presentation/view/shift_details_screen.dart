import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/core/navigation_services/navigation_manager.dart';
import 'package:stat_doctor/core/images_preview/app_assets.dart';
import '../widgets/status_badge.dart';
import '../widgets/confirmation_dialog.dart';
import '../../../shifts/presentation/view/apply_screen.dart';
import '../../../shifts/presentation/view/rate_experience_screen.dart';
import '../../data/models/shift_details_data.dart';

class ShiftDetailsScreen extends StatefulWidget {
  final ShiftDetailsData shiftData;

  const ShiftDetailsScreen({
    super.key,
    required this.shiftData,
  });

  @override
  State<ShiftDetailsScreen> createState() => _ShiftDetailsScreenState();
}

class _ShiftDetailsScreenState extends State<ShiftDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hospital Information Card
            _buildHospitalInfoCard(),
            
            SizedBox(height: 2.h),
            
            // Shift Details Card
            _buildShiftDetailsCard(),
            
            SizedBox(height: 2.h),
            
            // Job Requirements Card
            _buildJobRequirementsCard(),
            
            SizedBox(height: 2.h),
            
            // Contact Details Card
            _buildContactDetailsCard(),
            
            SizedBox(height: 2.h),
            
            // Reviews Section (for archived shifts)
            if (widget.shiftData.status == 'Archived' && widget.shiftData.reviews.isNotEmpty)
              _buildReviewsSection(),
            
            SizedBox(height: 4.h),
            
            // Action Buttons
            _buildActionButtons(),
            
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
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
        'Shift Details',
        style: TextStyles.textViewBold18.copyWith(
          color: AppColors.textPrimary,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildHospitalInfoCard() {
    return Container(
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
          Row(
            children: [
              // Hospital Image
              Container(
                width: 12.w,
                height: 12.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(AppAssets.homeBackground),
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
                      widget.shiftData.hospitalName,
                      style: TextStyles.textViewBold16.copyWith(
                        color: AppColors.textPrimary,
                      ),
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
                        Expanded(
                          child: Text(
                            widget.shiftData.address,
                            style: TextStyles.textViewRegular14.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      '${widget.shiftData.distance} from current location',
                      style: TextStyles.textViewRegular14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              // Status Badge
              StatusBadge(status: widget.shiftData.status),
            ],
          ),
          if (widget.shiftData.description.isNotEmpty) ...[
            SizedBox(height: 2.h),
            Text(
              widget.shiftData.description,
              style: TextStyles.textViewRegular14.copyWith(
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildShiftDetailsCard() {
    return Container(
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
          Text(
            'Rate :',
            style: TextStyles.textViewRegular16.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 0.5.h),
          Text(
            widget.shiftData.rate,
            style: TextStyles.textViewBold20.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Icon(
                Iconsax.calendar_1,
                size: 4.w,
                color: AppColors.textSecondary,
              ),
              SizedBox(width: 2.w),
              Text(
                widget.shiftData.date,
                style: TextStyles.textViewRegular14.copyWith(
                  color: AppColors.textPrimary,
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
              Text(
                widget.shiftData.time,
                style: TextStyles.textViewRegular14.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildJobRequirementsCard() {
    return Container(
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
          _buildRequirementRow('Skill level', widget.shiftData.skillLevel),
          SizedBox(height: 1.h),
          _buildRequirementRow('Specialty', widget.shiftData.specialty),
          SizedBox(height: 1.h),
          _buildRequirementRow('Support level', widget.shiftData.supportLevel),
          SizedBox(height: 1.h),
          _buildRequirementRow('Travel provisions', widget.shiftData.travelProvisions),
          SizedBox(height: 1.h),
          _buildRequirementRow('Accommodation provisions', widget.shiftData.accommodationProvisions),
        ],
      ),
    );
  }

  Widget _buildRequirementRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 40.w,
          child: Text(
            label,
            style: TextStyles.textViewSemiBold14.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactDetailsCard() {
    return Container(
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
          Text(
            'Contact details',
            style: TextStyles.textViewBold16.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 2.h),
          _buildContactRow('Name', widget.shiftData.contactName),
          SizedBox(height: 1.h),
          _buildContactRow('Phone', widget.shiftData.contactPhone),
          SizedBox(height: 1.h),
          _buildContactRow('Email', widget.shiftData.contactEmail),
        ],
      ),
    );
  }

  Widget _buildContactRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 20.w,
          child: Text(
            label,
            style: TextStyles.textViewSemiBold14.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewsSection() {
    return Container(
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
          Text(
            'Reviews and Ratings',
            style: TextStyles.textViewBold16.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 2.h),
          ...widget.shiftData.reviews.map((review) => _buildReviewCard(review)),
        ],
      ),
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> review) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: AppColors.borderLight.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 4.w,
                backgroundColor: AppColors.primary.withOpacity(0.1),
                child: Icon(
                  Iconsax.user,
                  color: AppColors.primary,
                  size: 4.w,
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review['name'] ?? 'Dr. Sarah Cooper',
                      style: TextStyles.textViewSemiBold14.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      review['date'] ?? '25 Oct 2025',
                      style: TextStyles.textViewRegular12.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 3.w,
                  ),
                  SizedBox(width: 1.w),
                  Text(
                    review['rating'] ?? '4.5',
                    style: TextStyles.textViewSemiBold14.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Text(
            review['comment'] ?? 'The treatment of the hospital is very good, the environment is clean and hygienic, and I am very honored to participate in this shift.',
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    switch (widget.shiftData.status) {
      case 'Applied':
        return _buildAppliedButtons();
      case 'Accepted':
        return _buildAcceptedButtons();
      case 'Cancelled':
        return _buildCancelledButtons();
      case 'Archived':
        return _buildArchivedButtons();
      default:
        return _buildAppliedButtons();
    }
  }

  Widget _buildAppliedButtons() {
    return Column(
      children: [
        Container(
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
              onTap: () => _showWithdrawConfirmation(),
              child: Center(
                child: Text(
                  'Withdraw Application',
                  style: TextStyles.textViewBold16.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAcceptedButtons() {
    return Column(
      children: [
        Container(
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
              onTap: () => _showWithdrawConfirmation(),
              child: Center(
                child: Text(
                  'Withdraw Application',
                  style: TextStyles.textViewBold16.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        TextButton(
          onPressed: () => _showCancelConfirmation(),
          child: Text(
            'Cancel Shift',
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCancelledButtons() {
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
          onTap: () => _navigateToApply(),
          child: Center(
            child: Text(
              'Apply',
              style: TextStyles.textViewBold16.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildArchivedButtons() {
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
          onTap: () => _navigateToRateExperience(),
          child: Center(
            child: Text(
              'Review',
              style: TextStyles.textViewBold16.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showWithdrawConfirmation() {
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        title: 'Withdraw application?',
        message: 'You are withdrawing your application for this shift. You can apply again.',
        confirmText: 'Withdraw',
        cancelText: 'Cancel',
        onConfirm: () {
          Navigator.pop(context);
          _handleWithdrawApplication();
        },
        onCancel: () => Navigator.pop(context),
      ),
    );
  }

  void _showCancelConfirmation() {
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        title: 'Cancel shift?',
        message: 'You are cancelling this accepted shift. This cannot be undone.',
        confirmText: 'Cancel Shift',
        cancelText: 'Back',
        onConfirm: () {
          Navigator.pop(context);
          _handleCancelShift();
        },
        onCancel: () => Navigator.pop(context),
      ),
    );
  }

  void _handleWithdrawApplication() {
    // TODO: Implement withdraw application logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Application withdrawn successfully',
          style: TextStyles.textViewRegular14.copyWith(
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.success,
      ),
    );
    NavigationManager.pop();
  }

  void _handleCancelShift() {
    // TODO: Implement cancel shift logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Shift cancelled successfully',
          style: TextStyles.textViewRegular14.copyWith(
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.success,
      ),
    );
    NavigationManager.pop();
  }

  void _navigateToApply() {
    NavigationManager.navigateTo(
      ApplyScreen(
        numberOfShifts: 1,
        hospitalName: widget.shiftData.hospitalName,
      ),
    );
  }

  void _navigateToRateExperience() {
    NavigationManager.navigateTo(
      RateExperienceScreen(
        hospitalName: widget.shiftData.hospitalName,
        shiftDate: widget.shiftData.date,
      ),
    );
  }
}
