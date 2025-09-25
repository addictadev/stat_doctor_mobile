import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/utils/styles/font_utils.dart';
import 'status_indicator.dart';
import '../../../shift_details/presentation/view/shift_details_screen.dart';

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
    return GestureDetector(
      onTap: () => _navigateToShiftDetails(context),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
       
        ),
        child: isHorizontal ? _buildHorizontalCard() : _buildVerticalCard(),
      ),
    );
  }

  void _navigateToShiftDetails(BuildContext context) {
    // Convert ShiftData to ShiftDetailsData
    final shiftDetailsData = ShiftDetailsData(
      hospitalName: shiftData.hospitalName,
      hospitalLocation: _extractLocation(shiftData.hospitalName),
      address: _generateAddress(shiftData.hospitalName),
      distance: shiftData.distance,
      date: shiftData.date,
      time: shiftData.time,
      rate: shiftData.rate,
      description: _generateDescription(shiftData.hospitalName),
      skillLevel: shiftData.role,
      specialty: _extractSpecialty(shiftData.requirements),
      supportLevel: shiftData.seniority,
      travelProvisions: shiftData.hasTravel ? '\$0.72/km, no flights included' : 'Not included',
      accommodationProvisions: shiftData.hasAccommodation ? 'Included' : 'Not included',
      contactName: 'Megan Carpenter',
      contactPhone: '(03) 9529 1234',
      contactEmail: 'info@gmail.com.au',
      similarShifts: _generateSimilarShifts(),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShiftDetailsScreen(shiftData: shiftDetailsData),
      ),
    );
  }

  String _extractLocation(String hospitalName) {
    if (hospitalName.contains('Melbourne')) return 'Melbourne';
    if (hospitalName.contains('Sydney')) return 'Sydney';
    if (hospitalName.contains('Brisbane')) return 'Brisbane';
    return 'Melbourne';
  }

  String _generateAddress(String hospitalName) {
    if (hospitalName.contains("St Vincent's")) {
      return '300 Grattan St, Parkville VIC 3050';
    }
    return '123 Hospital St, Melbourne VIC 3000';
  }

  String _generateDescription(String hospitalName) {
    if (hospitalName.contains("St Vincent's")) {
      return "St Vincent's is a 152-bed private surgical hospital in Melbourne. It has a reputation for excellence in orthopaedic surgery, including joint replacements and sports injuries management. The hospital features 11 operating theatres, a day surgery centre, and advanced imaging services.";
    }
    return "This hospital is known for its excellent medical services and state-of-the-art facilities. It provides comprehensive healthcare services with a focus on patient care and medical excellence.";
  }

  String _extractSpecialty(List<String> requirements) {
    for (String req in requirements) {
      if (req.contains('Emergency Medicine')) return 'Emergency Medicine';
      if (req.contains('General Medicine')) return 'General Medicine';
      if (req.contains('Cardiology')) return 'Cardiology';
    }
    return 'Emergency Medicine';
  }

  List<Map<String, String>> _generateSimilarShifts() {
    return [
      {'date': 'Wed, 01 Nov 2022', 'rate': '\$200/hr'},
      {'date': 'Wed, 01 Nov 2022', 'rate': '\$250/hr'},
      {'date': 'Wed, 01 Nov 2022', 'rate': '\$300/hr'},
      {'date': 'Wed, 01 Nov 2022', 'rate': '\$350/hr'},
    ];
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
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  image: const DecorationImage(
                    image: NetworkImage('https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?w=400'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Distance badge
              Positioned(
                bottom: 1.5.h,
                left: 2.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColors.primary,
                        size: 4.w,
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        shiftData.distance,
                        style: TextStyles.textViewRegular14.copyWith(
                          color: AppColors.primary,
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
                  bottom: 1.5.h,
                  right: 2.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'group_${shiftData.groupSize}'.tr(),
                      style: TextStyles.textViewRegular14.copyWith(
                        color: AppColors.black,
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
                  
                  style: TextStyles.textViewSemiBold18.copyWith(
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 1.h),
                
                // Date and time
                
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(2.w),
                  child: 
                  
                  
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [       
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                    children: [  
                    
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
                SizedBox(height: 1.h),
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
                ],),
             
               const Spacer(),
               Container(
                height: 4.h,
                width: .3.w,
                margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                color: Colors.grey,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(
                      'rate'.tr(),
                      style: TextStyles.textViewRegular14.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(width: 1.w),
                    Text(
                      shiftData.rate,
                      style: TextStyles.textViewSemiBold14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),],)],)
             
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
                              width: 1.5.w,
                              height: 1.5.w,
                              decoration: BoxDecoration(
                                color: AppColors.textSecondary,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Expanded(
                              child: Text(
                                req,
                                style: TextStyles.textViewRegular14.copyWith(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StatusIndicator(
                      icon: Icons.hotel,
                      text: 'accommodation'.tr(),
                      isAvailable: shiftData.hasAccommodation,
                      isSmall: false,
                    ),
                    SizedBox(width: 5.w),
                    StatusIndicator(
                      icon: Icons.flight,
                      text: 'travel'.tr(),
                      isAvailable: shiftData.hasTravel,
                      isSmall: false,
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
    return
    Container(
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
    boxShadow: isHorizontal?null:[
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
     
      ),
      child: 
    Column(
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
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
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
                        color: AppColors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        shiftData.role,
                        style: TextStyles.textViewRegular12.copyWith(
                          color: AppColors.primary,
                          fontWeight: AppFont.semiBold,
                        ),
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        shiftData.seniority,
                        style: TextStyles.textViewRegular12.copyWith(
                          color: AppColors.primary,
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
                        color: AppColors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.primary,
                            size: 2.5.w,
                          ),
                          SizedBox(width: 0.5.w),
                          Text(
                            shiftData.distance,
                            style: TextStyles.textViewRegular12.copyWith(
                              color: AppColors.primary,
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
                        color: AppColors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        shiftData.rate,
                        style: TextStyles.textViewRegular12.copyWith(
                          color: AppColors.primary,
                          fontWeight: AppFont.semiBold,
                        ),
                      ),
                    ),
                  ],
                )),
                Positioned(
                  bottom: 0.h,
                  right: 0.w,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                    decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child:     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatusIndicator(
                      icon: Icons.flight,
                      text: 'travel'.tr(),
                      isAvailable: shiftData.hasTravel,
                      
                      isSmall: true,
                    ),
                  
                    StatusIndicator(
                      icon: Icons.hotel,
                      text: 'accommodation'.tr(),
                      isAvailable: shiftData.hasAccommodation,
                      isSmall: true,
                    ),
                  ],
                ),
               
                    )  ),
            ],
          ),
        ),
        
        // Content
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 1.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 0.2.h),
                
                // Hospital name
                Flexible(
                  child: Text(
                    shiftData.hospitalName,
                    style: TextStyles.textViewSemiBold14.copyWith(
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 0.8.h),
                
                // Date
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 3.w,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: 1.w),
                    Flexible(
                      child: Text(
                        shiftData.date,
                        style: TextStyles.textViewRegular14.copyWith(
                          color: AppColors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
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
                      color: AppColors.welcomeTextPrimary,
                    ),
                    SizedBox(width: 1.w),
                    Flexible(
                      child: Text(
                        shiftData.time,
                        style: TextStyles.textViewRegular14.copyWith(
                          color: AppColors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
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
