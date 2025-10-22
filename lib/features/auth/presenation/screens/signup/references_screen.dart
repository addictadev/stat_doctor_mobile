import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/features/auth/data/objects_value/register_params.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/add_refernces.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/refernce_card.dart';

class ReferencesScreen extends StatefulWidget {
  final List<ReferencesDTO> references;
  final VoidCallback onNext;
  const ReferencesScreen({required this.references, required this.onNext, super.key});

  @override
  State<ReferencesScreen> createState() => _ReferencesScreenState();
}

class _ReferencesScreenState extends State<ReferencesScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 25.h),
      child: Column(
        spacing: 15.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "References will receive an assessment form to complete and return to StatDoctor. Once received, references are verified on your account.",
            style: TextStyles.textViewRegular14.copyWith(color: Theme.of(context).hintColor),
          ),
          Form(
            key: formKey,
            child: Column(
              spacing: 15.h,
              children: List.generate(
                widget.references.length,
                (index) => RefernceCard(
                  reference: widget.references[index],
                  onRemove: () {setState(() {widget.references.removeAt(index);});},
                  showRemove: index > 0,
                )
              ),
            ),
          ),      
          AddRefernces(onAdd: () {setState(() {widget.references.add(ReferencesDTO(seq: widget.references.length + 1));});},),
          AppButton(
            onTap: () {if(formKey.currentState!.validate()) {widget.onNext();}},
            text: 'Next',
          ),
        ],
      ),
    );
  }
}