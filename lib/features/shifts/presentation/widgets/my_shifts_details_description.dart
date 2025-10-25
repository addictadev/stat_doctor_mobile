import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/default_container.dart';

class MyShiftsDetailsDescription extends StatelessWidget {
  const MyShiftsDetailsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description", style: TextStyles.textViewBold16,),
          Text("The Avenue is a 152-bed private surgical hospital in Windsor. It has a reputation for excellence in orthopaedic surgery, including joint replacements and sports injuries management. The hospital features 11 operating theatres, a day surgery centre, and advanced imaging services.", style: TextStyles.textViewMedium14.copyWith(color: Theme.of(context).hintColor),),
        ],
      ),
    );
  }
}