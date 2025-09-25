import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import '../theme/app_colors.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final String searchHint;
  final VoidCallback? onSearchTap;
  final VoidCallback? onFilterTap;
  final bool showSearchBar;
  final bool showFilterButton;

  const CustomHeader({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.onBackPressed,
    this.searchHint = 'Search hospital or location...',
    this.onSearchTap,
    this.onFilterTap,
    this.showSearchBar = true,
    this.showFilterButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(0.8),
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            children: [
              // Top row with back button and title
              Row(
                children: [
                  if (showBackButton) ...[
                    GestureDetector(
                      onTap: onBackPressed ?? () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Iconsax.arrow_left_2,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                  ],
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              if (showSearchBar) ...[
                SizedBox(height: 2.h),
                // Search bar
                _buildSearchBar(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 6.h,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          SizedBox(width: 4.w),
          Icon(
            Iconsax.search_normal,
            color: Colors.grey[600],
            size: 20,
          ),
          SizedBox(width: 3.w),
          Expanded(
            child: GestureDetector(
              onTap: onSearchTap,
              child: Text(
                searchHint,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
          if (showFilterButton) ...[
            GestureDetector(
              onTap: onFilterTap,
              child: Container(
                margin: EdgeInsets.only(right: 2.w),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Iconsax.filter,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
