import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/align_text.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_header.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_hospital_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HomeHeader(searchController: searchController,),
          SliverToBoxAdapter(
            child: Column(
              children: [
                AlignText(
                  text: "Hospital you’ve worked at",
                  style: TextStyles.textViewBold18,
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 10.h),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    spacing: 10.w,
                    children: List.generate(10, (index) => HomeHospitalCard()),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 125.h,),)
        ],
      ),
    );
  }
}