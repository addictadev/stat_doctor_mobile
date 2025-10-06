import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:stat_doctor/core/images_preview/app_assets.dart' show AppAssets;
import 'package:stat_doctor/core/images_preview/custom_asset_img.dart';
import 'package:stat_doctor/core/widgets/custom_textform_field.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';

class RateExperienceBottomSheet extends StatefulWidget {
  final VoidCallback? onSubmit;
  final VoidCallback? onCancel;

  const RateExperienceBottomSheet({
    super.key,
    this.onSubmit,
    this.onCancel,
  });

  @override
  State<RateExperienceBottomSheet> createState() => _RateExperienceBottomSheetState();
}

class _RateExperienceBottomSheetState extends State<RateExperienceBottomSheet> {
  int _selectedRating = 4; // Default to 4 stars as shown in the image
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6.w),
          topRight: Radius.circular(6.w),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 2.h),
         CustomImageAsset(assetName: AppAssets.happy,width: 25.w,height: 25.w,),
          SizedBox(height: 3.h),
          // Title
          Text(
            'rate_your_experience'.tr(),
            style: TextStyles.textViewBold20.copyWith(
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          
          SizedBox(height: 3.h),
          
          // Star Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedRating = index + 1;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 1.w),
                  child: Icon(
                    index < _selectedRating ? Icons.star : Icons.star_border,
                    color: index < _selectedRating ? Colors.amber : AppColors.borderLight,
                    size: 8.w,
                  ),
                ),
              );
            }),
          ),
          
          SizedBox(height: 3.h),
          
        CustomTextFormField(
              controller: _commentController,
              maxLines: 4,
              hint: 'write_comment_optional'.tr(),
              hintStyle: TextStyles.textViewRegular14.copyWith(
                color: AppColors.textLight,
              ),
              borderColor: AppColors.borderLight,
              borderRadius: 12,
            
            ),
          
          
          SizedBox(height: 3.h),
          
          // Submit Button
         
         
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
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  widget.onSubmit?.call();
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text(
                    'submit'.tr(),
                    style: TextStyles.textViewBold16.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          SizedBox(height: 2.h),
          
          // Not Now Button
          TextButton(
            onPressed: () {
              widget.onCancel?.call();
              Navigator.pop(context);
            },
            child: Text(
              'not_now'.tr(),
              style: TextStyles.textViewRegular14.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
