import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';

import '../../theme/colors.dart';

class PrimaryButton extends StatefulWidget {
  PrimaryButton(
      {super.key, required this.text, required this.state, this.onpress});
  String text;
  ButtonState state;
  var onpress;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      height: 50,
      width: Get.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: widget.state == ButtonState.fail
                  ? Colors.red
                  : widget.state == ButtonState.success
                      ? Colors.green
                      : widget.state == ButtonState.idle
                          ? Colors.indigo
                          : Colors.indigo,
              foregroundColor: kWhite),
          child: widget.state == ButtonState.fail
              ? SizedBox(
                  height: 50,
                  width: 50,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        CupertinoIcons.nosign,
                        color: kWhite,
                      )),
                )
              : widget.state == ButtonState.success
                  ? SizedBox(
                      height: 50,
                      width: 50,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            CupertinoIcons.check_mark,
                            color: kWhite,
                          )),
                    )
                  : widget.state == ButtonState.idle
                      ? Text(widget.text.toString())
                      : SizedBox(
                          height: 50,
                          width: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              color: kWhite,
                            ),
                          ),
                        ),
          onPressed: widget.state == ButtonState.idle ? widget.onpress : () {}),
    );
  }
}
