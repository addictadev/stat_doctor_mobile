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
  static const String failure = '${_path}failure.svg';
  static const String check = '${_path}check.svg';
  static const String right = '${_path}right.svg';
  static const String close = '${_path}close.svg';
  static const String add = '${_path}add.svg';
  static const String edit = '${_path}edit.svg';
  static const String delete = '${_path}delete_account.svg';
  static const String eye = '${_path}eye.svg';
  static const String gallery = '${_path}gallery.svg';
  static const String camera = '${_path}camera.svg';
  static const String file = '${_path}file.svg';
  static const String pdf = '${_path}pdf.svg';
  static const String uploadDocument = '${_path}upload_document.svg';
  static const String home = '${_path}home.svg';
  static const String account = '${_path}account.svg';
  static const String notifications = '${_path}notifications.svg';
  static const String setting = '${_path}setting.svg';
  static const String search = '${_path}search.svg';
  static const String filter = '${_path}filter.svg';
  static const String calendar = '${_path}calendar.svg';
  static const String clock = '${_path}clock.svg';
  static const String location = '${_path}location.svg';
  static const String shifts = '${_path}shifts.svg';
  static const String medical = '${_path}medical.svg';
  static const String award = '${_path}award.svg';
  static const String star = '${_path}star.svg';
  static const String smileys = '${_path}smileys.svg';
  static const String faceId = '${_path}face_id.svg';
  static const String touchId = '${_path}touch_id.svg';
  static const String verify = '${_path}verify.svg';
  static const String idProof = '${_path}id_proof.svg';
  static const String editProfile = '${_path}edit_profile.svg';
  static const String logout = '${_path}logout.svg';
  static const String darkMode = '${_path}dark_mode.svg';
  static const String lightMode = '${_path}light_mode.svg';
  static const String language = '${_path}language.svg';
  static const String info = '${_path}info.svg';
  static const String messageQuestion = '${_path}message_question.svg';
  static const String notificationAccepted = '${_path}notification_accepted.svg';
  static const String notificationRejected = '${_path}notification_rejected.svg';
  static const String notificationOnhours = '${_path}notification_onhours.svg';
  static const String notificationOnshifts = '${_path}notification_onshifts.svg';
  static const String trash = '${_path}trash.svg';
  static const String accountMedical = '${_path}account_medical.svg';
  static const String accountReferences = '${_path}account_references.svg';
  static const String accountDocuments = '${_path}account_documents.svg';
  static const String accountNotifications = '${_path}account_notifications.svg';
  static const String accountSettings = '${_path}account_settings.svg';






  // Method to render SVG as a widget
  static Widget icon({required String icon, double size = 24, Color? color}) => SvgPicture.asset(
    icon,
    width: size.w,
    height: size.h,
    colorFilter: color == null ? null : ColorFilter.mode(color, BlendMode.srcIn),
  );
}
