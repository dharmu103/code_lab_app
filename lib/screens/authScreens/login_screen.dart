import 'package:code_lab/controllers/login_controller.dart';
import 'package:code_lab/routes/pages.dart';
import 'package:code_lab/widgets/buttons/primary_button.dart';
import 'package:code_lab/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "login_to_your_account".tr,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                textfields(controller.emailTextController, "email_id".tr, (v) {
                  return v.trim().toString().isEmail
                      ? null
                      : "Please enter valid email.";
                }),
                const SizedBox(
                  height: 25,
                ),
                textfields(controller.passwordTextController, "password".tr,
                    (v) {
                  if (v.toString().isNotEmpty) {
                    return null;
                  }
                  return "Please enter valid password.";
                }),
                const SizedBox(
                  height: 30,
                ),
                GetBuilder<LoginController>(builder: (_) {
                  return PrimaryButton(
                      text: "login".tr,
                      state: controller.btnstate,
                      onpress: () async {
                        // print("object");
                        if (formKey.currentState!.validate()) {
                          String? res =
                              await controller.loginWithEmailPassword();
                          if (res == "") {
                            Get.offAndToNamed(Routes.HOME);
                          } else {
                            Get.snackbar("Login Failed", res.toString(),
                                backgroundColor: Colors.red, colorText: kWhite);
                          }
                        }
                      });
                }),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("or"),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  width: Get.width,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 0.1),
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue),
                    child: Row(
                      children: [
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset("assets/images/googleicon.png"),
                        ),
                        Spacer(),
                        Text("login_with_google".tr),
                        Spacer(),
                        Spacer()
                      ],
                    ),
                    onPressed: () async {
                      var res = await controller.loginWithThirdParty();
                      if (res == "") {
                        Get.offAndToNamed(Routes.HOME);
                      } else {
                        Get.snackbar("Login Failed", res.toString(),
                            backgroundColor: Colors.red, colorText: kWhite);
                      }
                    },
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("dont_have_account".tr),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.SIGNUP);
                        },
                        child: Text(
                          "signup".tr,
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
