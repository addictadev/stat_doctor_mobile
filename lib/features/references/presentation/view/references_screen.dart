import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/core/utils/responsive_utils.dart';
import 'package:stat_doctor/core/navigation_services/navigation_manager.dart';
import 'package:stat_doctor/features/references/data/models/reference_model.dart';
import 'package:stat_doctor/features/references/presentation/widgets/reference_card.dart';
import 'add_reference_screen.dart';

class ReferencesScreen extends StatefulWidget {
  const ReferencesScreen({super.key});

  @override
  State<ReferencesScreen> createState() => _ReferencesScreenState();
}

class _ReferencesScreenState extends State<ReferencesScreen> {
  // Sample data - in real app, this would come from a service/repository
  final List<ReferenceModel> _references = [
    ReferenceModel(
      id: '1',
      name: 'Dr. James Branden',
      phoneNumber: '0498 765 432',
      email: 'jamesbranden@gmail.com',
      specialty: 'Emergency Medicine',
      seniority: 'Consultant',
      currentHospital: 'The Royal Melbourne Hospital',
      dueDate: DateTime(2023, 10, 20),
      status: ReferenceStatus.pending,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      updatedAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    ReferenceModel(
      id: '2',
      name: 'Dr. Rebecca Ryan',
      phoneNumber: '0437 233 423',
      email: 'rebeccaryan@gmail.com',
      specialty: 'Intensive Care Medicine',
      seniority: 'Registrar',
      currentHospital: 'John Fawkner Private Hospital',
      dueDate: DateTime(2023, 10, 20),
      status: ReferenceStatus.verified,
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
      updatedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.textPrimary,
            size: context.responsiveIconSize * 0.8,
          ),
          onPressed: () => NavigationManager.pop(),
        ),
        title: Text(
          'References',
          style: TextStyles.textViewBold18.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Add New Reference Button
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveUtils.getResponsivePadding(context),
              vertical: 2.h,
            ),
            child: GestureDetector(
              onTap: _navigateToAddReference,
              child: Row(
                children: [
              Icon(
                      Icons.add,
                      color: AppColors.primary,
                      size: context.responsiveIconSize * 1.0,
                    
                  ),
                  SizedBox(width: 3.w),
                  Text(
                    'Add New reference',
                    style: TextStyles.textViewBold16.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // References List
          Expanded(
            child: _references.isEmpty
                ? _buildEmptyState()
                : ListView.separated(
                    padding: EdgeInsets.only(
                      bottom: 2.h,
                    ),
                    itemCount: _references.length,
                    separatorBuilder: (context, index) => SizedBox(height: 1.h),
                    itemBuilder: (context, index) {
                      final reference = _references[index];
                      return ReferenceCard(
                        reference: reference,
                        onEdit: () => _editReference(reference),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Iconsax.user_add,
            size: 15.w,
            color: AppColors.textSecondary,
          ),
          SizedBox(height: 2.h),
          Text(
            'No references yet',
            style: TextStyles.textViewBold18.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            'Add your professional references to complete your profile.',
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 3.h),
          GestureDetector(
            onTap: _navigateToAddReference,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 1.5.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(
                  ResponsiveUtils.getResponsiveBorderRadius(context),
                ),
              ),
              child: Text(
                'Add First Reference',
                style: TextStyles.textViewMedium14.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToAddReference() {
    NavigationManager.navigateTo(const AddReferenceScreen());
  }

  void _editReference(ReferenceModel reference) {
    // TODO: Navigate to edit reference screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Edit reference functionality coming soon'),
        backgroundColor: AppColors.info,
      ),
    );
  }
}
