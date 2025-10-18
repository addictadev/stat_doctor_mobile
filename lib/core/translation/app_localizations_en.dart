// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get errorFieldRequired => 'This field is required';

  @override
  String get errorInvalidName => 'Invalid name format';

  @override
  String get errorInvalidUrl => 'Invalid URL';

  @override
  String get errorInvalidEmail => 'Invalid email address';

  @override
  String get errorInvalidPassword =>
      'Password must be at least 8 characters long with uppercase, lowercase, and special characters';

  @override
  String get errorPasswordMismatch => 'Passwords do not match';

  @override
  String get errorInvalidNumber => 'Invalid number';

  @override
  String get errorInvalidIban => 'Invalid IBAN format';

  @override
  String get errorInvalidMobileNumber => 'Invalid mobile number';

  @override
  String get errorInvalidStcPayId => 'Invalid STC Pay ID';

  @override
  String get errorInvalidNationalId => 'Invalid National ID';

  @override
  String get errorInvalidPassport => 'Invalid passport number';

  @override
  String get errorNoInternetConnection =>
      'No internet connection available. Please check your network settings and try again.';

  @override
  String get errorConnectionTimedOut =>
      'Connection timed out. Please check your internet connection and try again.';

  @override
  String get errorSessionExpired =>
      'Your session has expired. Please log in again to continue.';

  @override
  String get errorUnknownServerError =>
      'An unknown server error occurred. Please try again later or contact support if the problem persists.';

  @override
  String get errorUnexpectedError =>
      'An unexpected error occurred. Please try again or contact support if the problem continues.';

  @override
  String get noResults => 'Oops! No Results';

  @override
  String get noDataToDisplay => 'No data to display at the moment.';

  @override
  String get retry => 'Retry';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get uploadChooseImage => 'Choose Image';

  @override
  String get uploadTakePicture => 'Take Picture';

  @override
  String get uploadChooseFromFiles => 'Choose From Files';
}
