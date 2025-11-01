import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/widgets/app_shimmer.dart';
import 'package:stat_doctor/core/widgets/shimmer_shape.dart';

class HomeGridLoading extends StatelessWidget {
  const HomeGridLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
        ),
        itemCount: 6,
        itemBuilder: (context, index) => AppShimmer(child: ShimmerShape(width: double.infinity, height: double.infinity, radius: 15.r,))
      ),
    );
  }
}