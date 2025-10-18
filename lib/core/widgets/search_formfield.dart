import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class SearchFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String hintText;
  final String? label;

  const SearchFormField({
    super.key,
    required this.controller,
    this.onChanged,
    required this.hintText,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      onChanged: onChanged,
      prefixIcon: AppIcons.search,
      hintText: hintText,
      label: label,
      alignLabelWithHint: false,
      border: InputBorder.none,
    );
  }
}
