import 'package:code_lab/controllers/login_controller.dart';
import 'package:code_lab/routes/pages.dart';
import 'package:code_lab/theme/colors.dart';
import 'package:code_lab/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:progress_state_button/progress_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<LoginController>();
    final arg = Get.arguments;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "We have sent One Time on \nYour Email".tr,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Pinput(
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(30, 60, 87, 1),
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  length: 6,
                  onCompleted: (v) async {
                    print(v);
                    var res = await c.verifyOtp({"session_id": arg, "otp": v});
                    print("otp screen $res");
                    if (res == "") {
                      Get.snackbar("Successful", "Email verification done. ",
                          colorText: kWhite, backgroundColor: Colors.green);

                      await Future.delayed(Duration(seconds: 5), () {
                        Get.offAllNamed(Routes.HOME);
                      });
                    } else {
                      print("this run");
                      Get.snackbar("Error", "$res",
                          colorText: kWhite, backgroundColor: Colors.red);
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GetBuilder<LoginController>(
            init: LoginController(),
            initState: (_) {},
            builder: (_) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: PrimaryButton(
                    text: "Submit", state: c.btnstate, onpress: () {}),
              );
            },
          ),
        ],
      ),
    );
  }
}
