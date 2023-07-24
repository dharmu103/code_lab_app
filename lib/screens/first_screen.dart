import 'package:code_lab/models/country_list.dart';
import 'package:code_lab/routes/pages.dart';
import 'package:code_lab/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../localStorage/pref.dart';
import '../widgets/buttons/primary_button.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String? country = "";
  String? language = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  "Please choose your location & language",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        border:
                            UnderlineInputBorder(borderSide: BorderSide.none)),
                    borderRadius: BorderRadius.circular(12),
                    hint: Text("Preferred Language"),
                    items: [
                      DropdownMenuItem(
                        value: "English",
                        child: Text("English"),
                      ),
                      DropdownMenuItem(
                        value: "Arabic",
                        child: Text("Arabic"),
                      )
                    ],
                    onChanged: (v) {
                      language = v;
                    }),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GetBuilder<LocalStorage>(
              builder: (_) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<dynamic>(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none)),
                        borderRadius: BorderRadius.circular(12),
                        hint: Text("Your Location"),
                        items: _.countries!.countries
                            ?.map((e) => DropdownMenuItem(
                                value: e.name.toString(),
                                child: Text(e.name.toString())))
                            .toList(),
                        onChanged: (v) {
                          country = v;
                        }),
                  ),
                );
              },
            ),
            SizedBox(
              height: 40,
            ),
            Spacer(),
            GetBuilder<LocalStorage>(
              builder: (_) {
                return PrimaryButton(
                  text: 'Save',
                  onpress: () async {
                    if (country != "" && language != "") {
                      final pref = await SharedPreferences.getInstance();
                      pref.setString("country", country!);
                      pref.setString("language", language!);
                      pref.setBool("isFirstTime", false);
                      _.setCountryToken();
                      _.setLanguageToken();

                      Get.toNamed(Routes.HOME);
                    }
                  },
                  state: ButtonState.idle,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
