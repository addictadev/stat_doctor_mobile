import 'package:flutter/gestures.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    this.startSubTextStyle,
    this.centerSubTextStyle,
    this.endSubTextStyle,
    this.startSubText,
    this.centerSubText,
    this.endSubText,
    this.textAlign,
    this.onStartSubTextTap,
    this.onCenterSubTextTap,
    this.onEndSubTextTap,
  });

  final TextStyle? startSubTextStyle;
  final TextStyle? centerSubTextStyle;
  final TextStyle? endSubTextStyle;
  final String? startSubText;
  final String? centerSubText;
  final String? endSubText;
  final TextAlign? textAlign;
  final Function()? onStartSubTextTap;
  final Function()? onCenterSubTextTap;
  final Function()? onEndSubTextTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      text: TextSpan(
        style: TextStyles.textViewRegular14.copyWith(color: Theme.of(context).textTheme.bodyLarge!.color),
        children: [
          TextSpan(
            text: startSubText,
            style: startSubTextStyle,
            recognizer: TapGestureRecognizer()..onTap = onStartSubTextTap,
          ),
          TextSpan(
            text: centerSubText,
            style: centerSubTextStyle,
            recognizer: TapGestureRecognizer()..onTap = onCenterSubTextTap,
          ),
          TextSpan(
            text: endSubText,
            style: endSubTextStyle,
            recognizer: TapGestureRecognizer()..onTap = onEndSubTextTap,
          )
        ]
      ) 
    );
  }
}