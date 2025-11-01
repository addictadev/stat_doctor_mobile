import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/default_container.dart';

class MyShiftsDetailsDescription extends StatelessWidget {
  final String description;
  const MyShiftsDetailsDescription({required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description", style: TextStyles.textViewBold16,),
          Text(description, style: TextStyles.textViewMedium14.copyWith(color: Theme.of(context).hintColor),),
        ],
      ),
    );
  }
}