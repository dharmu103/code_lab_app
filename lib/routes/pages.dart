import 'package:code_lab/localStorage/pref.dart';
import 'package:code_lab/screens/authScreens/login_screen.dart';
import 'package:code_lab/screens/authScreens/signup_screen.dart';
import 'package:code_lab/screens/first_screen.dart';
import 'package:code_lab/screens/homeScreens/brands_screen.dart';
import 'package:code_lab/screens/homeScreens/main_home.dart';
import 'package:code_lab/screens/splash_screen.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';
import '../screens/search_screen.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.SELECTCOUNTRYANDLANGUAGE,
      page: () => const FirstScreen(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => MainHome(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignupScreen(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => const SearchScreen(),
    ),
    GetPage(
      name: Routes.BRANDS,
      page: () => const BrandsScreen(),
    )
  ];
}
