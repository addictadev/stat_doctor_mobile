import 'package:stat_doctor/features/auth/controller/auth_controller.dart';
import 'package:stat_doctor/features/auth/controller/registration_controller.dart';
import 'package:provider/provider.dart';


class MultiProviders {
  static List<ChangeNotifierProvider> providers() {
    return [
      ChangeNotifierProvider<AuthController>(
        create: (context) => AuthController(),
      ),
      ChangeNotifierProvider<RegistrationController>(
        create: (context) => RegistrationController(),
      ),
    ];
  }
}
