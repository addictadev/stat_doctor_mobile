import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_images.dart';

class AuthAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppbar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(200.h);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 100.h,
        width: double.infinity,
        padding: EdgeInsets.all(15.r),
        alignment: AlignmentDirectional.centerStart,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.authPatterns), fit: BoxFit.cover),
        ),
        child: Image.asset(AppImages.logo, width: MediaQuery.sizeOf(context).width * 0.5),
      ),
    );
  }
}