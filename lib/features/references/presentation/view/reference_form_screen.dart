import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/core/utils/responsive_utils.dart';
import 'package:stat_doctor/core/navigation_services/navigation_manager.dart';
import 'package:stat_doctor/features/references/data/models/reference_model.dart';

class ReferenceFormScreen extends StatefulWidget {
  final ReferenceModel? referenceToEdit;
  final Function(ReferenceModel)? onSave;

  const ReferenceFormScreen({
    super.key,
    this.referenceToEdit,
    this.onSave,
  });

  @override
  State<ReferenceFormScreen> createState() => _ReferenceFormScreenState();
}

class _ReferenceFormScreenState extends State<ReferenceFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Form controllers
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _hospitalController;
  
  // Form data
  String _selectedSpecialty = '';
  String _selectedSeniority = '';
  DateTime? _selectedDueDate;

  // Check if we're in edit mode
  bool get _isEditMode => widget.referenceToEdit != null;

  // Dropdown options
  final List<String> _specialties = [
    'General Practice',
    'Cardiology',
    'Dermatology',
    'Pediatrics',
    'Orthopedics',
    'Neurology',
    'Psychiatry',
    'Emergency Medicine',
    'Intensive Care Medicine',
    'Internal Medicine',
    'Surgery',
    'Radiology',
    'Anesthesiology',
    'Pathology',
    'Oncology',
    'Other',
  ];

  final List<String> _seniorityLevels = [
    'Junior',
    'Senior',
    'Registrar',
    'Consultant',
    'Specialist',
    'Professor',
    'Head of Department',
    'Director',
    'VMO/SMO',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _hospitalController = TextEditingController();
    
    // If editing, populate fields with existing data
    if (_isEditMode) {
      final reference = widget.referenceToEdit!;
      _nameController.text = reference.name;
      _phoneController.text = reference.phoneNumber;
      _emailController.text = reference.email;
      _hospitalController.text = reference.currentHospital;
      _selectedSpecialty = reference.specialty;
      _selectedSeniority = reference.seniority;
      _selectedDueDate = reference.dueDate;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _hospitalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(1.w),
 
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.textSecondary,
              size: 4.w,
            ),
            onPressed: () => NavigationManager.pop(),
          ),
        ),
        title: Text(
          _isEditMode ? 'Edit Reference' : 'Add New Reference',
          style: TextStyles.textViewBold18.copyWith(
            color: AppColors.textPrimary,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context)),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Field
              _buildCustomTextField(
                label: 'Reference\'s full name',
                controller: _nameController,
                hintText: 'Abdallah Ibrahim',
              ),
              
              SizedBox(height: 2.h),
              
              // Phone Number Field
              _buildCustomTextField(
                label: 'Reference\'s mobile',
                controller: _phoneController,
                hintText: '0498 765 432',
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
              ),
              
              SizedBox(height: 2.h),
              
              // Email Field
              _buildCustomTextField(
                label: 'Reference\'s email',
                controller: _emailController,
                hintText: 'example@email.com',
                keyboardType: TextInputType.emailAddress,
              ),
              
              SizedBox(height: 2.h),
              
              // Specialty Dropdown
              _buildCustomDropdownField(
                label: 'Select reference\'s specialty',
                value: _selectedSpecialty.isEmpty ? 'Select...' : _selectedSpecialty,
                options: _specialties,
                onChanged: (newValue) {
                  setState(() {
                    _selectedSpecialty = newValue;
                  });
                },
              ),
              
              SizedBox(height: 2.h),
              
              // Seniority Dropdown
              _buildCustomDropdownField(
                label: 'Select reference\'s seniority',
                value: _selectedSeniority.isEmpty ? 'Select...' : _selectedSeniority,
                options: _seniorityLevels,
                onChanged: (newValue) {
                  setState(() {
                    _selectedSeniority = newValue;
                  });
                },
              ),
              
              SizedBox(height: 2.h),
              
              // Current Hospital Field
              _buildCustomTextField(
                label: 'Reference\'s current hospital',
                controller: _hospitalController,
                hintText: 'The Royal Melbourne Hospital',
              ),
              
              // SizedBox(height: 2.h),
              
              // // Due Date Field
              // _buildDueDateField(),
              
              SizedBox(height: 4.h),
              
              // Add extra bottom padding to ensure content doesn't get hidden behind FAB
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
      floatingActionButton: _buildFloatingSaveButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildCustomTextField({
    required String label,
    required TextEditingController controller,
    String? hintText,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.textViewBold16.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 1.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.w),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowLight.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            style: TextStyles.textViewRegular16.copyWith(
              color: AppColors.textPrimary,
              fontSize: 14.sp,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyles.textViewRegular16.copyWith(
                color: AppColors.textSecondary,
                fontSize: 14.sp,
              ),
              filled: true,
              fillColor: AppColors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 2.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.w),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.w),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.w),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomDropdownField({
    required String label,
    required String value,
    required List<String> options,
    required ValueChanged<String> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.textViewBold16.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 1.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.w),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowLight.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: InkWell(
            onTap: () => _showDropdown(context, label, options, onChanged),
            borderRadius: BorderRadius.circular(12.w),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 2.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      value,
                      style: TextStyles.textViewRegular16.copyWith(
                        color: value == 'Select...' 
                            ? AppColors.textSecondary 
                            : AppColors.textPrimary,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.textSecondary,
                    size: 5.w,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildFloatingSaveButton() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      height: 6.h,
      decoration: BoxDecoration(
        color: const Color(0xFF3366FF), // Vibrant blue from image
        borderRadius: BorderRadius.circular(12.w),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _saveReference,
          borderRadius: BorderRadius.circular(12.w),
          child: Center(
            child: Text(
              _isEditMode ? 'Update' : 'Save',
              style: TextStyles.textViewBold16.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDropdown(
    BuildContext context,
    String title,
    List<String> options,
    ValueChanged<String> onChanged,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(4.w),
        ),
      ),
      builder: (context) => Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        padding: EdgeInsets.all(4.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24.w,
              height: .5.h,
              decoration: BoxDecoration(
                color: AppColors.borderLight,
                borderRadius: BorderRadius.circular(1.w),
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              title,
              style: TextStyles.textViewBold18.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 3.h),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: options.length,
                separatorBuilder: (context, index) => SizedBox(height: 1.h),
                itemBuilder: (context, index) {
                  final option = options[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      onChanged(option);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        option,
                        style: TextStyles.textViewRegular16.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }


  void _saveReference() {
    // Validate form fields
    if (_nameController.text.isEmpty) {
      _showValidationError('Please enter reference\'s name');
      return;
    }
    
    if (_phoneController.text.isEmpty || _phoneController.text.length < 10) {
      _showValidationError('Please enter a valid phone number');
      return;
    }
    
    if (_emailController.text.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(_emailController.text)) {
      _showValidationError('Please enter a valid email address');
      return;
    }
    
    if (_selectedSpecialty.isEmpty || _selectedSpecialty == 'Select specialty') {
      _showValidationError('Please select a specialty');
      return;
    }
    
    if (_selectedSeniority.isEmpty || _selectedSeniority == 'Select seniority') {
      _showValidationError('Please select seniority level');
      return;
    }
    
    if (_hospitalController.text.isEmpty) {
      _showValidationError('Please enter hospital name');
      return;
    }

    
    // Create or update reference model
    final reference = _isEditMode 
        ? widget.referenceToEdit!.copyWith(
            name: _nameController.text,
            phoneNumber: _phoneController.text,
            email: _emailController.text,
            specialty: _selectedSpecialty,
            seniority: _selectedSeniority,
            currentHospital: _hospitalController.text,
            dueDate: _selectedDueDate ?? DateTime.now().add(const Duration(days: 30)),
            updatedAt: DateTime.now(),
          )
        : ReferenceModel(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            name: _nameController.text,
            phoneNumber: _phoneController.text,
            email: _emailController.text,
            specialty: _selectedSpecialty,
            seniority: _selectedSeniority,
            currentHospital: _hospitalController.text,
            dueDate: _selectedDueDate ?? DateTime.now().add(const Duration(days: 30)),
            status: ReferenceStatus.pending,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );
    
    // Call the callback if provided
    if (widget.onSave != null) {
      widget.onSave!(reference);
    }
    
    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isEditMode ? 'Reference updated successfully' : 'Reference saved successfully'),
        backgroundColor: AppColors.success,
      ),
    );
    
    NavigationManager.pop();
  }

  void _showValidationError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
      ),
    );
  }
}
