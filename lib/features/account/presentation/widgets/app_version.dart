import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';

class Appversion extends StatefulWidget {
  const Appversion({super.key});
  @override
  State<Appversion> createState() => _AppversionState();
}

class _AppversionState extends State<Appversion> {
  String version = '0.0.0';

  Future<void> _getVersion() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {version = packageInfo.version;});
  }

  @override
  void initState() {
    _getVersion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Text("StatDoctor © ${DateTime.now().year} v$version", style: TextStyles.textViewMedium14.copyWith(color: AppColors.hintColorLight),),
    );
  }
}