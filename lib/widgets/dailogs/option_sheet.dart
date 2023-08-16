import 'package:code_lab/localStorage/pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/home_controller.dart';

optionSheet(context, list, data) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: List.generate(
                list.length,
                (index) => ListTile(
                    trailing: GetBuilder<LocalStorage>(builder: (_) {
                      return Checkbox(
                        value: data == 'language'
                            ? LocalStorage.language == list[index]
                                ? true
                                : false
                            : LocalStorage.country == list[index]
                                ? true
                                : false,
                        onChanged: (v) async {
                          print(index);

                          final pref = await SharedPreferences.getInstance();
                          pref.setString(data, list[index]);
                          Get.find<LocalStorage>().setCountryToken();
                          Get.find<LocalStorage>().setLanguageToken();
                        },
                      );
                    }),
                    title: Text('${list[index]}'.tr),
                    onTap: () async {
                      print(index);
                      print(data);
                      final pref = await SharedPreferences.getInstance();
                      pref.setString(data, list[index]);
                      Get.find<LocalStorage>().setCountryToken();
                      Get.find<LocalStorage>().setLanguageToken();
                    })),
          ),
        );
      });
}

optionSheetCountry(context, list, data) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: List.generate(
                list.length,
                (index) => ListTile(
                    trailing: GetBuilder<LocalStorage>(builder: (_) {
                      return Checkbox(
                        value: data == 'language'
                            ? LocalStorage.language == list[index]
                                ? true
                                : false
                            : LocalStorage.country == list[index]
                                ? true
                                : false,
                        onChanged: (v) async {
                          print(index);

                          final pref = await SharedPreferences.getInstance();
                          await pref.setString(data, list[index]);
                          await Get.find<LocalStorage>().setCountryToken();
                          Get.dialog(
                              const Center(child: CircularProgressIndicator()));
                          await Get.find<LocalStorage>().updataData();
                          Future.delayed(const Duration(seconds: 1));

                          // Get.find<LocalStorage>().setLanguageToken();
                          Get.back();
                        },
                      );
                    }),
                    title: Text('${list[index]}'),
                    onTap: () async {
                      // print(index);
                      // print(data);
                      final pref = await SharedPreferences.getInstance();
                      await pref.setString(data, list[index]);
                      await Get.find<LocalStorage>().setCountryToken();
                      // Get.find<LocalStorage>().setLanguageToken();
                      Get.dialog(
                          const Center(child: CircularProgressIndicator()));
                      await Get.find<LocalStorage>().updataData();
                      await Future.delayed(const Duration(seconds: 1));

                      // Get.find<LocalStorage>().setLanguageToken();
                      Get.back();
                    })),
          ),
        );
      });
}
