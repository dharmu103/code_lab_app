import 'package:auto_size_text/auto_size_text.dart';
import 'package:code_lab/theme/colors.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetCode extends StatefulWidget {
  GetCode({Key? key, this.onpress, this.text}) : super(key: key);
  Function? onpress;
  String? text;
  @override
  State<GetCode> createState() => _GetCodeState();
}

class _GetCodeState extends State<GetCode> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor, foregroundColor: kWhite),
        child: AutoSizeText(
          widget.text == null ? 'get_code'.tr : widget.text.toString(),
          maxLines: 1,
        ),
        onPressed: () {
          widget.onpress!();
        });
  }
}

class CopyCode extends StatefulWidget {
  CopyCode({Key? key, this.onpress, this.text}) : super(key: key);
  Function? onpress;
  String? text;
  @override
  State<CopyCode> createState() => _CopyCodeState();
}

bool selected = false;

class _CopyCodeState extends State<CopyCode> {
  @override
  void initState() {
    selected = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
    if (selected) {
      return DottedBorder(
          borderType: BorderType.RRect,
          dashPattern: [5, 4],
          radius: Radius.circular(24),
          child: Container(
            height: 40,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.text!.toUpperCase(), textAlign: TextAlign.center),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.check, color: Colors.green)
              ],
            )),
          ));
    }

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor, foregroundColor: kWhite),
        child: AutoSizeText(
          "copy_code".tr,
          maxLines: 1,
        ),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "code_copied_successfully".tr,
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ));
          widget.onpress!();
          setState(() {
            selected = true;
          });
          setState(() {});
        });
  }
}
