import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget? leading;
  final bool showBackButton;
  const AppAppbar({super.key, required this.title, this.leading, this.showBackButton = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: showBackButton ? BackButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Theme.of(context).cardColor),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000.r))),
          backgroundBuilder: (context, states, child) => Icon(Icons.arrow_back_ios_new, color: Theme.of(context).colorScheme.onSurface,),
        ),
      ) : leading,
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}