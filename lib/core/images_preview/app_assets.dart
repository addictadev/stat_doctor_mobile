class AppAssets {
  factory AppAssets() {
    return _instance;
  }
  AppAssets._();
  static final AppAssets _instance = AppAssets._();



  static const String appIcon = "assets/icons/app_icon.png";
  static const String whiteAppIcon = "assets/icons/bgh.png";

  static const String authBackground = "assets/icons/wh_logo.png";
  static const String onboardingPattern = "assets/images/onbo.png";
  static const String faceId = "assets/icons/face.svg";
  static const String touchId = "assets/icons/fing.svg";
  static const String check = "assets/icons/done.svg";
  static const String currentStep = "assets/icons/currentst.svg";
  static const String upcomingStep = "assets/icons/un.svg";



}
