import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/widgets/app_shimmer.dart';
import 'package:stat_doctor/core/widgets/shimmer_shape.dart';

class HomeHorizontalListLoading extends StatelessWidget {
  const HomeHorizontalListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.57,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: 3,
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemBuilder: (context, index) => AppShimmer(child: ShimmerShape(width: MediaQuery.sizeOf(context).width * 0.8, height: MediaQuery.sizeOf(context).height * 0.57, radius: 20.r,)),
      ),
    );
  }
}