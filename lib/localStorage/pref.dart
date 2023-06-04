import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends GetxController {
  static String? accessToken = '';
  static String? language = 'None';
  static String? country = 'None';

  @override
  void onInit() {
    setAccessToken();
    setLanguageToken();
    print(language);
    print(country);
    super.onInit();
  }

  setAccessToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString("accessToken") != null) {
      accessToken = pref.getString("accessToken").toString();
    } else {
      accessToken = "";
    }

    update();
  }

  setLanguageToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString("language") != null) {
      language = pref.getString("language").toString();
    } else {
      language = "None";
    }
    if (language == "Arabic") {
      print(language);
      Get.updateLocale(const Locale("ar", "UAE"));
    } else {
      print(language);
      Get.updateLocale(const Locale("en", "US"));
    }
    update();
    print(language);
  }

  setCountryToken() async {
    print("object");
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString("country") != null) {
      country = pref.getString("country").toString();
    } else {
      country = "None";
    }

    update();
  }
}
