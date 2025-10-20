import 'package:flutter/cupertino.dart';
import 'package:stat_doctor/core/theme/drop_down_theme.dart';
import 'package:stat_doctor/core/widgets/custom_dropdown/custom_dropdown.dart';

class AppDropdown extends StatelessWidget {
  final List<String> items;
  final String? initialItem;
  final String? hintText;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  const AppDropdown({super.key, required this.items, this.initialItem, this.hintText, this.onChanged, this.validator});

  @override
  Widget build(BuildContext context) {
    return CustomDropdown(
      items: items,
      initialItem: initialItem,
      hintText: hintText,
      decoration: DropdownTheme.dropdownMultiSelectDecoration(context: context),
      disabledDecoration: DropdownTheme.dropdownMultiSelectDisableDecoration(context: context),
      validator: validator,
      onChanged: onChanged,
    );
  }
}