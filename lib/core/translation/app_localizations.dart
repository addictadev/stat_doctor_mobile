import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'translation/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @errorFieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get errorFieldRequired;

  /// No description provided for @errorInvalidName.
  ///
  /// In en, this message translates to:
  /// **'Invalid name format'**
  String get errorInvalidName;

  /// No description provided for @errorInvalidUrl.
  ///
  /// In en, this message translates to:
  /// **'Invalid URL'**
  String get errorInvalidUrl;

  /// No description provided for @errorInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get errorInvalidEmail;

  /// No description provided for @errorInvalidPassword.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters long with uppercase, lowercase, and special characters'**
  String get errorInvalidPassword;

  /// No description provided for @errorPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get errorPasswordMismatch;

  /// No description provided for @errorInvalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid number'**
  String get errorInvalidNumber;

  /// No description provided for @errorInvalidIban.
  ///
  /// In en, this message translates to:
  /// **'Invalid IBAN format'**
  String get errorInvalidIban;

  /// No description provided for @errorInvalidMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid mobile number'**
  String get errorInvalidMobileNumber;

  /// No description provided for @errorInvalidStcPayId.
  ///
  /// In en, this message translates to:
  /// **'Invalid STC Pay ID'**
  String get errorInvalidStcPayId;

  /// No description provided for @errorInvalidNationalId.
  ///
  /// In en, this message translates to:
  /// **'Invalid National ID'**
  String get errorInvalidNationalId;

  /// No description provided for @errorInvalidPassport.
  ///
  /// In en, this message translates to:
  /// **'Invalid passport number'**
  String get errorInvalidPassport;

  /// No description provided for @errorNoInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection available. Please check your network settings and try again.'**
  String get errorNoInternetConnection;

  /// No description provided for @errorConnectionTimedOut.
  ///
  /// In en, this message translates to:
  /// **'Connection timed out. Please check your internet connection and try again.'**
  String get errorConnectionTimedOut;

  /// No description provided for @errorSessionExpired.
  ///
  /// In en, this message translates to:
  /// **'Your session has expired. Please log in again to continue.'**
  String get errorSessionExpired;

  /// No description provided for @errorUnknownServerError.
  ///
  /// In en, this message translates to:
  /// **'An unknown server error occurred. Please try again later or contact support if the problem persists.'**
  String get errorUnknownServerError;

  /// No description provided for @errorUnexpectedError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again or contact support if the problem continues.'**
  String get errorUnexpectedError;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'Oops! No Results'**
  String get noResults;

  /// No description provided for @noDataToDisplay.
  ///
  /// In en, this message translates to:
  /// **'No data to display at the moment.'**
  String get noDataToDisplay;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @uploadChooseImage.
  ///
  /// In en, this message translates to:
  /// **'Choose Image'**
  String get uploadChooseImage;

  /// No description provided for @uploadTakePicture.
  ///
  /// In en, this message translates to:
  /// **'Take Picture'**
  String get uploadTakePicture;

  /// No description provided for @uploadChooseFromFiles.
  ///
  /// In en, this message translates to:
  /// **'Choose From Files'**
  String get uploadChooseFromFiles;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
