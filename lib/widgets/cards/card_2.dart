import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

Widget card2(url) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 10.0,
      top: 5,
      bottom: 5,
    ),
    child: Container(
      // width: Get.width,
      // height: Get.width * 0.2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: CachedNetworkImageProvider(
              url,
            ),
          ),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 0.1, spreadRadius: 0.01)
          ]),
    ),
  );
}

Widget BannerCard(url) {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0, top: 5, bottom: 5, right: 10),
    child: Container(
      width: Get.width,
      height: Get.width * 0.3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: CachedNetworkImageProvider(
              url,
            ),
          ),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 0.1, spreadRadius: 0.01)
          ]),
    ),
  );
}

Widget democard2() {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0, top: 5, bottom: 5, right: 10),
    child: Container(
      width: Get.width,
      height: Get.width * 0.3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          // image: DecorationImage(image: NetworkImage("url")),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 0.1, spreadRadius: 0.01)
          ]),
    ),
  );
}

Widget simmercard2() {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0, top: 5, bottom: 5, right: 10),
    child: Shimmer.fromColors(
      period: const Duration(seconds: 4),
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey.shade300,
      child: Container(
        width: Get.width,
        height: Get.width * 0.3,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 0.1, spreadRadius: 0.01)
            ]),
      ),
    ),
  );
}
