import 'package:carousel_slider/carousel_slider.dart';
import 'package:code_lab/models/carousel_list.dart';
import 'package:code_lab/screens/details/details_screen.dart';
import 'package:code_lab/widgets/cards/card_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

Widget carousels(CarouselList? carouselList) {
  return Column(
    children: List.generate(
        carouselList?.carousel?.length ?? 0,
        (index) => Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: Row(
                    children: [
                      Text(carouselList?.carousel?[index].header ?? "",
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      height: Get.width * 0.55,
                      viewportFraction: 0.35),
                  items: carouselList?.carousel![index].images?.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            padding: EdgeInsets.zero,
                            // child: card2(
                            //     "http://54.159.201.11:3000/app/no-auth/file/sojeyiizaaartfr.jpg"),
                            child: GetBuilder<HomeController>(
                              builder: (_) {
                                return GestureDetector(
                                  onTap: () => Get.to(
                                    TopDeal(
                                        args: _.brands!.brands!.singleWhere(
                                            (element) =>
                                                element.sId == i.store)),
                                  ),
                                  child: card2(i.link),
                                );
                              },
                            ));
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )),
  );
}
