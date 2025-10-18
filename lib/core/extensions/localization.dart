import 'package:stat_doctor/core/translation/app_localizations.dart';
import 'package:flutter/material.dart';
extension AppLocalizationsX on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this)!;
}