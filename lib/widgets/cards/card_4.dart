import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_lab/localStorage/pref.dart';
import 'package:code_lab/models/deals_model.dart';
import 'package:code_lab/theme/colors.dart';
import 'package:code_lab/widgets/buttons/get_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

Widget card4(context, DealsModel deal) {
  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(deal.link.toString()),
        mode: LaunchMode.externalApplication)) {
      print("object");
      throw Exception('Could not launch ${deal.link}');
    }
  }

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 100,
                height: 70,
                color: Colors.grey.shade200,
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
              Container(
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
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: LocalStorage.language == 'Arabic'
                ? Text(deal.arabicDescription.toString())
                : Text(deal.description.toString()),
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
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  'used'.tr + ' ' + '13125' + ' ' + 'times'.tr,
                  style: TextStyle(color: Colors.indigo),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  "last_used".tr + " " + '6' + " " + "min_ago".tr,
                  style: TextStyle(color: kGreen),
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
                  onPressed: _launchUrl,
                  child: Container(
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
                    backgroundColor: Colors.grey.shade200,
                  ),
                  onPressed: () {
                    Share.share('check out my website ${deal.link}',
                        subject: 'Look what I made!');
                  },
                  icon: const Icon(
                    Icons.share,
                    color: Colors.indigo,
                  )),
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
