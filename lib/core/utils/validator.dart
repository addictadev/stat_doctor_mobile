import 'package:stat_doctor/core/navigation/app_navigator.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:stat_doctor/core/extensions/localization.dart';

class Validator {
  static BuildContext context = sl<AppNavigator>().navigatorKey.currentState!.context;

  static String? defaultValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    return null;
  }

  static String? dateOfBirth(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    return null;
  }

  static String? checkBox(bool? value) {
    if (value == null || !value) {
      return context.tr.errorFieldRequired;
    }
    return null;
  }

  static String? text(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    if (!RegExp('[a-zA-Z]').hasMatch(value)) {
      return context.tr.errorInvalidName;
    }
    return null;
  }

  static String? hasValidUrl(String? value) {
    const pattern =
        r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?';
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    if (!RegExp(pattern).hasMatch(value)) {
      return context.tr.errorInvalidUrl;
    }
    return null;
  }


  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
      return context.tr.errorInvalidEmail;
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    if (value.length < 8 ||
        !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9#?!@$%^&*-]).{8,}$')
            .hasMatch(value)) {
      return context.tr.errorInvalidPassword;
    }
    return null;
  }

  static String? confirmPassword(String? confirmPassword, String? password) {
    if (confirmPassword == null || confirmPassword.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    if (confirmPassword != password) {
      return context.tr.errorPasswordMismatch;
    }
    return null;
  }

  static String? numbers(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    final sanitizedValue = value.startsWith("+") ? value.replaceFirst("+", "") : value;
    if (int.tryParse(sanitizedValue) == null) {
      return context.tr.errorInvalidNumber;
    }
    return null;
  }

  static String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return context.tr.errorFieldRequired;
    }
    try {
      final phoneNumber = PhoneNumber.parse(value);
      if (phoneNumber.isValid(type: PhoneNumberType.mobile)) {
        return null; 
      } else {
        return context.tr.errorInvalidNumber;
      }
    } catch (e) {
      return context.tr.errorInvalidNumber;
    }
  }

  static String? ibanValidator(String? value, String code) {
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }

    final trimmedValue = value.trim().toUpperCase();
    late RegExp regex;

    switch (code) {
      case "SA":
        regex = RegExp(r'^SA\d{22}$');
        break;
      case "BH":
        regex = RegExp(r'^BH\d{2}[A-Z0-9]{14}$');
        break;
      default:
        if (value.trim().isEmpty) {return context.tr.errorFieldRequired;}
    }

    if (!regex.hasMatch(trimmedValue)) {
      return context.tr.errorInvalidIban;
    }
    return null;
  }


  static String? stcPayMobileValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    const saudiMobilePattern = r'^(05\d{8}|9665\d{8})$';
    if (!RegExp(saudiMobilePattern).hasMatch(value.trim())) {
      return context.tr.errorInvalidMobileNumber;
    }
    return null;
  }

  static String? stcPayIdValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    if (value.length < 10 || value.length > 15 || int.tryParse(value) == null) {
      return context.tr.errorInvalidStcPayId;
    }
    return null;
  }


  static String? nationalIdValidator(String? value, String code) {
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }

    final trimmedValue = value.trim();
    late RegExp regex;

    switch (code) {
      case "SA": // Saudi Arabia
        regex = RegExp(r'^[12]\d{9}$');
        break;
      case "MA": // Morocco
        regex = RegExp(r'^[A-Z]{1,2}\d{4,6}$');
        break;
      case "BH": // Bahrain
        regex = RegExp(r'^\d{9}$');
        break;
      default:
        return context.tr.errorInvalidNationalId;
    }

    if (!regex.hasMatch(trimmedValue)) {
      return context.tr.errorInvalidNationalId;
    }
    return null;
  }

  static String? passportValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    const passportPattern = r'^[a-zA-Z0-9]{6,9}$'; 
    if (!RegExp(passportPattern).hasMatch(value.trim())) {
      return context.tr.errorInvalidPassport;
    }
    return null;
  }

}