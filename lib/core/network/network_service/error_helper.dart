// ignore_for_file: use_build_context_synchronously
import 'package:dio/dio.dart';
import 'package:stat_doctor/core/extensions/localization.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/navigation/app_navigator.dart';
import 'package:stat_doctor/core/network/network_service/exceptions.dart';
import 'package:stat_doctor/core/storage/data/storage.dart';
import 'package:flutter/material.dart';
import 'package:stat_doctor/features/onboarding/presentation/screens/onboarding_screen.dart';

class ErrorHelper {
  static final BuildContext _context = sl<AppNavigator>().navigatorKey.currentContext!;

  static Future<void> _logout() async {
    await sl<Storage>().deleteToken();
    sl<AppNavigator>().pushAndRemoveUntil(screen: OnboardingScreen());
  }

  static Future<AppException> handleDioError(DioException e) async{
    switch (e.type) {
      case DioExceptionType.connectionError:
        return NetworkException(_context.tr.errorNoInternetConnection);
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return NetworkException(_context.tr.errorConnectionTimedOut);
      case DioExceptionType.badResponse:
        if (e.response?.statusCode == 401) {
          await _logout();
          return UnauthorizedException(_context.tr.errorSessionExpired);
        }
        final errorData = e.response?.data as Map<String, dynamic>?;
        return ValidationException(errorData?['message'] ?? _context.tr.errorUnknownServerError);
      default:
        return ServerException(message: _context.tr.errorUnexpectedError, response: e.response);
    }
  }
}
