import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/align_text.dart';
import 'package:stat_doctor/features/auth/presenation/screens/signup/documentation_screen.dart';
import 'package:stat_doctor/features/auth/presenation/screens/signup/medical_info_screen.dart';
import 'package:stat_doctor/features/auth/presenation/screens/signup/personal_info_screen.dart';
import 'package:stat_doctor/features/auth/presenation/screens/signup/references_screen.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/signup_stepper.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  int activeStep = 0;
  late List<Widget> screens;

  // ! Personal Info
  
  // ! Medical Info

  // ! References

  // ! Documentation


  @override
  void initState() {
    screens = [
      // ! Personal Info
      PersonalInfoScreen(),

      // ! Medical Info
      MedicalInfoScreen(),

      // ! References
      ReferencesScreen(),

      // ! Documentation
      DocumentationScreen(),
    ];
    super.initState();
  }

  @override
  void dispose() {
    // ! Personal Info
    
    // ! Medical Info

    // ! References

    // ! Documentation

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            AlignText(text: "Enter Your Deta to Create Account", style: TextStyles.textViewBold16, padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h, bottom: 5.h),),
            SignupStepper(currentStep: activeStep),
            Expanded(child: screens[activeStep])
          ],
        ),
      ),
    );
  }
}