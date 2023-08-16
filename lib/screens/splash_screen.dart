import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../color_constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final s = Get.put(SplashController());
    // final lo = Get.put(LocalStorage());
    // final l = Get.put(LoginController());
    return Scaffold(
      backgroundColor: ColorConstant.yellow700,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Center(
              // child: Text(
              //   "CODELAB",
              //   style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              // ),
              child: Image.asset(
            "assets/images/Codatak-on-yellow-BG.png",
            width: Get.width * 0.6,
          )),
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
