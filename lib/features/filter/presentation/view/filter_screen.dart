import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/widgets/custom_bottom_sheet.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isLocationEnabled = false; // This should be checked from location service
  String _selectedShift = 'Evening';
  double _distanceValue = 60.0;
  String? _selectedSpecialty;
  String? _selectedSkillLevel;
  DateTime _selectedDate = DateTime.now();

  // Options lists
  final List<String> _specialtyOptions = [
    'Emergency Medicine',
    'Cardiology',
    'Surgery',
    'Pediatrics',
    'Orthopedics',
    'Neurology',
    'Dermatology',
    'Psychiatry',
    'Radiology',
    'Anesthesiology',
  ];

  final List<String> _skillLevelOptions = [
    'PGY2',
    'PGY3+',
    'PGY4+',
    'Registrar',
    'VMO/SMO',
    'Consultant',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: _isLocationEnabled ? _buildFilterContent() : _buildLocationPermissionWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(4.w),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.w), bottomRight: Radius.circular(8.w)),
      //   image: DecorationImage(
      //     image: AssetImage(AppAssets.homeBackground),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6.h),
          // Back button and title row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(1.5.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Icon(
                    Iconsax.arrow_left_2,
                    color: AppColors.primary,
                    size: 5.w,
                  ),
                ),
              ),
         
              Text(
                'Filters',
                style: TextStyles.textViewRegular16.copyWith(
                  color: AppColors.black,
                  fontSize: 16.sp,
                ),
              ),     SizedBox(width: 10.w),
            
            ],
          ),
     
       
        ],
      ),
    );
  }

  Widget _buildLocationPermissionWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Location icon
          Container(
            width: 30.w,
            height: 30.w,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Iconsax.location,
              size: 15.w,
              color: Colors.grey[400],
            ),
          ),
          SizedBox(height: 4.h),
          // Title
          Text(
            'Location service needs to be enabled.',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.h),
          // Description
          Text(
            'In order to use the filter features, you need to allow StatDoctor access to your location.',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          // Enable location button
          Container(
            width: double.infinity,
            height: 6.h,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {
                  // Enable location permission
                  setState(() {
                    _isLocationEnabled = true;
                  });
                },
                child: Center(
                  child: Text(
                    'Enable location access',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Available days section
          _buildSectionTitle('Available days'),
          SizedBox(height: 2.h),
          _buildCalendarSection(),
          SizedBox(height: 2.h),
          
          // Available shifts section
          _buildSectionTitle('Available shifts'),
          SizedBox(height: 2.h),
          _buildShiftsSection(),
          SizedBox(height: 2.h),
          
          // Distance section
          _buildDistanceSection(),
          SizedBox(height: 2.h),
          
          // Specialty section
          _buildSectionTitle('Specialty'),
          SizedBox(height: 2.h),
          _buildSpecialtySection(),
          SizedBox(height: 2.h),
          
          // Skill level section
          _buildSectionTitle('Skill level'),
          SizedBox(height: 2.h),
          _buildSkillLevelSection(),
          SizedBox(height: 4.h),
          
          // Action buttons
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildCalendarSection() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Month header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  final prevMonth = DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
                  setState(() {
                    _selectedDate = prevMonth;
                  });
                },
                child: Icon(Iconsax.arrow_left_2, color: AppColors.primary),
              ),
              Text(
                '${_getMonthName(_selectedDate.month)} ${_selectedDate.year}',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  final nextMonth = DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
                  final now = DateTime.now();
                  // Only allow navigation to current month or past months
                  if (nextMonth.year < now.year || 
                      (nextMonth.year == now.year && nextMonth.month <= now.month)) {
                    setState(() {
                      _selectedDate = nextMonth;
                    });
                  }
                },
                child: Icon(
                  Iconsax.arrow_right_3, 
                  color: _canNavigateToNextMonth() ? AppColors.primary : Colors.grey[400],
                ),
              ),
            ],
          ),
          SizedBox(height: 3.h),
          // Days of week
          Row(
            children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                .map((day) => Expanded(
                      child: Center(
                        child: Text(
                          day,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
          SizedBox(height: 2.h),
          // Calendar grid
          _buildCalendarGrid(),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(_selectedDate.year, _selectedDate.month, 1);
    final lastDayOfMonth = DateTime(_selectedDate.year, _selectedDate.month + 1, 0);
    final firstWeekday = firstDayOfMonth.weekday % 7; // Sunday = 0
    final daysInMonth = lastDayOfMonth.day;
    
    // Calculate total cells needed (previous month + current month + next month)
    final totalCells = firstWeekday + daysInMonth;
    final rows = (totalCells / 7).ceil();
    
    return Column(
      children: List.generate(rows, (rowIndex) {
        return Row(
          children: List.generate(7, (colIndex) {
            final cellIndex = rowIndex * 7 + colIndex;
            final dayNumber = cellIndex - firstWeekday + 1;
            
            // Previous month days
            if (cellIndex < firstWeekday) {
              final prevMonth = _selectedDate.month == 1 ? 12 : _selectedDate.month - 1;
              final prevYear = _selectedDate.month == 1 ? _selectedDate.year - 1 : _selectedDate.year;
              final prevMonthLastDay = DateTime(prevYear, prevMonth + 1, 0).day;
              final prevDay = prevMonthLastDay - firstWeekday + cellIndex + 1;
              
              return Expanded(
                child: Container(
                  height: 8.w,
                  margin: EdgeInsets.all(1),
                  child: Center(
                    child: Text(
                      prevDay.toString(),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ),
              );
            }
            
            // Current month days
            if (dayNumber <= daysInMonth) {
              final currentDate = DateTime(_selectedDate.year, _selectedDate.month, dayNumber);
              final isToday = currentDate.year == now.year && 
                             currentDate.month == now.month && 
                             currentDate.day == now.day;
              final isSelected = _selectedDate.year == currentDate.year && 
                               _selectedDate.month == currentDate.month && 
                               _selectedDate.day == currentDate.day;
              final isPast = currentDate.isBefore(DateTime(now.year, now.month, now.day));
              final isFuture = currentDate.isAfter(DateTime(now.year, now.month, now.day));
              
              // Only show past dates and today, hide future dates
              if (isFuture) {
                return Expanded(
                  child: Container(
                    height: 8.w,
                    margin: EdgeInsets.all(1),
                    child: Center(
                      child: Text(
                        '', // Empty for future dates
                        style: TextStyle(
                          color: Colors.transparent,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                );
              }
              
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDate = currentDate;
                    });
                  },
                  child: Container(
                    height: 8.w,
                    width: 8.w,
                    margin: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : 
                             isToday ? AppColors.primary.withOpacity(0.2) : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        dayNumber.toString(),
                        style: TextStyle(
                          color: isSelected ? Colors.white :
                                 isToday ? AppColors.primary :
                                 isPast ? Colors.grey[400] : AppColors.textPrimary,
                          fontWeight: isSelected || isToday ? FontWeight.bold : FontWeight.normal,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
            
            // Next month days - hide them since they are future dates
            return Expanded(
              child: Container(
                height: 8.w,
                width: 8.w,
                margin: EdgeInsets.all(1),
                child: Center(
                  child: Text(
                    '', // Empty for future dates
                    style: TextStyle(
                      color: Colors.transparent,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      }),
    );
  }

  Widget _buildShiftsSection() {
    final shifts = ['Morning', 'Evening', 'Night', 'Bridging'];
    
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3.5,
        crossAxisSpacing: 2.w,
        mainAxisSpacing: 2.h,
      ),
      itemCount: shifts.length,
      itemBuilder: (context, index) {
        final shift = shifts[index];
        final isSelected = _selectedShift == shift;
        
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedShift = shift;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.white,
              borderRadius: BorderRadius.circular(60),
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.grey[300]!,
                width:  1,
              ),
            ),
            child: Center(
              child: Text(
                shift,
                style: TextStyle(
                  color: isSelected ? AppColors.primary : AppColors.textPrimary,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDistanceSection() {
    return  Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Distance from current location',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Up to ${_distanceValue.round()} km',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 1.5.h),
          Slider(
            padding: EdgeInsets.zero,
            value: _distanceValue,
            min: 0,
            max: 100,
            divisions: 10,

            activeColor: AppColors.primary,
            inactiveColor: Colors.grey[300],
            onChanged: (value) {
              setState(() {
                _distanceValue = value;
              });
            },
          ),
        ],
    
    );
  }

  Widget _buildSpecialtySection() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => CustomBottomSheet(
            title: 'Specialty',
            options: _specialtyOptions,
            selectedOption: _selectedSpecialty,
            onOptionSelected: (option) {
              setState(() {
                _selectedSpecialty = option;
              });
            },
            onClose: () => Navigator.pop(context),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                _selectedSpecialty ?? 'Select...',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: _selectedSpecialty != null ? AppColors.textPrimary : Colors.grey[600],
                ),
              ),
            ),
            Icon(
              Iconsax.arrow_down_1,
              color: Colors.grey[600],
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillLevelSection() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => CustomBottomSheet(
            title: 'Skill level',
            options: _skillLevelOptions,
            selectedOption: _selectedSkillLevel,
            onOptionSelected: (option) {
              setState(() {
                _selectedSkillLevel = option;
              });
            },
            onClose: () => Navigator.pop(context),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                _selectedSkillLevel ?? 'Select...',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: _selectedSkillLevel != null ? AppColors.textPrimary : Colors.grey[600],
                ),
              ),
            ),
            Icon(
              Iconsax.arrow_down_1,
              color: Colors.grey[600],
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        // Save button
        Container(
          width: double.infinity,
          height: 6.h,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () {
                // Save filters
                Navigator.pop(context);
              },
              child: Center(
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        // Reset button
        TextButton(
          onPressed: () {
            // Reset all filters
            setState(() {
              _selectedShift = 'Evening';
              _distanceValue = 50.0;
              _selectedSpecialty = null;
              _selectedSkillLevel = null;
              _selectedDate = DateTime.now();
            });
          },
          child: Text(
            'Reset',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }

  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }

  bool _canNavigateToNextMonth() {
    final nextMonth = DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
    final now = DateTime.now();
    return nextMonth.year < now.year || 
           (nextMonth.year == now.year && nextMonth.month <= now.month);
  }
}

