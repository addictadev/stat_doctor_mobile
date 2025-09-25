import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../theme/app_colors.dart';

class CustomBottomSheet extends StatefulWidget {
  final String title;
  final List<String> options;
  final String? selectedOption;
  final Function(String) onOptionSelected;
  final VoidCallback onClose;

  const CustomBottomSheet({
    super.key,
    required this.title,
    required this.options,
    this.selectedOption,
    required this.onOptionSelected,
    required this.onClose,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  String? _currentSelection;

  @override
  void initState() {
    super.initState();
    _currentSelection = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: .4.h,
            margin: EdgeInsets.symmetric(vertical: 2.w),
            width: 15.w,
            color: Colors.grey[200],
          ),
          // Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onClose,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.close,
                      color: Colors.grey[600],
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Options list
          Container(
            constraints: BoxConstraints(
              maxHeight: 50.h, // Maximum height for the options list
            ),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 2.h),
              itemCount: widget.options.length,
              itemBuilder: (context, index) {
                final option = widget.options[index];
                final isSelected = _currentSelection == option;
                
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.5.h),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        setState(() {
                          _currentSelection = option;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: isSelected ? AppColors.primary : Colors.grey[200]!,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                option,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                                  color: isSelected ? AppColors.primary : AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          
          // Select button
          Container(
            padding: EdgeInsets.all(4.w),
            child: Container(
              margin: EdgeInsets.only(bottom: 4.w),
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
                    if (_currentSelection != null) {
                      widget.onOptionSelected(_currentSelection!);
                    }
                    widget.onClose();
                  },
                  child: Center(
                    child: Text(
                      'Select',
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
          ),
        ],
      ),
    );
  }

  static void show({
    required BuildContext context,
    required String title,
    required List<String> options,
    String? selectedOption,
    required Function(String) onOptionSelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomBottomSheet(
        title: title,
        options: options,
        selectedOption: selectedOption,
        onOptionSelected: onOptionSelected,
        onClose: () => Navigator.pop(context),
      ),
    );
  }
}