import 'package:code_lab/controllers/home_controller.dart';
import 'package:code_lab/models/deals_model.dart';
import 'package:code_lab/theme/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future codeDailog(context, DealsModel deal) {
  return showModalBottomSheet(
      // isScrollControlled: true,

      // constraints: BoxConstraints.loose(Get.size),
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              deal.image == null
                  ? Image.asset("assest/images/no-image.png")
                  : Image.network(
                      deal.image.toString(),
                      height: 70,
                    ),
              const SizedBox(
                height: 20,
              ),
              Text(deal.description.toString()),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.1, color: Colors.grey.shade300),
                    color: kWhite,
                    borderRadius: BorderRadius.circular(24)),
                child: DottedBorder(
                  dashPattern: [5, 5],
                  borderType: BorderType.RRect,
                  color: Colors.black54,
                  radius: Radius.circular(24),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        Text(
                          deal.coupon.toString(),
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 50,
                          height: 40,
                          child: copyBtnIcon(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      });
}

class copyBtnIcon extends StatefulWidget {
  const copyBtnIcon({
    super.key,
  });

  @override
  State<copyBtnIcon> createState() => _copyBtnIconState();
}

class _copyBtnIconState extends State<copyBtnIcon> {
  @override
  Widget build(BuildContext context) {
    final c = Get.find<HomeController>();

    return GetBuilder<HomeController>(builder: (_) {
      return IconButton(
        tooltip: "copy",
        padding: EdgeInsets.zero,
        icon: c.reset == false
            ? Icon(Icons.copy_all_outlined)
            : const Icon(
                Icons.check,
                color: Colors.green,
              ),
        onPressed: () async {
          c.reset = true;
          c.update();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Code Coppied Succesfully",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ));
          await Clipboard.setData(
              ClipboardData(text: "deal.coupon.toString()hhhhhhhhhh"));
        },
      );
    });
  }
}
