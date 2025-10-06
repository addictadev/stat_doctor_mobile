import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/navigation_services/navigation_manager.dart';
import '../../../hospital_details/presentation/view/hospital_details_screen.dart';
import '../../../shifts/presentation/view/apply_screen.dart';
import '../../../shifts/presentation/widgets/rate_experience_bottom_sheet.dart';

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
  final List<int> _selectedSimilarShifts = [1, 2]; // Pre-select the middle two options to match design

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHospitalInfoCard(),
                  SizedBox(height: 2.h),
                  _buildShiftTimingCard(),
                  SizedBox(height: 2.h),
                  _buildDescriptionCard(),
                  SizedBox(height: 2.h),
                  _buildJobRequirementsCard(),
                  SizedBox(height: 2.h),
                  _buildContactDetailsCard(),
                  SizedBox(height: 2.h),
                  _buildSimilarShiftsCard(),
                  SizedBox(height: 4.h),
                ],
              ),
            ),
          ),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      // margin: EdgeInsets.only(top: 30.h),
      padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 8.h, bottom: 2.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(1.5.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Icon(
                Iconsax.arrow_left_2,
                color: AppColors.textPrimary,
                size: 5.w,
              ),
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: Text(
              'Shift Details',
              style: TextStyles.textViewBold18.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHospitalInfoCard() {
    return GestureDetector(
      onTap: () {
        _navigateToHospitalDetails();
      },
      child: Container(
        width: 100.w,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hospital thumbnail image
                Container(
                  width: 17.w,
                  height: 15.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[100],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/hom.png', // Hospital building image
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Iconsax.hospital,
                            color: AppColors.primary,
                            size: 8.w,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hospital name with status
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.shiftData.hospitalName,
                              style: TextStyles.textViewBold16.copyWith(
                                color: AppColors.textPrimary,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          _buildStatusPill(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            // Address with map pin
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Iconsax.location,
                  color: AppColors.textPrimary,
                  size: 4.w,
                ),
                SizedBox(width: 1.w),
                Text(
                  widget.shiftData.address,
                  style: TextStyles.textViewRegular14.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.5.h),
            // Distance
            Text(
              '${widget.shiftData.distance} from current location',
              style: TextStyles.textViewRegular14.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusPill() {
    // Only show status pill for non-available shifts
    if (widget.shiftData.status == ShiftStatus.available) {
      return Container();
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 3.w,
        vertical: 1.h,
      ),
      decoration: BoxDecoration(
        color: _getStatusColor(),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        _getStatusText(),
        style: TextStyles.textViewBold12.copyWith(
          color: AppColors.white,
          fontSize: 12.sp,
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (widget.shiftData.status) {
      case ShiftStatus.applied:
        return AppColors.primary;
      case ShiftStatus.accepted:
        return AppColors.success;
      case ShiftStatus.cancelled:
        return AppColors.error;
      case ShiftStatus.archived:
        return AppColors.textSecondary;
      case ShiftStatus.available:
        return AppColors.primary;
    }
  }

  String _getStatusText() {
    switch (widget.shiftData.status) {
      case ShiftStatus.applied:
        return 'applied'.tr();
      case ShiftStatus.accepted:
        return 'accepted'.tr();
      case ShiftStatus.cancelled:
        return 'cancelled'.tr();
      case ShiftStatus.archived:
        return 'archived'.tr();
      case ShiftStatus.available:
        return '';
    }
  }

  void _navigateToHospitalDetails() {
    // Mock data for hospital details
    final hospitalShifts = [
      {
        'rate': '\$120 / hr',
        'date': 'Mon, 26 Sep 2022',
        'time': '10:30 pm - 8:30 am (8 hrs)',
        'group': 'Group (6)',
      },
      {
        'rate': '\$115 / hr',
        'date': 'Tue, 27 Sep 2022',
        'time': '6:00 am - 2:00 pm (8 hrs)',
        'group': 'Group (6)',
      },
    ];

    final hospitalReviews = [
      {
        'name': 'Dr. Sarah Cooper',
        'date': '25 Oct 2025',
        'rating': '4.0',
        'comment': 'The treatment of the hospital is very good, the environment is clean and hygienic, and I am very honored to participate in this shift.',
      },
      {
        'name': 'Dr. Michael Johnson',
        'date': '20 Oct 2025',
        'rating': '4.5',
        'comment': 'Excellent facilities and professional staff. Highly recommend working here.',
      },
      {
        'name': 'Dr. Emily Davis',
        'date': '15 Oct 2025',
        'rating': '4.2',
        'comment': 'Great working environment with supportive team members.',
      },
    ];

    NavigationManager.navigateTo(
      HospitalDetailsScreen(
        hospitalName: widget.shiftData.hospitalName,
        hospitalAddress: widget.shiftData.address,
        distance: widget.shiftData.distance,
        website: 'theavenuehospital.com.au',
        description: 'The Avenue is a 152-bed private surgical hospital in Windsor. It has a reputation for excellence in orthopaedic surgery, including joint replacements and sports injuries management. The hospital features 11 operating theatres, a day surgery centre, and advanced imaging services.',
        shifts: hospitalShifts,
        reviews: hospitalReviews,
      ),
    );
  }

  Widget _buildShiftTimingCard() {
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
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Iconsax.calendar_1,
                      color: AppColors.textSecondary,
                      size: 4.w,
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      widget.shiftData.date,
                      style: TextStyles.textViewRegular16.copyWith(
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
                      color: AppColors.textSecondary,
                      size: 4.w,
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      widget.shiftData.time,
                      style: TextStyles.textViewRegular16.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: .5.w,
            height: 5.5.h,
            color: AppColors.borderLight,
            margin: EdgeInsets.symmetric(horizontal: 3.w),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rate:',
                style: TextStyles.textViewRegular16.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 0.5.h),
              Text(
                widget.shiftData.rate,
                style: TextStyles.textViewBold18.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionCard() {
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
            'Description',
            style: TextStyles.textViewBold18.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            widget.shiftData.description,
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobRequirementsCard() {
    return Container(
      width: 100.w,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          // BoxShadow(
          //   color: AppColors.shadowLight,
          //   blurRadius: 8,
          //   offset: const Offset(0, 2),
          // ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          _buildRequirementRow('Skill level', widget.shiftData.skillLevel),
          SizedBox(height: 1.5.h),
          _buildRequirementRow('Specialty', widget.shiftData.specialty),
          SizedBox(height: 1.5.h),
          _buildRequirementRow('Support level', widget.shiftData.supportLevel),
          SizedBox(height: 1.5.h),
          _buildRequirementRow('Travel provisions', widget.shiftData.travelProvisions),
          SizedBox(height: 1.5.h),
          _buildRequirementRow('Accommodation provisions', widget.shiftData.accommodationProvisions),
        ],
      ),
    );
  }

  Widget _buildRequirementRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.textViewSemiBold16.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 0.5.h),
        Text(
          value,
          style: TextStyles.textViewRegular16.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildContactDetailsCard() {
    return Container(
      width: 100.w,
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
            'Contact Details',
            style: TextStyles.textViewBold18.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 1.h),
       Row(mainAxisAlignment: MainAxisAlignment.start,children: [  
        Text('Name',style: TextStyles.textViewRegular16.copyWith(
              color: AppColors.textSecondary,
            ),),
            SizedBox(width: 5.w),
         Text(
            widget.shiftData.contactName,
            style: TextStyles.textViewSemiBold16,
          ),],),
          SizedBox(height: 0.5.h),
       Row(mainAxisAlignment: MainAxisAlignment.start,children: [  
        Text('Phone',style: TextStyles.textViewRegular16.copyWith(
              color: AppColors.textSecondary,
            ),),
            SizedBox(width: 5.w),
         Text(
            widget.shiftData.contactPhone,
            style: TextStyles.textViewSemiBold16.copyWith(
           
            ),
          )]),
          SizedBox(height: 0.5.h),
       Row(mainAxisAlignment: MainAxisAlignment.start,children: [  
        Text('Email',style: TextStyles.textViewRegular16.copyWith(
              color: AppColors.textSecondary,
            ),),
            SizedBox(width: 5.w),
         Text(
            widget.shiftData.contactEmail,
            style: TextStyles.textViewSemiBold16.copyWith(
             
            ),
          ),])
        ],
      ),
    );
  }

  Widget _buildSimilarShiftsCard() {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Similar shifts available',
                style: TextStyles.textViewSemiBold18.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(width: 2.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Group (4)',
                  style: TextStyles.textViewRegular12.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Text(
            'Similar shifts only differ in date & rate. Select as many from this group as you\'d like to apply for.',
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
          SizedBox(height: 0.5.h),
          Text(
            'View hospital details for all their available shifts.',
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
          SizedBox(height: 2.h),
          Column(
            children: widget.shiftData.similarShifts.asMap().entries.map((entry) {
              final index = entry.key;
              final shift = entry.value;
              final isSelected = _selectedSimilarShifts.contains(index);
              
              return Container(
                margin: EdgeInsets.only(bottom: 1.5.h),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        _selectedSimilarShifts.remove(index);
                      } else {
                        _selectedSimilarShifts.add(index);
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: isSelected ? AppColors.primary : Colors.grey[300]!,
                        width:  1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.calendar_1,
                          color:  AppColors.black,
                          size: 4.w,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          shift['date']!,
                          style: TextStyles.textViewRegular16.copyWith(
                            color:  AppColors.textSecondary,
                          
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Iconsax.dollar_circle,
                          color:  AppColors.black,
                          size: 4.w,
                        ),
                        SizedBox(width: 1.w),
                        Text(
                          shift['rate']!,
                          style: TextStyles.textViewSemiBold16
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h, bottom: 3.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: _buildButtonsForStatus(),
    );
  }

  Widget _buildButtonsForStatus() {
    switch (widget.shiftData.status) {
      case ShiftStatus.applied:
        return _buildWithdrawButton();
      
      case ShiftStatus.accepted:
        return Column(
          children: [
            _buildWithdrawButton(),
            SizedBox(height: 1.h),
            _buildCancelShiftButton(),
           
          ],
        );
      
      case ShiftStatus.cancelled:
        return Container(); // No buttons for cancelled shifts
      
      case ShiftStatus.archived:
        return _buildReviewButton();
      
      case ShiftStatus.available:
        return _buildApplyButton();
    }
  }

  Widget _buildApplyButton() {
    final selectedCount = _selectedSimilarShifts.length;
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
            _navigateToApplyScreen();
          },
          child: Center(
            child: Text(
              selectedCount > 0 ? 'Apply ($selectedCount shifts)' : 'Apply',
              style: TextStyles.textViewBold16.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWithdrawButton() {
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
            _showWithdrawConfirmation();
          },
          child: Center(
            child: Text(
              'withdraw_application'.tr(),
              style: TextStyles.textViewBold16.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCancelShiftButton() {
    return Container(
      width: double.infinity,
      height: 6.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30.w),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30.w),
          onTap: () {
            _showCancelConfirmation();
          },
          child: Center(
            child: Text(
              'cancel_shift'.tr(),
              style: TextStyles.textViewBold16.copyWith(
                color: AppColors.grayColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRateButton() {
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
            _showRateExperienceBottomSheet();
          },
          child: Center(
            child: Text(
              'rate'.tr(),
              style: TextStyles.textViewBold16.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReviewButton() {
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
            _navigateToReviews();
          },
          child: Center(
            child: Text(
              'review'.tr(),
              style: TextStyles.textViewBold16.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToApplyScreen() {
    final selectedCount = _selectedSimilarShifts.length;
    final numberOfShifts = selectedCount > 0 ? selectedCount : 1;
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ApplyScreen(
          numberOfShifts: numberOfShifts,
          hospitalName: widget.shiftData.hospitalName,
        ),
      ),
    );
  }

  void _showWithdrawConfirmation() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => _buildWithdrawDialog(),
    );
  }

  Widget _buildWithdrawDialog() {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 80.w,
        padding: EdgeInsets.all(6.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(6.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Text(
              'Withdraw application?',
              style: TextStyles.textViewBold18.copyWith(
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 3.h),
            
            // Message
            Text(
              'You are withdrawing your application for this shift. You can apply again.',
              style: TextStyles.textViewRegular14.copyWith(
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 2.h),
            
            // Withdraw Button
            Container(
              width: double.infinity,
              height: 6.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.pop(context);
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
                  },
                  child: Center(
                    child: Text(
                      'Withdraw',
                      style: TextStyles.textViewBold16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 1.h),
            
            // Cancel Button
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyles.textViewRegular14.copyWith(
                  color: AppColors.textLight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCancelConfirmation() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => _buildCancelDialog(),
    );
  }

  Widget _buildCancelDialog() {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 80.w,
        padding: EdgeInsets.all(6.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(6.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Text(
              'Cancel shift?',
              style: TextStyles.textViewBold18.copyWith(
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 3.h),
            
            // Message
            Text(
              'You are cancelling this accepted shift. This cannot be undone.',
              style: TextStyles.textViewRegular14.copyWith(
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 4.h),
            
            // Cancel Shift Button
            Container(
              width: double.infinity,
              height: 6.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.pop(context);
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
                  },
                  child: Center(
                    child: Text(
                      'Cancel Shift',
                      style: TextStyles.textViewBold16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 2.h),
            
            // Back Button
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Back',
                style: TextStyles.textViewRegular14.copyWith(
                  color: AppColors.textLight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRateExperienceBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => RateExperienceBottomSheet(
        onSubmit: () {
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
        },
        onCancel: () {
          // Handle cancellation if needed
        },
      ),
    );
  }

  void _navigateToReviews() {
    // Show the rate experience bottom sheet instead of navigating to reviews
    _showRateExperienceBottomSheet();
  }
}

enum ShiftStatus {
  available,
  applied,
  accepted,
  cancelled,
  archived,
}

class ShiftDetailsData {
  final String hospitalName;
  final String hospitalLocation;
  final String address;
  final String distance;
  final String date;
  final String time;
  final String rate;
  final String description;
  final String skillLevel;
  final String specialty;
  final String supportLevel;
  final String travelProvisions;
  final String accommodationProvisions;
  final String contactName;
  final String contactPhone;
  final String contactEmail;
  final List<Map<String, String>> similarShifts;
  final ShiftStatus status;

  ShiftDetailsData({
    required this.hospitalName,
    required this.hospitalLocation,
    required this.address,
    required this.distance,
    required this.date,
    required this.time,
    required this.rate,
    required this.description,
    required this.skillLevel,
    required this.specialty,
    required this.supportLevel,
    required this.travelProvisions,
    required this.accommodationProvisions,
    required this.contactName,
    required this.contactPhone,
    required this.contactEmail,
    required this.similarShifts,
    this.status = ShiftStatus.available,
  });
}
