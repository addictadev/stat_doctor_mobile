import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:stat_doctor/core/config/app_colors.dart';

class MapMethods {

  static Future<bool> checkLocationService() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    return serviceEnabled;
  }
    
  static Future<bool> requestLocationPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    
    return true;
  }

    
  static Future<void> openAppSettings() async {
    await Geolocator.openAppSettings();
  }

  static Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }



  static LocationSettings getLocationSettings() {
    if(Platform.isAndroid) {
      return AndroidSettings(
        accuracy: LocationAccuracy.best,
        foregroundNotificationConfig: ForegroundNotificationConfig(
          notificationTitle: "Freelancer Tracking",
          notificationText: "Freelancer is being tracked",
          enableWakeLock: true,
          enableWifiLock: true,
          setOngoing: true,
          notificationIcon: AndroidResource(name: "ic_launcher", defType: "mipmap"),
          color: AppColors.primaryDark
        ),
        forceLocationManager: false,
      );
    }
    return AppleSettings(
      accuracy: LocationAccuracy.high,
      activityType: ActivityType.fitness,
      distanceFilter: 10,
      allowBackgroundLocationUpdates: true,
      pauseLocationUpdatesAutomatically: true,
      showBackgroundLocationIndicator: true,
    );
  }
}
