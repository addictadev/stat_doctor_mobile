// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get errorFieldRequired => 'هذا الحقل مطلوب';

  @override
  String get errorInvalidName => 'تنسيق الاسم غير صحيح';

  @override
  String get errorInvalidUrl => 'عنوان URL غير صالح';

  @override
  String get errorInvalidEmail => 'عنوان البريد الإلكتروني غير صحيح';

  @override
  String get errorInvalidPassword =>
      'يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل مع أحرف كبيرة وصغيرة ورموز خاصة';

  @override
  String get errorPasswordMismatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get errorInvalidNumber => 'رقم غير صالح';

  @override
  String get errorInvalidIban => 'تنسيق IBAN غير صالح';

  @override
  String get errorInvalidMobileNumber => 'رقم الجوال غير صالح';

  @override
  String get errorInvalidStcPayId => 'معرف STC Pay غير صالح';

  @override
  String get errorInvalidNationalId => 'رقم الهوية الوطنية غير صالح';

  @override
  String get errorInvalidPassport => 'رقم جواز السفر غير صالح';

  @override
  String get errorNoInternetConnection =>
      'لا يوجد اتصال بالإنترنت. يرجى التحقق من إعدادات الشبكة والمحاولة مرة أخرى.';

  @override
  String get errorConnectionTimedOut =>
      'انتهت مهلة الاتصال. يرجى التحقق من اتصال الإنترنت والمحاولة مرة أخرى.';

  @override
  String get errorSessionExpired =>
      'انتهت صلاحية جلستك. يرجى تسجيل الدخول مرة أخرى للمتابعة.';

  @override
  String get errorUnknownServerError =>
      'حدث خطأ غير معروف في الخادم. يرجى المحاولة مرة أخرى لاحقًا أو التواصل مع الدعم إذا استمرت المشكلة.';

  @override
  String get errorUnexpectedError =>
      'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى أو التواصل مع الدعم إذا استمرت المشكلة.';

  @override
  String get noResults => 'عذرًا! لا توجد نتائج';

  @override
  String get noDataToDisplay => 'لا توجد بيانات للعرض حاليًا.';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get tryAgain => 'حاول مرة أخرى';

  @override
  String get uploadChooseImage => 'اختر صورة';

  @override
  String get uploadTakePicture => 'التقط صورة';

  @override
  String get uploadChooseFromFiles => 'اختر من الملفات';
}
