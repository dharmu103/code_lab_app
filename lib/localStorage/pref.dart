import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends GetxController {
  static String? accessToken = '';
  static String? language = '';

  @override
  void onInit() {
    setAccessToken();
    setLanguageToken();
    super.onInit();
  }

  setAccessToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString("accessToken") != null) {
      accessToken = pref.getString("accessToken").toString();
    }

    update();
  }

  setLanguageToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString("language") != null) {
      language = pref.getString("language").toString();
    }

    update();
  }
}
