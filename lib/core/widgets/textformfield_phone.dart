import 'package:country_code_picker/country_code_picker.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldPhone extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController countryCodeController;
  final bool enableCountryPicker;
  final String hintText;
  final Color? cardColor;
  final String? label;
  final bool? readOnly;
  final String? regionCode;
  final String? Function(String?)? validator;

  const TextFormFieldPhone({
    required this.hintText,
    this.validator,
    this.label,
    this.readOnly,
    this.regionCode,
    this.cardColor,
    this.enableCountryPicker = true,
    required this.phoneController,
    required this.countryCodeController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: phoneController,
      readOnly: readOnly ?? false,
      hintText: hintText,
      validator: validator,
      cardColor: cardColor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      alignLabelWithHint: false,
      keyboardType: TextInputType.phone,
      onlyDigit: true,
      label: label,
      prefixWidget: CountryCodePicker(
        headerAlignment: MainAxisAlignment.center,
        onChanged: (value) {countryCodeController.text = value.dialCode.toString();},
        enabled: enableCountryPicker,
        hideCloseIcon: true,
        initialSelection: regionCode ?? 'au',
        topBarPadding: EdgeInsets.only(top: 15.h),
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        dialogBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        searchPadding: EdgeInsets.all(15.r),
        boxDecoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(15.r)
        ),
        showFlagMain: false,
        searchDecoration: InputDecoration(
          filled: true,
          labelText: "Search",
          prefixIcon: IconButton(
            onPressed: () {},
            highlightColor: AppColors.transparent,
            splashColor: AppColors.transparent,
            icon: AppIcons.icon(size: 18, icon: AppIcons.search, color: Theme.of(context).hintColor),
          ),
          hintText: "Search",
        ),
      ),
    );
  }
}
