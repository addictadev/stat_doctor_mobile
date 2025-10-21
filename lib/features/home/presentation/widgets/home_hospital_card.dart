import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_hospital_card_buttons.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_hospital_card_image.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_hospital_card_rate.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_hospital_info_item.dart';

class HomeHospitalCard extends StatelessWidget {
  const HomeHospitalCard({super.key});

  static const String image = "https://plus.unsplash.com/premium_photo-1672097247893-4f8660247b1f?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1169";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.8,
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        spacing: 15.h,
        children: [
          HomeHospitalCardImage(image: image),
          Text("St Vincent’s Public Hospital  Melbourne", style: TextStyles.textViewBold16,),
          HomeHospitalCardRate(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15.h,
            children: [
              HomeHospitalInfoItem(title: "Min. skill level: ", value: "VMO/SMO"),
              HomeHospitalInfoItem(title: "Specialty: ", value: "Emergency Medicine"),
              HomeHospitalInfoItem(title: "Support level: ", value: "Senior on site"),
            ],
          ),
          HomeHospitalCardButtons(),
        ],
      ),
    );
  }
}