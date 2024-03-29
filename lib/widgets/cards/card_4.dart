import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_lab/color_constant.dart';
import 'package:code_lab/localStorage/pref.dart';
import 'package:code_lab/models/HomePage_dela.dart';
import 'package:code_lab/theme/colors.dart';
import 'package:code_lab/widgets/buttons/get_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlDeal(deal) async {
  if (!await launchUrl(Uri.parse(deal.link.toString()),
      mode: LaunchMode.externalApplication)) {
    print("object");
    throw Exception('Could not launch ${deal.link}');
  }
}

Widget card4(context, HomeDeals deal) {
  return Padding(
    padding: const EdgeInsets.only(
      right: 10,
      left: 10.0,
      top: 5,
      bottom: 5,
    ),
    child: Container(
      width: Get.width * 0.37 - 18,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 0.1, spreadRadius: 0.01)
          ]),
      child: Column(
        children: [
          // const Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Row(
          //     children: [
          //       Spacer(),
          //       // Icon(
          //       //   Icons.heart_broken,
          //       //   size: 15,
          //       //   color: Colors.grey,
          //       // ),
          //       Icon(
          //         Icons.share_sharp,
          //         size: 15,
          //         color: Colors.grey,
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 100,
                  height: 70,
                  // color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: SizedBox(
                        width: 70,
                        height: 70,
                        child: deal.image == null
                            ? Image.asset("assets/images/no-image.png")
                            : CachedNetworkImage(
                                imageUrl: deal.image.toString(),
                                fit: BoxFit.fill,
                              )),
                    // : Image.network(
                    //     deal.image.toString(),
                    //     fit: BoxFit.fill,
                    //   )),
                    // child:Image.network(deal.),
                  ),
                ),
                const Spacer(),
                deal.coupon == ""
                    ? Container()
                    : SizedBox(
                        width: Get.width * 0.4,
                        child: CopyCode(
                          text: deal.coupon,
                          onpress: () async {
                            await Clipboard.setData(
                                ClipboardData(text: deal.coupon.toString()));
                            // copied successfully
                          },
                        )),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          Container(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: LocalStorage.language == 'Arabic'
                  ? Text(
                      deal.descriptionArabic.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(deal.description.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
            ),
          ),
          // Container(
          //     width: Get.width,
          //     padding: EdgeInsets.all(4),
          //     child: ElevatedButton(onPressed: () {}, child: Text("Get Code")))
          // Container(
          //     width: Get.width * 0.9,
          //     child: GetCode(
          //       onpress: () {
          //         // codeDailog(context, index);
          //       },
          //     )),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: ColorConstant.fromHex("#F6F5F7"),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  'used'.tr +
                      ' ' +
                      '${deal.usedTimes ?? ""}' +
                      ' ' +
                      'times'.tr,
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: ColorConstant.fromHex("#E6FEE6"),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  "LAST USED" + " " + '${deal.lastUsed ?? ""} ',
                  style: TextStyle(
                      color: ColorConstant.fromHex("#00682F"),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor, foregroundColor: kWhite),
                  onPressed: () => launchUrlDeal(deal),
                  child: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(CupertinoIcons.share),
                        Text("shop_now".tr)
                      ],
                    ),
                  )),
              const Spacer(),
              IconButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstant.yellow700,
                ),
                onPressed: () {
                  if (deal.coupon != null) {
                    Share.share(
                        LocalStorage.language == "English"
                            ? '${deal.description} use code *${deal.coupon}*   ${deal.link}'
                            : '${deal.descriptionArabic} use code *${deal.coupon}*   ${deal.link}',
                        subject: 'Look what I made!');
                  } else {
                    Share.share(
                        LocalStorage.language == "English"
                            ? '${deal.description}    ${deal.link}'
                            : '${deal.descriptionArabic}    ${deal.link}',
                        subject: 'Look what I made!');
                  }
                },
                icon: CircleAvatar(
                  backgroundColor: ColorConstant.yellow700,
                  child: Icon(
                    Icons.share,
                    color: primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    ),
  );
}
