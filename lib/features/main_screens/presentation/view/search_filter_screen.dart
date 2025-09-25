import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:stat_doctor/features/filter/presentation/view/filter_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/images_preview/app_assets.dart';
import '../../../../core/images_preview/custom_svg_img.dart';
import '../../../../core/widgets/custom_textform_field.dart';

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({super.key});

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  bool _isLocationEnabled = false; // This should be checked from location service
  String _selectedShift = 'Evening';
  double _distanceValue = 50.0;
  String? _selectedSpecialty;
  String? _selectedSkillLevel;
  DateTime _selectedDate = DateTime(2025, 1, 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: _isLocationEnabled ? _buildFilterContent() : _buildLocationPermissionWidget(),
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
          SizedBox(height: 5.h),
          // Back button and title row
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(1.5.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Iconsax.arrow_left_2,
                    color: Colors.white,
                    size: 5.w,
                  ),
                ),
              ),
              SizedBox(height: 1.h),
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
            ],
          ),
          SizedBox(height: 1.h),
          // Search bar
          Row(children: [
            Expanded(child: GestureDetector(
              onTap: () {
                // Handle search tap if needed
              },
              child: CustomTextFormField(
                hint: 'search_hospital_or_location'.tr(),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FilterScreen()),
                );
              },
            ),
          ])
        ],
      ),
    );
  }

  Widget _buildLocationPermissionWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Location icon
          Container(
            width: 30.w,
            height: 30.w,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Iconsax.location,
              size: 15.w,
              color: Colors.grey[400],
            ),
          ),
          SizedBox(height: 4.h),
          // Title
          Text(
            'Location service needs to be enabled.',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.h),
          // Description
          Text(
            'In order to use the search and filter features, you need to allow StatDoctor access to your location.',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          // Enable location button
          Container(
            width: double.infinity,
            height: 6.h,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {
                  // Enable location permission
                  setState(() {
                    _isLocationEnabled = true;
                  });
                },
                child: Center(
                  child: Text(
                    'Enable location access',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Available days section
          _buildSectionTitle('Available days'),
          SizedBox(height: 2.h),
          _buildCalendarSection(),
          SizedBox(height: 4.h),
          
          // Available shifts section
          _buildSectionTitle('Available shifts'),
          SizedBox(height: 2.h),
          _buildShiftsSection(),
          SizedBox(height: 4.h),
          
          // Distance section
          _buildSectionTitle('Distance from current location'),
          SizedBox(height: 2.h),
          _buildDistanceSection(),
          SizedBox(height: 4.h),
          
          // Specialty section
          _buildSectionTitle('Specialty'),
          SizedBox(height: 2.h),
          _buildSpecialtySection(),
          SizedBox(height: 4.h),
          
          // Skill level section
          _buildSectionTitle('Skill level'),
          SizedBox(height: 2.h),
          _buildSkillLevelSection(),
          SizedBox(height: 6.h),
          
          // Action buttons
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildCalendarSection() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Month header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Iconsax.arrow_left_2, color: AppColors.primary),
              Text(
                'January 2025',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Iconsax.arrow_right_3, color: AppColors.primary),
            ],
          ),
          SizedBox(height: 2.h),
          // Days of week
          Row(
            children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                .map((day) => Expanded(
                      child: Center(
                        child: Text(
                          day,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
          SizedBox(height: 1.h),
          // Calendar grid
          _buildCalendarGrid(),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    // Simple calendar grid - you can implement a proper calendar widget here
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1,
      ),
      itemCount: 35,
      itemBuilder: (context, index) {
        int day = index - 6 + 15; // Simple calculation for demo
        bool isSelected = day == _selectedDate.day;
        bool isCurrentMonth = day > 0 && day <= 31;
        
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = DateTime(2025, 1, day);
            });
          },
          child: Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                day.toString(),
                style: TextStyle(
                  color: isSelected 
                      ? Colors.white 
                      : isCurrentMonth 
                          ? AppColors.textPrimary 
                          : Colors.grey[400],
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildShiftsSection() {
    final shifts = ['Morning', 'Evening', 'Night', 'Bridging'];
    
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
        crossAxisSpacing: 2.w,
        mainAxisSpacing: 2.h,
      ),
      itemCount: shifts.length,
      itemBuilder: (context, index) {
        final shift = shifts[index];
        final isSelected = _selectedShift == shift;
        
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedShift = shift;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.grey[300]!,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Center(
              child: Text(
                shift,
                style: TextStyle(
                  color: isSelected ? AppColors.primary : AppColors.textPrimary,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDistanceSection() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Distance from current location',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Up to ${_distanceValue.round()} km',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Slider(
            value: _distanceValue,
            min: 0,
            max: 100,
            divisions: 20,
            activeColor: AppColors.primary,
            inactiveColor: Colors.grey[300],
            onChanged: (value) {
              setState(() {
                _distanceValue = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialtySection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              _selectedSpecialty ?? 'Select...',
              style: TextStyle(
                fontSize: 14.sp,
                color: _selectedSpecialty != null ? AppColors.textPrimary : Colors.grey[600],
              ),
            ),
          ),
          Icon(
            Iconsax.arrow_down_1,
            color: Colors.grey[600],
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildSkillLevelSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              _selectedSkillLevel ?? 'Select...',
              style: TextStyle(
                fontSize: 14.sp,
                color: _selectedSkillLevel != null ? AppColors.textPrimary : Colors.grey[600],
              ),
            ),
          ),
          Icon(
            Iconsax.arrow_down_1,
            color: Colors.grey[600],
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        // Save button
        Container(
          width: double.infinity,
          height: 6.h,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () {
                // Save filters
                Navigator.pop(context);
              },
              child: Center(
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        // Reset button
        TextButton(
          onPressed: () {
            // Reset all filters
            setState(() {
              _selectedShift = 'Evening';
              _distanceValue = 50.0;
              _selectedSpecialty = null;
              _selectedSkillLevel = null;
              _selectedDate = DateTime(2025, 1, 15);
            });
          },
          child: Text(
            'Reset',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
