import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_lab/controllers/home_controller.dart';
import 'package:code_lab/models/deals_model.dart';
import 'package:code_lab/theme/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../localStorage/pref.dart';
import '../../models/HomePage_dela.dart';

Future codeDailog(context, HomeDeals deal) {
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
                  : CachedNetworkImage(
                      imageUrl: deal.image.toString(),
                      fit: BoxFit.fill,
                      height: 70,
                      width: 100,
                    ),
              const SizedBox(
                height: 20,
              ),
              LocalStorage.language == 'Arabic'
                  ? Text(deal.descriptionArabic.toString())
                  : Text(deal.description.toString()),
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
                          child: copyBtnIcon(
                            coupon: deal.coupon,
                          ),
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
  copyBtnIcon({super.key, this.coupon});
  var coupon;

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
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "Code Coppied Succesfully",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ));
          await Clipboard.setData(
              ClipboardData(text: widget.coupon.toString()));
        },
      );
    });
  }
}

Future codeDailog2(context, Deal deal) {
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
                  : CachedNetworkImage(
                      imageUrl: deal.image.toString(),
                      fit: BoxFit.fill,
                      height: 70,
                      width: 100,
                    ),
              const SizedBox(
                height: 20,
              ),
              LocalStorage.language == 'Arabic'
                  ? Text(deal.descriptionArabic.toString())
                  : Text(deal.description.toString()),
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
                          child: copyBtnIcon(
                            coupon: deal.coupon,
                          ),
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

class copyBtnIcon2 extends StatefulWidget {
  copyBtnIcon2({super.key, this.coupon});
  var coupon;

  @override
  State<copyBtnIcon> createState() => _copyBtnIconState();
}

class _copyBtnIcon2State extends State<copyBtnIcon2> {
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
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "Code Coppied Succesfully",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ));
          await Clipboard.setData(
              ClipboardData(text: widget.coupon.toString()));
        },
      );
    });
  }
}
