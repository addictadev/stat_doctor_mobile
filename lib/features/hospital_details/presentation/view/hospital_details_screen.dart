import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/images_preview/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/navigation_services/navigation_manager.dart';
import '../../../reviews/presentation/view/view_all_reviews_screen.dart';
import '../../../reviews/presentation/widgets/review_card.dart';

class HospitalDetailsScreen extends StatefulWidget {
  final String hospitalName;
  final String hospitalAddress;
  final String distance;
  final String website;
  final String description;
  final List<Map<String, dynamic>> shifts;
  final List<Map<String, dynamic>> reviews;

  const HospitalDetailsScreen({
    super.key,
    required this.hospitalName,
    required this.hospitalAddress,
    required this.distance,
    required this.website,
    required this.description,
    required this.shifts,
    required this.reviews,
  });

  @override
  State<HospitalDetailsScreen> createState() => _HospitalDetailsScreenState();
}

class _HospitalDetailsScreenState extends State<HospitalDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          _onScroll(scrollInfo.metrics.pixels);
          return false;
        },
        child: CustomScrollView(
          slivers: [
            _buildSliverAppBar(),
            SliverToBoxAdapter(
              child: _buildHospitalInfoCard(),
            ),
            SliverToBoxAdapter(
              child: _buildTabBar(),
            ),
            SliverFillRemaining(
              child: _buildTabContent(),
            ),
          ],
        ),
      ),
    );
  }

  void _onScroll(double offset) {
    setState(() {
      _isExpanded = offset < 20.h; // Adjust threshold as needed
    });
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 30.h,
      floating: false,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: _isExpanded ?  null:Text(
        widget.hospitalName,
        style: TextStyles.textViewBold16.copyWith(
          color: AppColors.black,
        ),
      ),
      centerTitle:  true,
      leading: Container(
        margin: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          icon: Icon(
            Iconsax.arrow_left_2,
            color: AppColors.textPrimary,
            size: 5.w,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        ),
      flexibleSpace: FlexibleSpaceBar(
   
        centerTitle: true,
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Hospital building image
            Image.asset(
              AppAssets.homeBackground,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primary.withOpacity(0.8),
                        AppColors.primaryLight.withOpacity(0.6),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Iconsax.hospital,
                      color: Colors.white,
                      size: 20.w,
                    ),
                  ),
                );
              },
            ),
            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
   
   
    );
  }

  Widget _buildHospitalInfoCard() {
    return Container(
     
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Center(child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          width: 15.w,height: 1.w,decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.5),
            borderRadius: BorderRadius.circular(12),
          ),)),
          // Hospital name
          SizedBox(height: 1.h),
          
          Text(
            widget.hospitalName,
            style: TextStyles.textViewBold18.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 1.h),
          // Address with map pin
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Iconsax.location,
                color: AppColors.textSecondary,
                size: 4.w,
              ),
              SizedBox(width: 1.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.hospitalAddress,
                    style: TextStyles.textViewRegular14.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                       Text(
            '${widget.distance} from current location',
            style: TextStyles.textViewSemiBold14.copyWith(
              color: AppColors.primary,
            ),
          ),
                ],
              )
          
            ],
          ),
          // Distance
     
          SizedBox(height: 1.5.h),
          // Website button
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 100.w,
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(60),
                border: Border.all(
                  color: AppColors.primary,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.website,
                    style: TextStyles.textViewSemiBold14.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(width: 1.w),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primary,
                    size: 3.5.w,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(60),
      ),
      child: TabBar(
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: AppColors.success.withOpacity(0.1),
            
          borderRadius: BorderRadius.circular(60),
          border: Border.all(
            color:  AppColors.success,
               
            width: 1,
          ),
        ),
        
        labelColor: 
             AppColors.success,
          
        unselectedLabelColor: AppColors.textSecondary,
        dividerColor: Colors.transparent,
        
        labelStyle: TextStyles.textViewSemiBold14,
        indicatorColor: Colors.transparent,
        indicatorWeight: 0,
        indicatorPadding: EdgeInsets.zero, 
        unselectedLabelStyle: TextStyles.textViewRegular14,

        tabs: const [
          Tab(text: 'Description'),
          Tab(text: 'Hospital Shifts'),
          Tab(text: 'Reviews'),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    return TabBarView(
      controller: _tabController,
      children: [
        _buildDescriptionTab(),
        _buildHospitalShiftsTab(),
        _buildReviewsTab(),
      ],
    );
  }

  Widget _buildDescriptionTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(4.w),
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowLight,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: TextStyles.textViewBold18.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  widget.description,
                  style: TextStyles.textViewRegular14.copyWith(
                    color: AppColors.textPrimary,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                'assets/images/hom.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }

  Widget _buildHospitalShiftsTab() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    
          
             
          
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowLight,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
      Text(
                  'All hospital shifts',
                  style: TextStyles.textViewBold18.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 1.h),
                  ...widget.shifts.map((shift) => _buildShiftCard(shift, widget.shifts.indexOf(shift))),
                 ],
              ),
            ),
              SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }

  Widget _buildShiftCard(Map<String, dynamic> shift, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: index < widget.shifts.length - 1 ? 2.h : 0),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
   border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Row(children: [
               Text(
                'Rate: ',
                style: TextStyles.textViewBold14.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
               Text(
                shift['rate'] ?? '\$120 / hr',
                style: TextStyles.textViewBold18.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
             ],),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                decoration: BoxDecoration(
                  color: AppColors.scaffoldBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Group (6)',
                  style: TextStyles.textViewRegular12.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
         Container(padding: EdgeInsets.all(4.w),decoration: BoxDecoration(
          color: AppColors.greenOverlay,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
         ),child: Column(
          children: [ Row(
            children: [
              Icon(
                Iconsax.calendar_1,
                color: AppColors.textSecondary,
                size: 4.w,
              ),
              SizedBox(width: 2.w),
              Text(
                shift['date'] ?? 'Mon, 26 Sep 2022',
                style: TextStyles.textViewRegular14.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            children: [
              Icon(
                Iconsax.clock,
                color: AppColors.textSecondary,
                size: 4.w,
              ),
              SizedBox(width: 2.w),
              Text(
                shift['time'] ?? '10:30 pm - 8:30 am (8 hrs)',
                style: TextStyles.textViewRegular14.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),],
         ),),
          SizedBox(height: 1.h),
              Text(
            '• Min. skill level VMO/SMO\n• Specialty Emergency Medicine\n• Support level Senior on site',
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
              height: .5.w,
            ),
          ),

SizedBox(height: .5.h),
Divider(height: 1.h,color: Colors.grey.withOpacity(0.1),), 
SizedBox(height: .5.h),
         Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProvisionButton(
                icon: Icons.close,
                text: 'Accommodation',
                isProvided: false,
              ),
              _buildProvisionButton(
                icon: Icons.check,
                text: 'Travel',
                isProvided: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProvisionButton({
    required IconData icon,
    required String text,
    required bool isProvided,
  }) {
    return Container(
      width: 37.w,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: isProvided ? AppColors.primary : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(60),
        border: Border.all(
          color: isProvided ? AppColors.primary : Colors.transparent,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isProvided ? Colors.greenAccent : AppColors.error,
            size: 4.w,
          ),
          SizedBox(width: 1.w),
          Text(
            text,
            style: TextStyles.textViewSemiBold16.copyWith(
              color: isProvided ? Colors.white : AppColors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsTab() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowLight,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reviews (${widget.reviews.length})',
                        style: TextStyles.textViewBold18.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      
                      GestureDetector(
                        onTap: () {
                        NavigationManager.navigateTo(ViewAllReviewsScreen(
                                reviews: widget.reviews,
                                hospitalName: widget.hospitalName,
                                averageRating: 4.1, // You can calculate this from reviews
                                totalReviews: widget.reviews.length,
                              ),
                          
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Text(
                            'View All',
                            style: TextStyles.textViewSemiBold14.copyWith(
                              color: AppColors.primary,
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    
                    ],
                  ),
                  SizedBox(height: 1.h),
                  ...widget.reviews.asMap().entries.map((entry) {
                    int index = entry.key;
                    Map<String, dynamic> review = entry.value;
                    return ReviewCard(
                      review: review,
                      isLast: index == widget.reviews.length - 1,
                    );
                  }),
                ],
              ),
            ),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }

}
