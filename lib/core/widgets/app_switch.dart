import 'package:flutter/cupertino.dart';

class AppSwitch extends StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;
  const AppSwitch({super.key, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: FittedBox(
        fit: BoxFit.contain,
        child: CupertinoSwitch(
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
