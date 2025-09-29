import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:stat_doctor/core/images_preview/custom_asset_img.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/images_preview/app_assets.dart';
import '../../../../core/images_preview/custom_svg_img.dart';
import '../../../../core/widgets/custom_textform_field.dart';
import '../../../filter/presentation/view/filter_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isLocationEnabled = false; // This should be checked from location service
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: _isLocationEnabled ? _buildSearchContent() : _buildLocationPermissionWidget(),
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
            Expanded(child: CustomTextFormField(
              controller: _searchController,
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
              textStyle: TextStyle(color: AppColors.white, fontSize: 14.sp),
              onChanged: (value) {
                setState(() {});
              },
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
        CustomImageAsset(assetName: AppAssets.locationIcon, width: 35.w,),
          SizedBox(height: 2.h),
          // Title
          Text(
            'Location service needs to be\n enabled.',
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
            'In order to use the search features, you need to allow StatDoctor access to your location.',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.h),
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

  Widget _buildSearchContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          // Show search results if searching, otherwise show recent searches
          if (_searchController.text.isNotEmpty) 
            _buildSearchResults()
          else ...[
            _buildRecentSearches(),
          
          ],
        ],
      ),
    );
  }


  Widget _buildRecentSearches() {
    final recentSearches = ['Emergency Medicine', 'Cardiology', 'Surgery', 'Pediatrics'];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Searches',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 2.h),
        ...recentSearches.map((search) => _buildSearchChip(search)),
      ],
    );
  }


  Widget _buildSearchChip(String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.h),
      child: GestureDetector(
        onTap: () {
          _searchController.text = text;
          setState(() {});
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(Iconsax.clock, color: Colors.grey[600], size: 4.w),
              SizedBox(width: 2.w),
              Text(
                text,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Search Results',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 2.h),
        // Add search results here
        Container(
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
          child: Text(
            'Search results for "${_searchController.text}" will appear here...',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}