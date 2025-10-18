import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/align_text.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/material.dart';

class AppVersion extends StatefulWidget {
  const AppVersion({super.key});

  @override
  State<AppVersion> createState() => _AppVersionState();
}

class _AppVersionState extends State<AppVersion> {
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
    return  AlignText(
      text: "V $version",
      style: TextStyles.textViewRegular10.copyWith(color: Theme.of(context).hintColor,),
      alignment: Alignment.center,
    );
  }
}