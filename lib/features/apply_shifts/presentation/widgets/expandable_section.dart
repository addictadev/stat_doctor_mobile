import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';

class ExpandableSection extends StatefulWidget {
  final String title;
  final Widget child;
  final bool initiallyExpanded;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  const ExpandableSection({
    super.key,
    required this.title,
    required this.child,
    this.initiallyExpanded = true,
    this.padding,
    this.backgroundColor,
  });

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  bool _isExpanded;

  _ExpandableSectionState() : _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    if (_isExpanded) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
     
      ),
      child: Column(
        children: [
          // Header
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _toggleExpanded,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: TextStyles.textViewBold16.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _expandAnimation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _expandAnimation.value * 3.14159, // 180 degrees
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.textSecondary,
                            size: 5.w,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Expandable content
          SizeTransition(
            sizeFactor: _expandAnimation,
            child: Container(
              width: double.infinity,
              padding: widget.padding ?? EdgeInsets.only(
                left: 4.w,
                right: 4.w,
                bottom: 2.w,
              ),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
