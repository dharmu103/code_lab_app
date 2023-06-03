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
                const Text(
                  "Create a new\nAccount",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                        child: textfields(
                            controller.fnameTextController, "First name", (v) {
                      v.trim().toString().isEmpty
                          ? null
                          : "Please enter valid first name.";
                    })),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: textfields(
                            controller.lnameTextController, "Last name", (v) {
                      v.trim().toString().isEmpty
                          ? null
                          : "Please enter valid last name.";
                    })),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                textfields(controller.emailTextController, "Email", (v) {
                  v.trim().toString().isEmail
                      ? null
                      : "Please enter valid email.";
                }),
                const SizedBox(
                  height: 25,
                ),
                textfields(controller.passwordTextController, "Password", (v) {
                  v.trim().toString().isEmpty
                      ? null
                      : "Please enter valid password.";
                }),
                const SizedBox(
                  height: 25,
                ),
                textfields(
                    controller.cpasswordTextController, "Confirm-Password",
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
                      text: "Signup",
                      state: controller.btnstate,
                      onpress: () async {
                        if (formKey.currentState!.validate()) {
                          String? res =
                              await controller.signupWithEmailPassword();
                          if (res == "") {
                            Get.toNamed(Routes.HOME);
                          } else {
                            Get.snackbar("Signup Failed", res.toString(),
                                backgroundColor: Colors.red, colorText: kWhite);
                          }
                        }
                      });
                }),
                SizedBox(
                  height: 25,
                ),
                const Row(
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
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset("assets/images/googleicon.png"),
                        ),
                        Spacer(),
                        const Text("Create with google"),
                        Spacer(),
                        Spacer()
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Alread have an account?"),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Login",
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
