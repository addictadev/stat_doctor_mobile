import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/images_preview/app_assets.dart';
import 'package:stat_doctor/core/images_preview/custom_asset_img.dart';
import 'package:stat_doctor/core/images_preview/custom_svg_img.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/responsive_utils.dart';
import 'package:stat_doctor/core/utils/styles/font_utils.dart';
import 'package:stat_doctor/core/widgets/custom_textform_field.dart';
import 'package:stat_doctor/core/widgets/primary_button.dart';
import 'package:stat_doctor/core/navigation_services/navigation_manager.dart';
import 'package:stat_doctor/features/auth/presentation/view/registration/presentation/view/registration_screen.dart';
import 'otp_verification_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileController = TextEditingController();
  final FocusNode _mobileFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;



  @override
  void dispose() {
    _mobileController.dispose();
    _mobileFocusNode.dispose();
    super.dispose();
  }

  void _onContinuePressed() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // Navigate to OTP verification screen
      NavigationManager.navigateTo(
        OtpVerificationScreen(phoneNumber: _mobileController.text),
      );
    }
  }

  void _onFaceIdPressed() {
    // Handle FaceID login
    // NavigationManager.navigateTo(FaceIdLoginScreen());
  }

  void _onPrivacyPolicyPressed() {
    // Navigate to privacy policy
    // NavigationManager.navigateTo(PrivacyPolicyScreen());
  }

  void _onTermsOfUsePressed() {
    // Navigate to terms of use
    // NavigationManager.navigateTo(TermsOfUseScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: ResponsiveUtils.getResponsivePadding(context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 3.h),
                        
                        // Header with Logo and ECG Pattern
                        _buildHeader(),
                        
                        
                        // Welcome Section
                        _buildWelcomeSection(),
                        
                        SizedBox(height: 4.h),
                        
                        // Form Section
                        _buildFormSection(),
                        
                        SizedBox(height: 3.h),
                        
                        // FaceID Button
                        _buildFaceIdButton(),
                        
                        SizedBox(height: 4.h),
                        
                        // Register Button
                        // _buildRegisterButton(),
                      ],
                    ),
                  ),
                ),
                
                // Footer
                _buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
Widget _buildRegisterButton() {
  return 
  InkWell(
    onTap: () {
      NavigationManager.navigateTo(const RegistrationScreen());
    },
    child: 
  
   Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
   Text('Don’t have an account?',style: TextStyle(
    fontSize: FontSizes.s16,
    fontWeight: AppFont.regular,
   ),),
   SizedBox(width: 1.w),
    Text(
      "Sign up".tr(),
      style: TextStyle(
        fontSize: FontSizes.s16,
        fontWeight: AppFont.semiBold,
        color: AppColors.primary,
      ),
    ),
  ],));
}

  Widget _buildHeader() {
    return
    SizedBox(
      width: 100.w,
      // height: 20.h,
      child: 
     Stack(
      children: [
        // ECG Pattern Background
        Positioned(
          top: -4.h,
          right: 0.w,
          left: 0,
          child:CustomImageAsset(assetName: AppAssets.authBackground,width: 100.w,height: 20.h,)
        ),
        
     CustomImageAsset(assetName: AppAssets.appIcon,width: 45.w,height: 12.h,) 
     
      ],
    ));
  }

  Widget _buildWelcomeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Welcome Title
        Text(
          "welcome_to_statdoctor".tr(),
          style: TextStyle(
            fontSize: FontSizes.s22,
            fontWeight: AppFont.bold,
            color: AppColors.textPrimary,
            height: 1.2,
          ),
        ),
        
        SizedBox(height: 1.h),
        
        // Tagline
        Text(
          "no_agency_less_problems".tr(),
          style: TextStyle(
            fontSize: FontSizes.s16,
            fontWeight: AppFont.medium,
            color: AppColors.textSecondary,
          ),
        ),
        
        SizedBox(height: 0.h),
        
        // Instruction
        Text(
          "begin_creating_profile".tr(),
          style: TextStyle(
            fontSize: FontSizes.s14,
            fontWeight: AppFont.regular,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildFormSection() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mobile Number Label
          Text(
            "mobile_number".tr(),
            style: TextStyle(
              fontSize: FontSizes.s14,
              fontWeight: AppFont.medium,
              color: AppColors.textSecondary,
            ),
          ),
          
          SizedBox(height: 1.h),
          
          // Mobile Number Input
          CustomTextFormField(
            controller: _mobileController,
            focusNode: _mobileFocusNode,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            hint: "enter your mobile number",
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(15),
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your mobile number";
              }
              if (value.length < 10) {
                return "Please enter a valid mobile number";
              }
              return null;
            },
            borderRadius: 15,
            contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            textStyle: TextStyle(
              fontSize: FontSizes.s16,
              fontWeight: AppFont.medium,
              color: AppColors.textPrimary,
            ),
          ),
          
          SizedBox(height: 3.h),
          
          // Continue Button
          PrimaryButton(
            text: "continue".tr(),
            onPressed: _onContinuePressed,
            isLoading: _isLoading,
            height: 6.h,
            borderRadius: 30,
            color: AppColors.primary,
            textStyle: TextStyle(
              fontSize: FontSizes.s16,
              fontWeight: AppFont.semiBold,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFaceIdButton() {
    return Container(
      width: double.infinity,
      height: 6.h,
      decoration: BoxDecoration(
        color: const Color(0xFFE8E8FF), // Light purple background
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppColors.borderLight,
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: _onFaceIdPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // FaceID Icon
              CustomSvgImage(assetName: AppAssets.faceId,width: 6.w,height: 6.w,),
              
              SizedBox(width: 3.w),
              
              // FaceID Text
              Text(
                "login_with_faceid".tr(),
                style: TextStyle(
                  fontSize: FontSizes.s16,
                  fontWeight: AppFont.medium,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ResponsiveUtils.getResponsivePadding(context), vertical: 6.h),
      child: Column(
        children: [
          // Agreement Text
          Text(
            "by_continuing_agree".tr(),
            style: TextStyle(
              fontSize: FontSizes.s16,
              fontWeight: AppFont.regular,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          
          SizedBox(height: 0.1.h),
          
          // Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _onPrivacyPolicyPressed,
                child: Text(
                  "privacy_policy".tr(),
                  style: TextStyle(
                    fontSize: FontSizes.s16,
                    fontWeight: AppFont.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
              
              Text(
                " & ",
                style: TextStyle(
                  fontSize: FontSizes.s16,
                  fontWeight: AppFont.regular,
                  color: AppColors.textSecondary,
                ),
              ),
              
              GestureDetector(
                onTap: _onTermsOfUsePressed,
                child: Text(
                  "terms_of_use".tr(),
                  style: TextStyle(
                    fontSize: FontSizes.s16,
                    fontWeight: AppFont.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom painter for ECG pattern
class EcgPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.borderLight.withOpacity(0.3)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path();
    
    // Create ECG-like pattern
    double x = 0;
    double y = size.height / 2;
    
    while (x < size.width) {
      // Baseline
      path.moveTo(x, y);
      path.lineTo(x + 20, y);
      x += 20;
      
      // Small spike
      path.moveTo(x, y);
      path.lineTo(x, y - 5);
      path.lineTo(x + 5, y - 5);
      path.lineTo(x + 5, y);
      x += 5;
      
      // Continue baseline
      path.moveTo(x, y);
      path.lineTo(x + 15, y);
      x += 15;
      
      // Big spike
      path.moveTo(x, y);
      path.lineTo(x, y - 15);
      path.lineTo(x + 8, y - 15);
      path.lineTo(x + 8, y + 5);
      path.lineTo(x + 12, y + 5);
      path.lineTo(x + 12, y);
      x += 12;
    }
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
