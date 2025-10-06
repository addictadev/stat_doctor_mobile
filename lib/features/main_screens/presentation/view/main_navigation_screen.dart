import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../../../core/theme/app_colors.dart';
import 'home_screen.dart';
import 'notifications_screen.dart';
import 'account_screen.dart';
import '../../../home/presentation/view/shifts/view/shifts_screen.dart' as new_shifts;

class MainNavigationScreen extends StatefulWidget {
  final int initialIndex;
  
  const MainNavigationScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int _currentIndex;
  late PageController _pageController;

  final List<NavigationItem> _navigationItems = [
    NavigationItem(
      icon: Iconsax.home,
      label: 'home',
      screen: const HomeScreen(),
    ),
    NavigationItem(
      icon: Icons.work,
      label: 'shifts',
      screen: const new_shifts.ShiftsScreen(),
    ),
    NavigationItem(
      icon: Iconsax.notification,
      label: 'notifications',
      screen: const NotificationsScreen(),
    ),
    NavigationItem(
      icon: Iconsax.user,
      label: 'account',
      screen: const AccountScreen(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _navigationItems.map((item) => item.screen).toList(),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      // height: 9.8.h,
      padding: EdgeInsets.only(top: 2.h),
      margin: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 2.5.h),
      decoration: BoxDecoration(
        color:  Colors.transparent,
        borderRadius: BorderRadius.circular(90),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(90),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor:Color(0xFF2C2C2E).withOpacity(0.95),
          elevation: 0,
          
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 13.sp,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 13.sp,
          ),
          items: _navigationItems.map((item) {
            return BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 1.w,top: 3.w),
                child: Icon(
                  item.icon,
                  size:5.w,
                ),
              ),
              label: item.label.tr(),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class NavigationItem {
  final IconData icon;
  final String label;
  final Widget screen;

  NavigationItem({
    required this.icon,
    required this.label,
    required this.screen,
  });
}
