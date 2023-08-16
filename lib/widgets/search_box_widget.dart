import 'package:code_lab/routes/pages.dart';
import 'package:code_lab/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget searchBox() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      width: Get.width - 36,
      decoration: BoxDecoration(
          color: kWhite,
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
              readOnly: true,
              onTap: () {
                Get.toNamed(Routes.SEARCH);
              },
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "search_here".tr),
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

Widget searchBoxField(onchange(v)) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      width: Get.width - 36,
      decoration: BoxDecoration(
          color: kWhite,
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
              autofocus: true,
              onTap: () {},
              onChanged: (v) {
                onchange(v);
              },
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "search_here".tr),
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
