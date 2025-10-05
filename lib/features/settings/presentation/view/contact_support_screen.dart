import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/core/utils/responsive_utils.dart';
import 'package:stat_doctor/core/navigation_services/navigation_manager.dart';

class ContactSupportScreen extends StatefulWidget {
  const ContactSupportScreen({super.key});

  @override
  State<ContactSupportScreen> createState() => _ContactSupportScreenState();
}

class _ContactSupportScreenState extends State<ContactSupportScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(1.w),
          decoration: BoxDecoration(
            color: AppColors.borderLight.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.textPrimary,
              size: 4.w,
            ),
            onPressed: () => NavigationManager.pop(),
          ),
        ),
        title: Text(
          'Contact Support',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            
            // Contact Information
            _buildContactInfo(),
            
            SizedBox(height: 3.h),
            
            // Contact Form
            _buildContactForm(),
            
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get in Touch',
            style: TextStyles.textViewBold16.copyWith(
              color: AppColors.textPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 2.h),
          
          _buildContactItem(
            icon: Icons.email,
            title: 'Email',
            subtitle: 'support@statdoctor.com',
            onTap: () => _copyToClipboard('support@statdoctor.com'),
          ),
          
          SizedBox(height: 1.5.h),
          
          _buildContactItem(
            icon: Icons.phone,
            title: 'Phone',
            subtitle: '+61 2 1234 5678',
            onTap: () => _copyToClipboard('+61 2 1234 5678'),
          ),
          
          SizedBox(height: 1.5.h),
          
          _buildContactItem(
            icon: Icons.schedule,
            title: 'Support Hours',
            subtitle: 'Mon-Fri 9AM-5PM (AEST)',
            onTap: null,
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(2.w),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 4.w,
            ),
          ),
          SizedBox(width: 3.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.textViewMedium14.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyles.textViewRegular14.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
          if (onTap != null)
            Icon(
              Icons.copy,
              color: AppColors.textSecondary,
              size: 3.w,
            ),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Send us a Message',
          style: TextStyles.textViewBold16.copyWith(
            color: AppColors.textPrimary,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 2.h),
        
        _buildTextField(
          controller: _nameController,
          label: 'Your Name',
          hintText: 'Enter your full name',
        ),
        
        SizedBox(height: 2.h),
        
        _buildTextField(
          controller: _emailController,
          label: 'Email Address',
          hintText: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
        ),
        
        SizedBox(height: 2.h),
        
        _buildTextField(
          controller: _subjectController,
          label: 'Subject',
          hintText: 'What can we help you with?',
        ),
        
        SizedBox(height: 2.h),
        
        _buildTextField(
          controller: _messageController,
          label: 'Message',
          hintText: 'Describe your issue or question...',
          maxLines: 5,
        ),
        
        SizedBox(height: 3.h),
        
        _buildSendButton(),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.textViewMedium16.copyWith(
            color: AppColors.textPrimary,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 1.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.inputBackground,
            borderRadius: BorderRadius.circular(12.w),
            border: Border.all(
              color: AppColors.borderLight.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
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
              fillColor: Colors.transparent,
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

  Widget _buildSendButton() {
    return Container(
      width: double.infinity,
      height: 6.h,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _sendMessage,
          borderRadius: BorderRadius.circular(12.w),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Iconsax.send_2,
                  color: AppColors.white,
                  size: 4.w,
                ),
                SizedBox(width: 2.w),
                Text(
                  'Send Message',
                  style: TextStyles.textViewBold16.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied to clipboard'),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _subjectController.text.isEmpty ||
        _messageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Message sent successfully! We\'ll get back to you soon.'),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // Clear form
    _nameController.clear();
    _emailController.clear();
    _subjectController.clear();
    _messageController.clear();
  }
}
