import 'package:code_lab/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

Widget card1(logo) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 10.0,
      top: 5,
      bottom: 5,
    ),
    child: Container(
      width: Get.width * 0.3 - 18,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: logo == null
            ? Image.asset("assets/images/no-image.png")
            : ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: logo,
                  placeholder: (context, url) => Shimmer.fromColors(
                      period: const Duration(seconds: 4),
                      child: Container(
                        color: kWhite,
                      ),
                      baseColor: Colors.grey.shade100,
                      highlightColor: Colors.grey.shade300),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
      ),
      // : Image.network(
      //     logo,
      //     fit: BoxFit.fill,
      //     width: Get.width * 0.2,
      //   )),

      decoration: BoxDecoration(
          // image: DecorationImage(
          //     image: CachedNetworkImageProvider(
          //       logo,
          //     ),
          //     fit: BoxFit.fill),
          color: kWhite,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 0.1, spreadRadius: 0.01)
          ]),
    ),
  );
}
