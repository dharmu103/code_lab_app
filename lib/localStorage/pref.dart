import 'package:code_lab/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends GetxController {
  static String? accessToken = '';
  static String? language = 'English'.tr;
  static String? country = 'UAE'.tr;
  RxBool notification = true.obs;
  @override
  void onInit() {
    setAccessToken();
    setLanguageToken();
    setCountryToken();
    // print(country);
    super.onInit();
  }

  setAccessToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString("accessToken") != null) {
      accessToken = pref.getString("accessToken").toString();
    } else {
      accessToken = "";
    }
    // print(accessToken);
    update();
  }

  setLanguageToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString("language") != null) {
      language = pref.getString("language").toString();
    } else {
      language = "English";
    }
    if (language == "Arabic") {
      Get.updateLocale(const Locale("ar", "UAE"));
    } else {
      Get.updateLocale(const Locale("en", "US"));
    }
    update();
  }

  setCountryToken() async {
    // print("object");

    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString("country") != null) {
      country = pref.getString("country").toString();
      print("$country    hu mai  ");
    } else {
      country = "UAE";
    }

    // Get.find<HomeController>().getStores();
    // Get.find<HomeController>().getDeals();

    update();
  }

  updataData() async {
    await Get.find<HomeController>().getStores();
    await Get.find<HomeController>().getDeals();
    update();
  }
}
