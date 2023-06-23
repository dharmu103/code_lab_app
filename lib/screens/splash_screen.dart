import 'package:code_lab/controllers/login_controller.dart';
import 'package:code_lab/localStorage/pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final s = Get.put(SplashController());
    // final lo = Get.put(LocalStorage());
    // final l = Get.put(LoginController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: Get.width * 0.6,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: SizedBox(
                width: 20, height: 20, child: CircularProgressIndicator()),
          )
        ],
      ),
    );
  }
}
