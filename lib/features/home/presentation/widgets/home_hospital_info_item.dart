import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/circle_container.dart';
import 'package:stat_doctor/core/widgets/custom_rich_text.dart';

class HomeHospitalInfoItem extends StatelessWidget {
  final String title;
  final String value;
  const HomeHospitalInfoItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.w,
      children: [
        CircleContainer(size: 7, color: Theme.of(context).hintColor,),
        Expanded(
          child: CustomRichText(
            startSubText: title,
            centerSubText: value,
            startSubTextStyle: TextStyles.textViewMedium12.copyWith(color: Theme.of(context).hintColor),
            centerSubTextStyle: TextStyles.textViewMedium14,
          ),
        )
      ],
    );
  }
}