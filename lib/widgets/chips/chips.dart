import 'package:code_lab/color_constant.dart';
import 'package:code_lab/controllers/home_controller.dart';
import 'package:code_lab/localStorage/pref.dart';
import 'package:code_lab/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/categories_list_model.dart';

class CustomChips extends StatefulWidget {
  CustomChips({super.key, required this.categories});
  Categories categories;

  @override
  State<CustomChips> createState() => _ChipsState();
}

bool seleted = false;

class _ChipsState extends State<CustomChips> {
  @override
  Widget build(BuildContext context) {
    final c = Get.find<HomeController>();
    return GetBuilder<HomeController>(builder: (_) {
      return Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            top: 5,
            bottom: 5,
          ),
          child: GestureDetector(
            onTap: () async {
              // setState(() {
              //   seleted = !seleted;
              // });

              Get.find<HomeController>()
                  .filterDeal(widget.categories.name.toString());
            },
            child: Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: kWhite,
                        border: c.filterText == widget.categories.name
                            ? Border.all(color: ColorConstant.blue, width: 2)
                            : null,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.1,
                              spreadRadius: 0.01)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          // Icon(Icons.abc),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            LocalStorage.language == "English"
                                ? widget.categories.name.toString()
                                : widget.categories.nameArabic.toString(),
                            style: c.filterText == widget.categories.name
                                ? TextStyle(color: ColorConstant.blue)
                                : null,
                          )
                        ],
                      ),
                    )),
                // Positioned(
                //     top: 0,
                //     right: 0,
                //     child: Icon(
                //       Icons.close,
                //       size: 16,
                //       weight: 100,
                //       color: ColorConstant.blue,
                //     ))
              ],
            ),
          ));
    });
  }
}

Widget customChips(label, icon, bgcolor) {
  return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        top: 5,
        bottom: 5,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Container(
            decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 2, spreadRadius: 0.1)
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.abc),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Fashion")
                ],
              ),
            )),
      ));
}
