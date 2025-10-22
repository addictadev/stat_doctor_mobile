import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/widgets/app_shimmer.dart';
import 'package:stat_doctor/core/widgets/shimmer_shape.dart';

class LoadingCardForDropDowns extends StatelessWidget {
  const LoadingCardForDropDowns({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(child: ShimmerShape(width: double.infinity, height: 50.h, radius: 15.r));
  }
}
