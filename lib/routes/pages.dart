import 'package:code_lab/screens/authScreens/login_screen.dart';
import 'package:code_lab/screens/authScreens/signup_screen.dart';
import 'package:code_lab/screens/homeScreens/main_home.dart';
import 'package:get/get.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const MainHome(),
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
