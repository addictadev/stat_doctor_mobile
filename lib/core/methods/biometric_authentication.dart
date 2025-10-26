import 'package:local_auth/local_auth.dart';
import 'package:flutter/material.dart';

class BiometricAuthenticationService {
  static BiometricAuthenticationInstance? _instance;

  static BiometricAuthenticationInstance get instance {
    _instance ??= BiometricAuthenticationInstance();
    return _instance!;
  }
}

class BiometricAuthenticationInstance {
  final LocalAuthentication _localAuth = LocalAuthentication();
  
  bool _isInitialized = false;
  bool _isFaceIdAvailable = false;
  bool _isTouchIdAvailable = false;
  bool _hasBiometricAuthentication = false;

  bool get isInitialized => _isInitialized;
  bool get isFaceIdAvailable => _isFaceIdAvailable;
  bool get isTouchIdAvailable => _isTouchIdAvailable;
  bool get hasBiometricAuthentication => _hasBiometricAuthentication;

  Future<void> init() async {
    try {
      final bool canAuthenticateWithBiometrics = await _localAuth.canCheckBiometrics;
      final bool canAuthenticate = canAuthenticateWithBiometrics || await _localAuth.isDeviceSupported();
      _hasBiometricAuthentication = canAuthenticate;
      if (canAuthenticate) {
        final List<BiometricType> availableBiometrics = await _localAuth.getAvailableBiometrics();
        _isFaceIdAvailable = availableBiometrics.contains(BiometricType.face);
        _isTouchIdAvailable = availableBiometrics.contains(BiometricType.fingerprint);
        _isInitialized = true;
        debugPrint('Biometric authentication initialized - Face ID: $_isFaceIdAvailable, Touch ID: $_isTouchIdAvailable');
      } else {
        debugPrint('Biometric authentication not available on this device');
      }
    } catch (e) {
      debugPrint('Error initializing biometric authentication: $e');
      _isInitialized = false;
    }
  }
  
  // Check if biometric authentication is available
  Future<bool> isBiometricAvailable() async {
    try {
      final bool canAuthenticateWithBiometrics = await _localAuth.canCheckBiometrics;
      final bool canAuthenticate = canAuthenticateWithBiometrics || await _localAuth.isDeviceSupported();
      _hasBiometricAuthentication = canAuthenticate;
      return _hasBiometricAuthentication;
    } catch (e) {
      debugPrint('Error checking biometric availability: $e');
      return false;
    }
  }

  // Check if Face ID is available
  Future<bool> checkFaceIdAvailability() async {
    if (await isBiometricAvailable()) {
      try {
        final List<BiometricType> availableBiometrics = await _localAuth.getAvailableBiometrics();
        return availableBiometrics.contains(BiometricType.face);
      } catch (e) {
        debugPrint('Error checking Face ID availability: $e');
        return false;
      }
    }
    return false;
  }

  // Check if Touch ID is available
  Future<bool> checkTouchIdAvailability() async {
    if (await isBiometricAvailable()) {
      try {
        final List<BiometricType> availableBiometrics = await _localAuth.getAvailableBiometrics();
        return availableBiometrics.contains(BiometricType.fingerprint);
      } catch (e) {
        debugPrint('Error checking Touch ID availability: $e');
        return false;
      }
    }
    return false;
  }

  // Authenticate using biometrics
  Future<bool> authenticate({String? reason}) async {
    try {
      if (await isBiometricAvailable()) {
        final bool canAuthenticate = await _localAuth.authenticate(
          localizedReason: reason ?? 'Authenticate to access your account',
          biometricOnly: true,
        );
        debugPrint('Biometric authentication result: $canAuthenticate');
        return canAuthenticate;
      }
      debugPrint('Biometric authentication not available');
      return false;
    } catch (e) {
      debugPrint('Error during biometric authentication: $e');
      return false;
    }
  }

  // Get available biometric types
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      if (await isBiometricAvailable()) {
        return await _localAuth.getAvailableBiometrics();
      }
      return [];
    } catch (e) {
      debugPrint('Error getting available biometrics: $e');
      return [];
    }
  }

  // Check if device supports biometric authentication
  Future<bool> isDeviceSupported() async {
    try {
      return await _localAuth.isDeviceSupported();
    } catch (e) {
      debugPrint('Error checking device support: $e');
      return false;
    }
  }
}