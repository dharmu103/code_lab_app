import 'package:code_lab/localStorage/pref.dart';
import 'package:code_lab/screens/authScreens/login_screen.dart';
import 'package:code_lab/screens/authScreens/signup_screen.dart';
import 'package:code_lab/screens/homeScreens/main_home.dart';
import 'package:code_lab/screens/splash_screen.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const MainHome(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignupScreen(),
    )
  ];
}
