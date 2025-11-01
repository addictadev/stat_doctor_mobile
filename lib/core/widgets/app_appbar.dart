import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final bool showBackButton;
  final Color? backButtonBackgroundColor;
  final Color? backButtonIconColor;
  final Color? backgroundColor;
  final List<Widget>? actions;
  
  const AppAppbar({
    super.key,
    this.title,
    this.leading,
    this.showBackButton = true,
    this.backgroundColor,
    this.backButtonBackgroundColor,
    this.backButtonIconColor,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: title,
      leading: showBackButton ? BackButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll( backButtonBackgroundColor ?? Theme.of(context).cardColor),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000.r))),
          backgroundBuilder: (context, states, child) => Icon(Icons.arrow_back_ios_new, color: backButtonIconColor ?? Theme.of(context).colorScheme.onSurface,),
        ),
      ) : leading,
      actions: actions,
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}