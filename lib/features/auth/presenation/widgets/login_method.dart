import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/biometric_switch.dart';

class LoginMethod extends StatefulWidget {
  final ValueNotifier<bool> faceIdEnabled;
  final ValueNotifier<bool> touchIdEnabled;
  const LoginMethod({super.key, required this.faceIdEnabled, required this.touchIdEnabled});
  @override
  State<LoginMethod> createState() => _LoginMethodState();
}

class _LoginMethodState extends State<LoginMethod> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Login Methods', style: TextStyles.textViewSemiBold14),
        BiometricSwitch(
          title: 'Face ID',
          description: 'Do you want to use FaceID for logging on in the future?',
          icon: AppIcons.faceId,
          value: widget.faceIdEnabled.value,
          onChanged: (value) {setState(() {widget.faceIdEnabled.value = value;});},
        ),
        BiometricSwitch(
          title: 'Touch ID',
          description: 'Do you want to use Fingerprint for logging on in the future?',
          icon: AppIcons.touchId,
          value: widget.touchIdEnabled.value,
          onChanged: (value) {setState(() {widget.touchIdEnabled.value = value;});},
        ),
      ],
    );
  }
}