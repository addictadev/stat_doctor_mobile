import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/utils/styles/font_utils.dart';
import '../widgets/shift_card.dart';
import '../widgets/filter_button.dart';
import '../widgets/status_indicator.dart';

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
        "Support level Senior on site",
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
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHospitalSection(),
                    SizedBox(height: 4.h),
                    _buildOtherShiftsSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        gradient: AppColors.homeBackgroundGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          // Status indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatusIndicator(
                icon: Icons.hotel,
                text: 'accommodation'.tr(),
                isAvailable: false,
              ),
              StatusIndicator(
                icon: Icons.flight,
                text: 'travel'.tr(),
                isAvailable: true,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'x A',
                  style: TextStyles.textViewRegular12.copyWith(
                    color: AppColors.white,
                    fontWeight: AppFont.semiBold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 3.h),
          
          // Welcome text
          Row(
            children: [
              Text(
                'welcome_to'.tr(),
                style: TextStyles.textViewRegular16.copyWith(
                  color: AppColors.white,
                ),
              ),
              SizedBox(width: 1.w),
              Text(
                'StatDoctor',
                style: TextStyles.textViewBold24.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 3.h),
          
          // Search bar
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowLight,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'search_hospital_or_location'.tr(),
                hintStyle: TextStyles.textViewRegular14.copyWith(
                  color: AppColors.textTertiary,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.textSecondary,
                  size: 5.w,
                ),
                suffixIcon: Container(
                  margin: EdgeInsets.all(1.w),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Iconsax.filter,
                      color: AppColors.white,
                      size: 4.w,
                    ),
                    onPressed: () {
                      // TODO: Implement filter functionality
                    },
                  ),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                  vertical: 3.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHospitalSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'hospital_you_worked_at'.tr(),
          style: TextStyles.textViewBold18.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 2.h),
        SizedBox(
          height: 35.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _hospitalShifts.length,
            itemBuilder: (context, index) {
              return Container(
                width: 80.w,
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
              'shifts_you_might_be_interested'.tr(),
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