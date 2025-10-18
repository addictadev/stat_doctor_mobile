import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/styles/styles.dart';


class CustomStatusContainer extends StatelessWidget{
  final String title;
  final Color color;
  final Color? textColor;
  final double? radius;
  final Function()? onTap;
  const CustomStatusContainer({super.key,required this.title,required this.color, this.textColor,this.radius,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 10.h,bottom: 10.h,right: 10.w,left: 10.w
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius ??30.r)),
            color: color
        ),
        child: Text(title,style: TextStyles.textViewBold10.copyWith(fontWeight: FontWeight.w400,color: textColor),),
      ),
    );
  }

}