import 'package:code_lab/theme/colors.dart';
import 'package:code_lab/widgets/buttons/primary_button.dart';
import 'package:code_lab/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';
import '../../routes/pages.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
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
                  "create_a_new__account".tr,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                        child: textfields(
                            controller.fnameTextController, "f_name".tr, (v) {
                      return v.trim().toString().isNotEmpty
                          ? null
                          : "Please enter valid first name.";
                    })),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: textfields(
                            controller.lnameTextController, "l_name".tr, (v) {
                      return v.trim().toString().isNotEmpty
                          ? null
                          : "Please enter valid last name.";
                    })),
                  ],
                ),
                const SizedBox(
                  height: 25,
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
                  return v.trim().toString().isNotEmpty ||
                          v.toString().length < 8
                      ? null
                      : "Password must be atleast 8 characters.";
                }),
                const SizedBox(
                  height: 25,
                ),
                textfields(
                    controller.cpasswordTextController, "confirm_password".tr,
                    (v) {
                  v.trim().toString() == controller.passwordTextController.text
                      ? null
                      : "password should be same.";
                }),
                const SizedBox(
                  height: 35,
                ),
                GetBuilder<LoginController>(builder: (_) {
                  return PrimaryButton(
                      text: "signup".tr,
                      state: controller.btnstate,
                      onpress: () async {
                        if (formKey.currentState!.validate()) {
                          String? res =
                              await controller.signupWithEmailPassword();
                          if (res == "") {
                            Get.offAllNamed(Routes.HOME);
                          } else {
                            Get.snackbar("Signup Failed", res.toString(),
                                backgroundColor: Colors.red, colorText: kWhite);
                          }
                        }
                      });
                }),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("or".tr),
                  ],
                ),
                const SizedBox(
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
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset("assets/images/googleicon.png"),
                        ),
                        const Spacer(),
                        Text("create_with_google".tr),
                        const Spacer(),
                        const Spacer()
                      ],
                    ),
                    onPressed: () async {
                      String? res = await controller.signupWithThirdParty();
                      if (res == "") {
                        Get.toNamed(Routes.HOME);
                      } else {
                        Get.snackbar("Signup Failed", res.toString(),
                            backgroundColor: Colors.red, colorText: kWhite);
                      }
                    },
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("already_have_account".tr),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "login".tr,
                          style: const TextStyle(color: Colors.blue),
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
