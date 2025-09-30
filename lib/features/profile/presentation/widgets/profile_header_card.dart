import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/images_preview/app_assets.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/features/profile/domain/entities/user_profile_entity.dart';

class ProfileHeaderCard extends StatelessWidget {
  final UserProfileEntity userProfile;
  final VoidCallback? onEditProfile;
  final VoidCallback? onProfileImageTap;

  const ProfileHeaderCard({
    super.key,
    required this.userProfile,
    this.onEditProfile,
    this.onProfileImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
    
        borderRadius: BorderRadius.circular(20),
     image: DecorationImage(
      image: AssetImage(AppAssets.homeBackground),
      fit: BoxFit.cover,
     ),
      ),
      child: Stack(
        children: [
          // Background decoration
          Positioned(
            top: -20,
            right: -20,
            child: Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 8.w,
              height: 8.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ),
          
          // Content
          Padding(
            padding: EdgeInsets.all(6.w),
            child: Column(
              children: [
                // App Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Profile',
                      style: TextStyles.textViewSemiBold20.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: onEditProfile,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 1.5.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.edit,
                              color: AppColors.white,
                              size: 4.w,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              'Edit Profile',
                              style: TextStyles.textViewMedium14.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 4.h),
                
                // Profile Info
                Row(
                  children: [
                    // Profile Image
                    GestureDetector(
                      onTap: onProfileImageTap,
                      child: Container(
                        width: 20.w,
                        height: 20.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.white,
                            width: 3,
                          ),
                        ),
                        child: ClipOval(
                          child: userProfile.profileImage != null
                              ? Image.network(
                                  userProfile.profileImage!,
                                  width: 20.w,
                                  height: 20.w,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return _buildPlaceholder();
                                  },
                                )
                              : _buildPlaceholder(),
                        ),
                      ),
                    ),
                    
                    SizedBox(width: 4.w),
                    
                    // User Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userProfile.displayName,
                            style: TextStyles.textViewSemiBold18.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            userProfile.email,
                            style: TextStyles.textViewRegular14.copyWith(
                              color: AppColors.white.withOpacity(0.9),
                            ),
                          ),
                          SizedBox(height: 0.5.h),
                          Text(
                            userProfile.phoneNumber,
                            style: TextStyles.textViewRegular14.copyWith(
                              color: AppColors.white.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: 20.w,
      height: 20.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white.withOpacity(0.2),
      ),
      child: Icon(
        Icons.person,
        color: AppColors.white,
        size: 10.w,
      ),
    );
  }
}
