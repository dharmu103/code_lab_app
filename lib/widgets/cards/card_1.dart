import 'package:code_lab/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget card1(logo) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 10.0,
      top: 5,
      bottom: 5,
    ),
    child: Container(
      width: Get.width * 0.3 - 18,
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: logo == null
              ? Image.asset("assets/images/no-image.png")
              : Image.network(
                  logo,
                  fit: BoxFit.fill,
                  width: Get.width * 0.2,
                )),
      decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 0.1, spreadRadius: 0.01)
          ]),
    ),
  );
}
