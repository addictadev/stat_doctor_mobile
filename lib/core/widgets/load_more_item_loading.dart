import 'package:stat_doctor/core/widgets/app_shimmer.dart';
import 'package:stat_doctor/core/widgets/shimmer_shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadMoreItemLoading extends StatelessWidget{
  const LoadMoreItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(child: ShimmerShape(width: double.infinity,height: 80.h,radius: 15.r,));
  }
}