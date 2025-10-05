import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/features/references/data/models/reference_model.dart';

class StatusPill extends StatelessWidget {
  final ReferenceStatus status;

  const StatusPill({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.5.w,
        vertical: 0.6.h,
      ),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status.displayName,
        style: TextStyles.textViewRegular14.copyWith(
          color: _getTextColor(),
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (status) {
      case ReferenceStatus.pending:
        return const Color.fromARGB(162, 252, 241, 219); // Light yellow/orange
      case ReferenceStatus.verified:
        return const Color(0xFFE8F5E8); // Light green
      case ReferenceStatus.rejected:
        return const Color(0xFFFFEBEE); // Light red
    }
  }

  Color _getTextColor() {
    switch (status) {
      case ReferenceStatus.pending:
        return const Color(0xFFF2B74C); // Darker orange
      case ReferenceStatus.verified:
        return const Color(0xFF2E7D32); // Darker green
      case ReferenceStatus.rejected:
        return const Color(0xFFC62828); // Darker red
    }
  }
}
