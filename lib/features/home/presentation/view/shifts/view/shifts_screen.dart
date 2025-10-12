import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/utils/styles/styles.dart';
import '../../../../../../core/images_preview/app_assets.dart';
import '../../../../../../core/navigation_services/navigation_manager.dart';
import '../widgets/filter_chip_widget.dart';
import '../widgets/shift_card_widget.dart';
import '../widgets/upcoming_past_toggle.dart';
import '../../../../../shift_details/presentation/view/shift_details_screen.dart';

class ShiftsScreen extends StatefulWidget {
  const ShiftsScreen({super.key});

  @override
  State<ShiftsScreen> createState() => _ShiftsScreenState();
}

class _ShiftsScreenState extends State<ShiftsScreen> {
  String _selectedFilter = 'All';
  bool _isUpcoming = true;

  final List<Map<String, dynamic>> _shifts = [
    {
      'id': '1',
      'hospitalName': "St Vincent's Public Hospital Melbourne",
      'hospitalImage': 'https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?w=400',
      'distance': '3.6km',
      'date': 'Mon, 26 Sep 2022',
      'time': '10:30 pm - 8:30 am (8 hrs)',
      'rate': '\$120/hr',
      'status': 'Applied',
      'isGroup': true,
      'groupSize': 6,
      'hasAccommodation': false,
      'hasTravel': true,
      'requirements': [
        'Min. skill level VMO/SMO',
        'Specialty Emergency Medicine',
        'Support level Senior on site'
      ],
    },
    {
      'id': '2',
      'hospitalName': "Royal Melbourne Hospital",
      'hospitalImage': 'https://images.unsplash.com/photo-1582750433449-648ed127bb54?w=400',
      'distance': '2.1km',
      'date': 'Tue, 27 Sep 2022',
      'time': '6:00 am - 2:00 pm (8 hrs)',
      'rate': '\$150/hr',
      'status': 'Accepted',
      'isGroup': false,
      'groupSize': 1,
      'hasAccommodation': true,
      'hasTravel': false,
      'requirements': [
        'Min. skill level SMO',
        'Specialty General Medicine',
        'Support level Junior on site'
      ],
    },
    {
      'id': '3',
      'hospitalName': "Alfred Hospital",
      'hospitalImage': 'https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?w=400',
      'distance': '4.2km',
      'date': 'Wed, 28 Sep 2022',
      'time': '2:00 pm - 10:00 pm (8 hrs)',
      'rate': '\$135/hr',
      'status': 'Applied',
      'isGroup': true,
      'groupSize': 4,
      'hasAccommodation': true,
      'hasTravel': true,
      'requirements': [
        'Min. skill level VMO',
        'Specialty Cardiology',
        'Support level Senior on site'
      ],
    },
  ];

  List<Map<String, dynamic>> get _filteredShifts {
    if (_selectedFilter == 'All') return _shifts;
    return _shifts.where((shift) => shift['status'] == _selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(
            child: _buildFilterSection(),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final shift = _filteredShifts[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: ShiftCardWidget(
                      shift: shift,
                      onTap: () => _navigateToShiftDetails(shift),
                    ),
                  );
                },
                childCount: _filteredShifts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 12.h,
      floating: false,
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
       image: DecorationImage(
        image: AssetImage(AppAssets.homeBackground),
        fit: BoxFit.cover,
        
       ),
       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
          ),
          child: Stack(
            children: [
              // Decorative medical icon
              Positioned(
                top: 2.h,
                right: 4.w,
                child: Opacity(
                  opacity: 0.1,
                  child: Icon(
                    Iconsax.heart,
                    size: 15.w,
                    color: Colors.white,
                  ),
                ),
              ),
              // Content
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 2.h,
                  left: 4.w,
                  right: 4.w,
                  bottom: 2.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'shifts'.tr(),
                      style: TextStyles.textViewBold20.copyWith(
                        color: Colors.white,
                      ),
                    ),

                    UpcomingPastToggle(
                      isUpcoming: _isUpcoming,
                      onToggle: (value) {
                        setState(() {
                          _isUpcoming = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FilterChipWidget(
            label: 'All',
            isSelected: _selectedFilter == 'All',
            onTap: () => setState(() => _selectedFilter = 'All'),
          ),
          FilterChipWidget(
            label: 'Applied',
            isSelected: _selectedFilter == 'Applied',
            onTap: () => setState(() => _selectedFilter = 'Applied'),
          ),
          FilterChipWidget(
            label: 'Accepted',
            isSelected: _selectedFilter == 'Accepted',
            onTap: () => setState(() => _selectedFilter = 'Accepted'),
          ),
        ],
      ),
    );
  }

  void _navigateToShiftDetails(Map<String, dynamic> shift) {
    // Convert shift data to ShiftDetailsData format
    final shiftDetailsData = ShiftDetailsData(
      hospitalName: shift['hospitalName'],
      hospitalLocation: _extractLocation(shift['hospitalName']),
      address: _generateAddress(shift['hospitalName']),
      distance: shift['distance'],
      date: shift['date'],
      time: shift['time'],
      rate: shift['rate'],
      description: _generateDescription(shift['hospitalName']),
      skillLevel: _extractSkillLevel(shift['requirements']),
      specialty: _extractSpecialty(shift['requirements']),
      supportLevel: _extractSupportLevel(shift['requirements']),
      travelProvisions: shift['hasTravel'] ? '\$0.72/km, no flights included' : 'Not included',
      accommodationProvisions: shift['hasAccommodation'] ? 'Included' : 'Not included',
      contactName: 'Megan Carpenter',
      contactPhone: '(03) 9529 1234',
      contactEmail: 'info@gmail.com.au',
      similarShifts: _generateSimilarShifts(),
    );

    NavigationManager.navigateTo(
      ShiftDetailsScreen(shiftData: shiftDetailsData),
    );
  }

  String _extractLocation(String hospitalName) {
    if (hospitalName.contains('Melbourne')) return 'Melbourne';
    if (hospitalName.contains('Sydney')) return 'Sydney';
    if (hospitalName.contains('Brisbane')) return 'Brisbane';
    return 'Melbourne';
  }

  String _generateAddress(String hospitalName) {
    if (hospitalName.contains("St Vincent's")) {
      return '300 Grattan St, Parkville VIC 3050';
    }
    if (hospitalName.contains("Royal Melbourne")) {
      return '300 Grattan St, Parkville VIC 3050';
    }
    if (hospitalName.contains("Alfred")) {
      return '55 Commercial Rd, Melbourne VIC 3004';
    }
    return '123 Hospital St, Melbourne VIC 3000';
  }

  String _generateDescription(String hospitalName) {
    if (hospitalName.contains("St Vincent's")) {
      return "St Vincent's is a 152-bed private surgical hospital in Melbourne. It has a reputation for excellence in orthopaedic surgery, including joint replacements and sports injuries management. The hospital features 11 operating theatres, a day surgery centre, and advanced imaging services.";
    }
    if (hospitalName.contains("Royal Melbourne")) {
      return "Royal Melbourne Hospital is one of Australia's leading public hospitals, providing comprehensive healthcare services. It's known for its excellence in emergency medicine, cardiology, and trauma care with state-of-the-art facilities and experienced medical staff.";
    }
    if (hospitalName.contains("Alfred")) {
      return "The Alfred Hospital is a major teaching hospital in Melbourne, renowned for its trauma and emergency services. It provides specialized care in cardiology, neurology, and critical care with advanced medical technology and expert healthcare professionals.";
    }
    return "This hospital is known for its excellent medical services and state-of-the-art facilities. It provides comprehensive healthcare services with a focus on patient care and medical excellence.";
  }

  String _extractSkillLevel(List<String> requirements) {
    for (String req in requirements) {
      if (req.contains('VMO')) return 'VMO';
      if (req.contains('SMO')) return 'SMO';
    }
    return 'VMO';
  }

  String _extractSpecialty(List<String> requirements) {
    for (String req in requirements) {
      if (req.contains('Emergency Medicine')) return 'Emergency Medicine';
      if (req.contains('General Medicine')) return 'General Medicine';
      if (req.contains('Cardiology')) return 'Cardiology';
    }
    return 'Emergency Medicine';
  }

  String _extractSupportLevel(List<String> requirements) {
    for (String req in requirements) {
      if (req.contains('Senior')) return 'Senior on site';
      if (req.contains('Junior')) return 'Junior on site';
    }
    return 'Senior on site';
  }

  List<Map<String, String>> _generateSimilarShifts() {
    return [
      {'date': 'Wed, 01 Nov 2022', 'rate': '\$200/hr'},
      {'date': 'Wed, 01 Nov 2022', 'rate': '\$250/hr'},
      {'date': 'Wed, 01 Nov 2022', 'rate': '\$300/hr'},
      {'date': 'Wed, 01 Nov 2022', 'rate': '\$350/hr'},
    ];
  }
}
