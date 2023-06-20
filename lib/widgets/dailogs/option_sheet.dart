import 'package:code_lab/localStorage/pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

optionSheet(context, list, data) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          padding: EdgeInsets.all(24),
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
                    title: Text('${list[index]}'),
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
