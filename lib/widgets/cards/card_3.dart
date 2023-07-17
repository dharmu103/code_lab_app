import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_lab/controllers/home_controller.dart';
import 'package:code_lab/localStorage/pref.dart';
import 'package:code_lab/models/HomePage_dela.dart';
import 'package:code_lab/models/deals_model.dart';
import 'package:code_lab/routes/pages.dart';
import 'package:code_lab/screens/homeScreens/main_home.dart';
import 'package:code_lab/theme/colors.dart';
import 'package:code_lab/widgets/buttons/get_code.dart';
import 'package:code_lab/widgets/cards/card_4.dart';
import 'package:code_lab/widgets/dailogs/code_dailog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

Widget card3(context, HomeDeals deal) {
  final c = Get.find<HomeController>();
  return Padding(
    padding: const EdgeInsets.only(
      left: 10.0,
      top: 5,
      bottom: 5,
    ),
    child: Container(
      width: Get.width * 0.4 - 18,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 0.1, spreadRadius: 0.01)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Spacer(),
                // Icon(
                //   Icons.heart_broken,
                //   size: 15,
                //   color: Colors.grey,
                // ),
                InkWell(
                  onTap: () {
                    Share.share('check out my website ${deal.link}',
                        subject: 'Look what I made!');
                  },
                  child: const Icon(
                    Icons.share_sharp,
                    size: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
                width: 70,
                height: 70,
                // child: Image.asset(
                //   "assets/images/flipkart-icon.png",
                // ),
                child: deal.image == null
                    ? Image.asset("assets/images/no-image.png")
                    : CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: deal.image.toString(),
                        placeholder: (_, e) => Shimmer.fromColors(
                          child: Container(
                            color: kWhite,
                          ),
                          baseColor: Colors.grey.shade100,
                          highlightColor: Colors.grey.shade300,
                        ),
                      )),
          ),
          // : Image.network(
          //     deal.image.toString(),
          //     fit: BoxFit.fill,
          //   )),
          Container(
            height: 50,
            // color: Colors.green,
            padding: const EdgeInsets.all(8.0),
            child: LocalStorage.language == "Arabic"
                ? AutoSizeText(
                    deal.descriptionArabic.toString(),
                    maxLines: 2,
                    minFontSize: 14,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  )
                : AutoSizeText(
                    deal.description.toString(),
                    maxLines: 2,
                    minFontSize: 14,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
          ),
          // Container(
          //     width: Get.width,
          //     padding: EdgeInsets.all(4),
          //     child: ElevatedButton(onPressed: () {}, child: Text("Get Code")))
          Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              width: Get.width,
              child: GetCode(
                text: deal.coupon == "" ? 'Get Deal' : 'Get Code',
                onpress: () {
                  if (deal.coupon == "") {
                    launchUrlDeal(deal);
                  } else {
                    c.reset = false;
                    codeDailog(context, deal);
                  }
                },
              )),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    ),
  );
}

Widget seeAllcard3() {
  final c = Get.find<HomeController>();
  return Padding(
    padding: const EdgeInsets.only(
      left: 10.0,
      top: 5,
      bottom: 5,
    ),
    child: Container(
        width: Get.width * 0.4 - 18,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 0.1, spreadRadius: 0.01)
            ]),
        child: TextButton(
          child: Text("See All"),
          onPressed: () {
            Get.toNamed(Routes.BRANDS);
          },
        )),
  );
}
