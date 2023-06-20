import 'package:code_lab/controllers/home_controller.dart';
import 'package:code_lab/screens/details/details_screen.dart';
import 'package:code_lab/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/cards/card_4.dart';
import '../../widgets/search_box_widget.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                width: Get.width,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 86,
                    ),
                    // SizedBox(
                    //   height: 50,
                    //   child: ListView.builder(
                    //       shrinkWrap: true,
                    //       physics: const ScrollPhysics(),
                    //       itemCount: 10,
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: ((context, index) {
                    //         if (index == 0) {
                    //           return CustomChips();
                    //         }

                    //         return GestureDetector(
                    //             onTap: () {}, child: const CustomChips());
                    //       })),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: controller.brands!.brands?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            if (index == 0) {
                              return Container(
                                  margin: const EdgeInsets.only(left: 8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(DetailsScreen(),
                                          arguments: controller
                                              .brands!.brands?[index]);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        backgroundColor: kWhite,
                                        radius: 50,
                                        backgroundImage: NetworkImage(
                                          controller.brands!.brands![index].logo
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                  ));
                            }
                            if (index == 9) {
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      margin: const EdgeInsets.only(left: 8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(DetailsScreen(),
                                              arguments: controller
                                                  .brands!.brands?[index]);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            backgroundColor: kWhite,
                                            radius: 50,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: Image.network(
                                                controller
                                                    .brands!.brands![index].logo
                                                    .toString(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )));
                            }
                            return Container(
                                // margin: const EdgeInsets.only(left: 8.0),
                                child: GestureDetector(
                              onTap: () {
                                Get.to(DetailsScreen(),
                                    arguments:
                                        controller.brands!.brands?[index]);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: kWhite,
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                    controller.brands!.brands![index].logo
                                        .toString(),
                                  ),
                                ),
                              ),
                            ));
                          })),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: controller.homeModel!.deals?.length ?? 0,
                          scrollDirection: Axis.vertical,
                          itemBuilder: ((context, index) {
                            return card4(
                                context, controller.homeModel!.deals![index]);
                          })),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              child: Container(
                width: Get.width,
                color: Colors.white,
                child: searchBox(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
