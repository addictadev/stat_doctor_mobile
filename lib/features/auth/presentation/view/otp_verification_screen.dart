import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/images_preview/app_assets.dart';
import 'package:stat_doctor/core/images_preview/custom_asset_img.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/responsive_utils.dart';
import 'package:stat_doctor/core/utils/styles/font_utils.dart';
import 'package:stat_doctor/core/widgets/custom_pin_code_text_field.dart';
import 'package:stat_doctor/core/widgets/primary_button.dart';
import 'package:stat_doctor/core/navigation_services/navigation_manager.dart';
import 'package:stat_doctor/features/main_screens/presentation/view/main_navigation_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  
  const OtpVerificationScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  String _otpCode = '';
  bool _isLoading = false;
  bool _isResendLoading = false;
  int _resendTimer = 0;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }


  void _startResendTimer() {
    _resendTimer = 30; // 30 seconds countdown
    _updateTimer();
  }

  void _updateTimer() {
    if (_resendTimer > 0) {
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            _resendTimer--;
          });
          _updateTimer();
        }
      });
    }
  }

  void _onOtpChanged(String otp) {
    setState(() {
      _otpCode = otp;
    });
  }

  void _onOtpCompleted(String otp) {
    setState(() {
      _otpCode = otp;
    });
    // Auto-verify when OTP is complete
    _onVerifyPressed();
  }

  void _onVerifyPressed() async {
    if (_otpCode.length != 4) {
      _showErrorSnackBar("Please enter a valid 4-digit OTP");
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    // Navigate to next screen (e.g., home or profile setup)
    NavigationManager.navigateToAndFinish(const MainNavigationScreen());
    _showSuccessSnackBar("OTP verified successfully!");
  }

  void _onResendPressed() async {
    if (_resendTimer > 0) return;

    setState(() {
      _isResendLoading = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isResendLoading = false;
    });

    _startResendTimer();
    _showSuccessSnackBar("OTP sent successfully!");
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Iconsax.arrow_left_2,
            color: AppColors.textPrimary,
            size: 25,
          ),
          onPressed: () => NavigationManager.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 
                   MediaQuery.of(context).padding.top - 
                   kToolbarHeight,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveUtils.getResponsivePadding(context),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2.h),
                        
                        // Header with Logo and ECG Pattern
                        _buildHeader(),
                        
                        SizedBox(height: 1.h),
                        
                        // Title and Instructions
                        _buildTitleSection(),
                        
                        SizedBox(height: 4.h),
                        
                        // OTP Input Fields
                        _buildOtpSection(),
                        
                        SizedBox(height: 1.h),
                        
                        // Resend Section
                        _buildResendSection(),
                _buildVerifyButton(),

                      ],
                    ),
                  ),
                ),
                
                // Verify Button
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      width: 100.w,
      child: Stack(
        children: [
          // ECG Pattern Background
          Positioned(
            top: -4.h,
            right: 0.w,
            left: 0,
            child: CustomImageAsset(
              assetName: AppAssets.authBackground,
              width: 100.w,
              height: 20.h,
            ),
          ),
          
          // StatDoctor Logo
          CustomImageAsset(
            assetName: AppAssets.appIcon,
            width: 45.w,
            height: 12.h,
          ),
        ],
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          "otp_verification".tr(),
          style: TextStyle(
            fontSize: FontSizes.s22,
            fontWeight: AppFont.bold,
            color: AppColors.textPrimary,
            height: 1.2,
          ),
        ),
        
        SizedBox(height: 1.h),
        
        // Instructions
        Text(
          "enter_verification_code".tr(),
          style: TextStyle(
            fontSize: FontSizes.s16,
            fontWeight: AppFont.regular,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
        
     
      ],
    );
  }

  Widget _buildOtpSection() {
    return CustomPinCodeTextField(
      context: context,
      controller: _otpController,
      onChanged: _onOtpChanged,
      oncomplete: _onOtpCompleted,
      textStyle: TextStyle(
        fontSize: FontSizes.s20,
        fontWeight: AppFont.bold,
        color: AppColors.textPrimary,
      ),
      hintStyle: TextStyle(
        fontSize: FontSizes.s20,
        fontWeight: AppFont.regular,
        color: AppColors.textSecondary,
      ),
    );
  }

  Widget _buildResendSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "didnt_receive_code".tr(),
          style: TextStyle(
            fontSize: FontSizes.s14,
            fontWeight: AppFont.regular,
            color: AppColors.textSecondary,
          ),
        ),
        
        SizedBox(width: 1.w),
        
        GestureDetector(
          onTap: _resendTimer == 0 ? _onResendPressed : null,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
            child: _isResendLoading
                ? SizedBox(
                    width: 4.w,
                    height: 4.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                    ),
                  )
                : Text(
                    _resendTimer > 0 
                        ? "${"resend_in".tr()} ${_resendTimer}s"
                        : "resend".tr(),
                    style: TextStyle(
                      fontSize: FontSizes.s14,
                      fontWeight: AppFont.semiBold,
                      color: _resendTimer > 0 
                          ? AppColors.textSecondary 
                          : AppColors.primary,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildVerifyButton() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.getResponsivePadding(context),
        vertical: 2.h,
      ),
      child: PrimaryButton(
        text: "verify".tr(),
        onPressed: _onVerifyPressed,
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
    );
  }
}
