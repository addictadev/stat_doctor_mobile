import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/images_preview/app_assets.dart';
import 'package:stat_doctor/core/theme/app_colors.dart' show AppColors;
import 'package:stat_doctor/core/navigation_services/navigation_manager.dart';
import '../../../auth/presentation/view/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: "Finding your job in",
      subtitle: "just a few clicks",
      description: "Discover amazing job opportunities tailored just for you",
    ),
    OnboardingPage(
      title: "Smart Job Matching",
      subtitle: "Hospital recommendations",
      description: "Get personalized job suggestions based on your skills and preferences",
    ),
    OnboardingPage(
      title: "Easy Application",
      subtitle: "One-click apply",
      description: "Apply to multiple jobs with just one click using your profile",
    ),
    OnboardingPage(
      title: "Track Progress",
      subtitle: "Real-time updates",
      description: "Stay updated with your application status and interview schedules",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _onGetStartedPressed();
    }
  }

  void _onSkipPressed() {
    _onGetStartedPressed();
  }

  void _onGetStartedPressed() {
    NavigationManager.navigateToAndFinish(const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF8F9FA),
              Color(0xFFF0F8FF),
              Color(0xFFF8F9FA),
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    return _buildOnboardingPage(_pages[index]);
                  },
                ),
              ),
              _buildBottomNavigation(),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(OnboardingPage page) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.h),
          
          // Onboarding Image
          _buildOnboardingImage(),
          
          SizedBox(height: 4.h),
          
          // Main Text
          _buildMainText(page),
          
          // SizedBox(height: 2.h),
          
          // Description
          // _buildDescription(page),
        ],
      ),
    );
  }

  Widget _buildOnboardingImage() {
    return SizedBox(
      width: 75.w,
      height: 55.h,
      child: Image.asset(
        AppAssets.onboardingPattern,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildMainText(OnboardingPage page) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1A1A1A),
          height: 1.2,
        ),
        children: [
          TextSpan(text: page.title),
          TextSpan(
            text: "\n${page.subtitle}",
            style: TextStyle(
              color: AppColors.primary, // Teal color
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildBottomNavigation() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Skip Button
          TextButton(
            onPressed: _onSkipPressed,
            child: Text(
              "skip",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          
          // Page Indicators
          Row(
            children: List.generate(
              _pages.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 3),
                width:  12,
                height: 12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: _currentPage == index
                      ? AppColors.primary
                      : const Color(0xFFE5E7EB),
                ),
              ),
            ),
          ),
          
          // Next Button
          GestureDetector(
            onTap: _onNextPressed,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                Iconsax.arrow_right_3,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage {
  final String title;
  final String subtitle;
  final String description;

  OnboardingPage({
    required this.title,
    required this.subtitle,
    required this.description,
  });
}