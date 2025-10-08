import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:stat_doctor/core/navigation_services/navigation_manager.dart';
import 'package:stat_doctor/core/network/dio/dio_helper.dart';
import 'package:stat_doctor/core/network/end%20points/end_points.dart';
import 'package:stat_doctor/core/utils/show_toast.dart';
import 'package:stat_doctor/features/main_screens/presentation/view/main_navigation_screen.dart';
import 'package:stat_doctor/features/auth/data/models/registration_request_model.dart';
import 'package:stat_doctor/features/auth/data/models/registration_data_manager.dart';
import 'package:stat_doctor/features/auth/presentation/view/login_screen.dart';

class AuthController with ChangeNotifier {
  // Registration data
  RegistrationRequestModel? _registrationData;
  final RegistrationDataManager _dataManager = RegistrationDataManager();
  bool _isRegistering = false;

  // Getters
  RegistrationRequestModel? get registrationData => _registrationData;
  RegistrationDataManager get dataManager => _dataManager;
  bool get isRegistering => _isRegistering;

  /// Set registration data
  void setRegistrationData(RegistrationRequestModel data) {
    _registrationData = data;
    notifyListeners();
  }

  /// Build and set registration data from collected data
  void buildRegistrationData() {
    try {
      _registrationData = _dataManager.buildRegistrationRequest();
      notifyListeners();
    } catch (e) {
      log('Error building registration data: $e');
      showCustomedToast('Registration data is incomplete', ToastType.error);
    }
  }

  /// Complete registration process
  Future<bool> register() async {
    if (_registrationData == null) {
      showCustomedToast('Registration data is missing', ToastType.error);
      return false;
    }

    try {
            EasyLoading.show(
        status: 'Creating your account...',
        maskType: EasyLoadingMaskType.black,
      );
      _isRegistering = true;
      notifyListeners();



      log('Registration request body: ${_registrationData!.toJson()}');

      dynamic response = await DioHelper.post(
        EndPoints.profileInfoRegister,
        data: _registrationData!.toJson(),
        requiresAuth: false,
      );

      log('Registration response: $response');

      if (response != null && response.status == true) {
        EasyLoading.dismiss();
        showCustomedToast(
          response.message ?? 'Registration completed successfully!',
          ToastType.success,
        );
        _isRegistering = false;
        notifyListeners();
        
        // Navigate to login screen
        NavigationManager.navigateToAndFinish(const LoginScreen());
        return true;
      } else {
        EasyLoading.dismiss();
        showCustomedToast(
          response.message ?? 'Registration failed. Please try again.',
          ToastType.error,
        );
        _isRegistering = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      EasyLoading.dismiss();
      log('Registration error: $e');
      showCustomedToast(
        'An error occurred during registration. Please try again.',
        ToastType.error,
      );
      _isRegistering = false;
      notifyListeners();
      return false;
    }
  }

  /// Complete registration process without showing loading indicator
  Future<bool> registerWithoutLoading() async {
    if (_registrationData == null) {
      showCustomedToast('Registration data is missing', ToastType.error);
      return false;
    }

    try {
      _isRegistering = true;
      notifyListeners();

      log('Registration request body: ${_registrationData!.toJson()}');

      dynamic response = await DioHelper.post(
        EndPoints.profileInfoRegister,
        data: _registrationData!.toJson(),
        requiresAuth: false,
      );

      log('Registration response: $response');

      if (response != null && response.status == true) {
        showCustomedToast(
          response.message ?? 'Registration completed successfully!',
          ToastType.success,
        );
        _isRegistering = false;
        notifyListeners();
        
        // Navigate to login screen
        NavigationManager.navigateToAndFinish(const LoginScreen());
        return true;
      } else {
        showCustomedToast(
          response.message ?? 'Registration failed. Please try again.',
          ToastType.error,
        );
        _isRegistering = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      log('Registration error: $e');
      showCustomedToast(
        'An error occurred during registration. Please try again.',
        ToastType.error,
      );
      _isRegistering = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> login() async {
    String? mobileToken;
    
    try {
      log("firebase Token >>>$mobileToken");
    } catch (e) {
      log("Error getting Firebase token: $e");
      // Continue with login even if token fails
      mobileToken = null;
    }
    try {
      EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
      );
      notifyListeners();
      final Map<String, dynamic> body = {
        "fcm_token": mobileToken,
        "phone_number": '01000000000',
        "password": '123456'
      };
      log('body: $body');
      dynamic response = await DioHelper.post(EndPoints.login,
          data: body, requiresAuth: false);
      if (response['success'] == true) {
        EasyLoading.dismiss();
        notifyListeners();
        NavigationManager.navigateToAndFinish(const MainNavigationScreen());
      } else {
        EasyLoading.dismiss();
        notifyListeners();
        showCustomedToast(response['message'], ToastType.error);
      }
    } catch (e) {
      EasyLoading.dismiss();
      log(e.toString());
    } finally {
      EasyLoading.dismiss();
      notifyListeners();
    }
  }

}