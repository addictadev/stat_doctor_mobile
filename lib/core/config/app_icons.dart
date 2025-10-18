import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  AppIcons._();

  static const String _path = 'assets/icons/';
  static const String success = '${_path}success.svg';
  static const String warning = '${_path}warning.svg';
  static const String error = '${_path}error.svg';
  static const String pending = '${_path}pending.svg';
  static const String deactivated = '${_path}deactivated.svg';
  static const String check = '${_path}check.svg';
  static const String right = '${_path}right.svg';
  static const String close = '${_path}close.svg';
  static const String eye = '${_path}eye.svg';
  static const String gallery = '${_path}gallery.svg';
  static const String camera = '${_path}camera.svg';
  static const String file = '${_path}file.svg';
  static const String riyal = '${_path}riyal.svg';
  static const String sar = '${_path}sar.svg';
  static const String darkMode = '${_path}dark_mode.svg';
  static const String lightMode = '${_path}light_mode.svg';
  static const String language = '${_path}language.svg';
  static const String search = '${_path}search.svg';
  static const String calendar = '${_path}calendar.svg';


  // Method to render SVG as a widget
  static Widget icon({required String icon, double size = 24, Color? color}) => SvgPicture.asset(
    icon,
    width: size.w,
    height: size.h,
    colorFilter: color == null ? null : ColorFilter.mode(color, BlendMode.srcIn),
  );
}
