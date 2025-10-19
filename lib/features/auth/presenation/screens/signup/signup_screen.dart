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
  TextEditingController photoProfileController = TextEditingController();
  TextEditingController photoProfilePathController = TextEditingController();
  TextEditingController photoProfileNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController(text: "+61");
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  ValueNotifier<bool> faceIdEnabled = ValueNotifier(false);
  ValueNotifier<bool> touchIdEnabled = ValueNotifier(false);

  // ! Medical Info

  // ! References

  // ! Documentation


  @override
  void initState() {
    screens = [
      // ! Personal Info
      PersonalInfoScreen(
        photoProfileController: photoProfileController,
        photoProfilePathController: photoProfilePathController,
        photoProfileNameController: photoProfileNameController,
        firstNameController: firstNameController,
        lastNameController: lastNameController,
        countryCodeController: countryCodeController,
        phoneController: phoneController,
        emailAddressController: emailAddressController,
        faceIdEnabled: faceIdEnabled,
        touchIdEnabled: touchIdEnabled,
        onNext: () {setState(() {activeStep++;});},
      ),

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
    photoProfileController.dispose();
    photoProfilePathController.dispose();
    photoProfileNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    countryCodeController.dispose();
    phoneController.dispose();
    emailAddressController.dispose();
    faceIdEnabled.dispose();
    touchIdEnabled.dispose();

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
            SignupStepper(
              currentStep: activeStep,
              onStepTap: (step) {if (step < activeStep) {setState(() {activeStep = step;});}},
            ),
            Expanded(child: screens[activeStep])
          ],
        ),
      ),
    );
  }
}