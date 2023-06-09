import 'package:code_lab/controllers/home_controller.dart';
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
                          itemCount: controller.stores!.stores!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            if (index == 0) {
                              return Container(
                                  margin: const EdgeInsets.only(left: 8.0),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(
                                          controller.stores!.stores![index].logo
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
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            radius: 50,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: Image.network(
                                                controller
                                                    .stores!.stores![index].logo
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
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                    controller.stores!.stores![index].logo
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
                          itemCount: controller.stores!.deals!.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: ((context, index) {
                            return card4(
                                context, controller.stores!.deals![index]);
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
