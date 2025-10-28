import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_images.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/methods/map_methods.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';

class LocationServiceDisabledScreen extends StatelessWidget {
  const LocationServiceDisabledScreen({super.key});

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
            Text("Location service needs to be enabled.", style: TextStyles.textViewBold18, textAlign: TextAlign.center,),
            Text("In order to use the Home page feature, you need to allow StatDoctor access to your location.", style: TextStyles.textViewMedium14, textAlign: TextAlign.center,),
            AppButton(
              text: "Enabled location access",
              onTap: () {MapMethods.openLocationSettings();},
            )
          ],
        ),
      ),
    );
  }
}