import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget searchBox() {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Container(
      height: 50,
      width: Get.width - 36,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 0.1, spreadRadius: 0.01)
          ]),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          const Icon(
            Icons.search,
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
    ),
  );
}
