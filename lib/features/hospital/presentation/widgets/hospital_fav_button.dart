import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';

class HospitalFavButton extends StatefulWidget {
  final bool isFav;
  const HospitalFavButton({super.key, required this.isFav});

  @override
  State<HospitalFavButton> createState() => _HospitalFavButtonState();
}

class _HospitalFavButtonState extends State<HospitalFavButton> {
  bool isFav = false;

  @override
  void initState() {
    isFav = widget.isFav;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackButton(
      onPressed: () {setState(() {isFav = !isFav;});},
      style: ButtonStyle(
        enableFeedback: false,
        backgroundColor: WidgetStatePropertyAll(AppColors.textColorLight.withValues(alpha: 0.1)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000.r))),
        backgroundBuilder: (context, states, child) => Icon(isFav ? Icons.bookmark_rounded : Icons.bookmark_border_rounded, color: AppColors.cardColorLight,),
      ),
    );
  }
}