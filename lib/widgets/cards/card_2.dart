import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget card2() {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0, top: 5, bottom: 5, right: 10),
    child: Container(
      width: Get.width,
      height: Get.width * 0.3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 0.1, spreadRadius: 0.01)
          ]),
    ),
  );
}
