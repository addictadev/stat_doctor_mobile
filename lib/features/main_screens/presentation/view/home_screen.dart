import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stat_doctor/core/images_preview/app_assets.dart';
import 'package:stat_doctor/core/images_preview/custom_svg_img.dart';
import 'package:stat_doctor/core/navigation_services/navigation_manager.dart';
import 'package:stat_doctor/core/widgets/custom_textform_field.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';
import '../widgets/shift_card.dart';
import '../widgets/filter_button.dart';
import '../../../search/presentation/view/search_screen.dart';
import '../../../filter/presentation/view/filter_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedFilter = 'all';
  final TextEditingController _searchController = TextEditingController();

  final List<String> _filterOptions = [
    'all',
    'morning',
    'evening',
    'night',
    'bridging',
  ];

  final List<ShiftData> _hospitalShifts = [
    ShiftData(
      hospitalName: "St Vincent's Public Hospital Melbourne",
      date: "Mon, 26 Sep 2022",
      time: "10:30 pm - 8:30 am (8 hrs)",
      rate: "\$120/hr",
      distance: "3.6km",
      role: "VMO/SMO",
      seniority: "Senior OS",
      requirements: [
        "Min. skill level VMO/SMO",
        "Specialty Emergency Medicine",
      ],
      hasAccommodation: false,
      hasTravel: true,
      isGroup: true,
      groupSize: 6,
    ),
    ShiftData(
      hospitalName: "Royal Melbourne Hospital",
      date: "Tue, 27 Sep 2022",
      time: "7:00 am - 3:00 pm (8 hrs)",
      rate: "\$110/hr",
      distance: "2.1km",
      role: "VMO/SMO",
      seniority: "Senior OS",
      requirements: [
        "Min. skill level VMO/SMO",
        "Specialty General Medicine",
        "Support level Senior on site",
      ],
      hasAccommodation: true,
      hasTravel: true,
      isGroup: false,
      groupSize: 1,
    ),
  ];

  final List<ShiftData> _otherShifts = [
    ShiftData(
      hospitalName: "St Vincent's Public Hospital Melbourne",
      date: "Mon, 26 Sep 2022",
      time: "10:30 pm - 8:30 am",
      rate: "\$120/hr",
      distance: "3.6km",
      role: "VMO/SMO",
      seniority: "Senior OS",
      requirements: [],
      hasAccommodation: false,
      hasTravel: true,
      isGroup: false,
      groupSize: 1,
    ),
    ShiftData(
      hospitalName: "St Vincent's Public Hospital Melbourne",
      date: "Mon, 26 Sep 2022",
      time: "10:30 pm - 8:30 am",
      rate: "\$120/hr",
      distance: "3.6km",
      role: "VMO/SMO",
      seniority: "Senior OS",
      requirements: [],
      hasAccommodation: false,
      hasTravel: true,
      isGroup: false,
      groupSize: 1,
    ),
    ShiftData(
      hospitalName: "St Vincent's Public Hospital Melbourne",
  date: "Mon, 26 Sep 2022",
      time: "10:30 pm - 8:30 am",
      rate: "\$120/hr",
      distance: "3.6km",
      role: "VMO/SMO",
      seniority: "Senior OS",
      requirements: [],
      hasAccommodation: false,
      hasTravel: true,
      isGroup: false,
      groupSize: 1,
    ),
    ShiftData(
      hospitalName: "St Vincent's Public Hospital Melbourne",
      date: "Mon, 26 Sep 2022",
      time: "10:30 pm - 8:30 am",
      rate: "\$120/hr",
      distance: "3.6km",
      role: "VMO/SMO",
      seniority: "Senior OS",
      requirements: [],
      hasAccommodation: false,
      hasTravel: true,
      isGroup: false,
      groupSize: 1,
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body:  Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHospitalSection(),
                    SizedBox(height: 1.h),
                    _buildInterestedShiftsSection(),
                    SizedBox(height: 3.h),
                    _buildOtherShiftsSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.w), bottomRight: Radius.circular(8.w)),
    image: DecorationImage(
      image: AssetImage(AppAssets.homeBackground),
      
      fit: BoxFit.cover,
    ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      SizedBox(height: 6.h),
          // Welcome text
           Text(
                'welcome_to'.tr(),
                style: TextStyles.textViewRegular16.copyWith(
                  color: AppColors.white,
                  fontSize: 16.sp,
                ),
              ),
             
              Text(
                'StatDoctor',
                style: TextStyles.textViewBold24.copyWith(
                  color: AppColors.white,
                ),
              ),
          SizedBox(height: 2.h),
          
          // Search bar
          
         Row(children: [
         Expanded(child: GestureDetector(
            onTap: () {
                           NavigationManager.navigateTo(SearchScreen());

            },
           child: CustomTextFormField(hint: 'search_hospital_or_location'.tr(),
            controller: _searchController,
            contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            fillColor: AppColors.white.withOpacity(.2),
            hintStyle: TextStyles.textViewRegular16.copyWith(
              color: AppColors.white,
            ),
            prefixIcon: Icon(Iconsax.search_normal_1, color: AppColors.white, size: 5.w,),
    borderColor: AppColors.white.withOpacity(.3),
            borderRadius: 25,
            borderWidth: 1.5,
            enabled: false, // Make it non-editable, just for navigation
           ),
         )),
            IconButton(
              icon: CustomSvgImage(
                assetName: AppAssets.filterIcon,
                width: 12.w,
                height: 12.w,
              ),
              onPressed: () {
              NavigationManager.navigateTo(SearchScreen());
              },
            ),
                
         ])
        ],
      ),
    );
  }

  Widget _buildHospitalSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 2.h),
        Text(
          'hospital_you_worked_at'.tr(),
          style: TextStyles.textViewBold18.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 1.h),
        SizedBox(
          height: 48.h,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: _hospitalShifts.length,
            itemBuilder: (context, index) {
              return Container(
                width: 75.w,
                decoration: BoxDecoration(
                  color: AppColors.white,
                     boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(3.w),
                margin: EdgeInsets.only(right: 4.w),
                child: ShiftCard(
                  shiftData: _hospitalShifts[index],
                  isHorizontal: true,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget _buildInterestedShiftsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 2.h),
        Text(
          'shifts_you_might_be_interested'.tr(),
          style: TextStyles.textViewBold18.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 1.h),
        SizedBox(
          height: 48.h,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: _hospitalShifts.length,
            itemBuilder: (context, index) {
              return Container(
                width: 75.w,
                decoration: BoxDecoration(
                  color: AppColors.white,
                     boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(3.w),
                margin: EdgeInsets.only(right: 4.w),
                child: ShiftCard(
                  shiftData: _hospitalShifts[index],
                  isHorizontal: true,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildOtherShiftsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Other Shifts',
              style: TextStyles.textViewBold18.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'closest_to_me'.tr(),
                    style: TextStyles.textViewRegular12.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(width: 1.w),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.textSecondary,
                    size: 4.w,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        
        // Filter buttons
        SizedBox(
          height: 4.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _filterOptions.length,
            itemBuilder: (context, index) {
              final filter = _filterOptions[index];
              return Container(
                margin: EdgeInsets.only(right: 2.w),
                child: FilterButton(
                  text: filter.tr(),
                  isSelected: _selectedFilter == filter,
                  onTap: () {
                    setState(() {
                      _selectedFilter = filter;
                    });
                  },
                ),
              );
            },
          ),
        ),
        SizedBox(height: 2.h),
        
        // Other shifts grid
        GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 3.w,
            mainAxisSpacing: 2.h,
          ),
          itemCount: _otherShifts.length,
          itemBuilder: (context, index) {
            return ShiftCard(
              shiftData: _otherShifts[index],
              isHorizontal: false,
            );
          },
        ),
      ],
    );
  }
}

