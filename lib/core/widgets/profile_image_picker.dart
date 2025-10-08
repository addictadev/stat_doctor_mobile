import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:io';
import '../theme/app_colors.dart';

class ProfileImagePicker extends StatelessWidget {
  final String? imagePath;
  final File? imageFile;
  final VoidCallback onTap;
  final double size;
  final Color? backgroundColor;
  final Color? borderColor;
  final Widget? placeholder;

  const ProfileImagePicker({
    super.key,
    this.imagePath,
    this.imageFile,
    required this.onTap,
    this.size = 100,
    this.backgroundColor,
    this.borderColor,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor ?? AppColors.white,
          border: Border.all(
            color: borderColor ?? AppColors.borderLight,
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            // Profile image or placeholder
            Center(
              child: _buildImageWidget(),
            ),
            // Edit icon
            Positioned(
              bottom: 0,
              top: -70,
              right: -5,
              child: Container(
                width: size * 0.4,
                height: size * 0.4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.homeGradientCyan,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Iconsax.edit,
                  size: size * 0.15,
                  // color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWidget() {
    if (imageFile != null) {
      return ClipOval(
        child: Image.file(
          imageFile!,
          width: size - 4,
          height: size - 4,
          fit: BoxFit.cover,
        ),
      );
    } else if (imagePath != null) {
      return ClipOval(
        child: Image.asset(
          imagePath!,
          width: size - 4,
          height: size - 4,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return placeholder ??
          Icon(
            Iconsax.image,
            size: size * 0.4,
            color: AppColors.textSecondary,
          );
    }
  }
}
