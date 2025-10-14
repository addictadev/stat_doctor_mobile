import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../main_screens/presentation/widgets/shift_card.dart';

class SampleShiftWithReviews extends StatelessWidget {
  const SampleShiftWithReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          'Sample Shift with Reviews',
          style: TextStyles.textViewBold18.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Archived Shift with Reviews',
              style: TextStyles.textViewBold20.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 2.h),
            
            // Sample archived shift with reviews
            ShiftCard(
              shiftData: ShiftData(
                hospitalName: "St Vincent's Public Hospital Melbourne",
                date: 'Thu, 20 Oct 2022',
                time: '10:30 pm - 8:30 am (10 hrs)',
                rate: '\$150/hr',
                distance: '6.9km',
                role: 'VMO/SMO',
                seniority: 'Senior on site',
                requirements: [
                  'Min. skill level VMO/SMO',
                  'Specialty Emergency Medicine',
                  'Support level Senior on site'
                ],
                hasAccommodation: false,
                hasTravel: true,
                isGroup: false,
                groupSize: 1,
                status: 'Archived', // This will trigger reviews to show
              ),
              isHorizontal: false,
            ),
            
            SizedBox(height: 4.h),
            
            Text(
              'Applied Shift (No Reviews)',
              style: TextStyles.textViewBold20.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 2.h),
            
            // Sample applied shift without reviews
            ShiftCard(
              shiftData: ShiftData(
                hospitalName: "Royal Melbourne Hospital",
                date: 'Mon, 26 Sep 2022',
                time: '6:00 am - 2:00 pm (8 hrs)',
                rate: '\$150/hr',
                distance: '2.1km',
                role: 'SMO',
                seniority: 'Junior on site',
                requirements: [
                  'Min. skill level SMO',
                  'Specialty General Medicine',
                  'Support level Junior on site'
                ],
                hasAccommodation: true,
                hasTravel: false,
                isGroup: false,
                groupSize: 1,
                status: 'Applied', // This will not show reviews
              ),
              isHorizontal: false,
            ),
          ],
        ),
      ),
    );
  }
}
