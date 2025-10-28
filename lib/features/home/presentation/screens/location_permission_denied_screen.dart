import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_images.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/methods/map_methods.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';

class LocationPermissionDeniedScreen extends StatelessWidget {
  const LocationPermissionDeniedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15.h,
          children: [
            Image.asset(AppImages.locationService, width: MediaQuery.sizeOf(context).width * 0.5, ),
            Text("Location permission denied.", style: TextStyles.textViewBold18, textAlign: TextAlign.center,),
            Text("Please go to settings and enable location permission to use the Home page feature.", style: TextStyles.textViewMedium14, textAlign: TextAlign.center,),
            AppButton(
              text: "Open Settings",
              onTap: () {MapMethods.openAppSettings();},
            )
          ],
        ),
      ),
    );
  }
}