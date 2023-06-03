import 'package:code_lab/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomChips extends StatefulWidget {
  const CustomChips({super.key});

  @override
  State<CustomChips> createState() => _ChipsState();
}

class _ChipsState extends State<CustomChips> {
  @override
  Widget build(BuildContext context) {
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
                        color: Colors.grey, blurRadius: 0.1, spreadRadius: 0.01)
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
