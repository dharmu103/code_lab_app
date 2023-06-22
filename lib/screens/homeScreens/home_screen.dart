import 'package:code_lab/controllers/home_controller.dart';
import 'package:code_lab/localStorage/pref.dart';
import 'package:code_lab/routes/pages.dart';
import 'package:code_lab/services/remote_services.dart';
import 'package:code_lab/theme/colors.dart';
import 'package:code_lab/widgets/cards/card_1.dart';
import 'package:code_lab/widgets/cards/card_2.dart';
import 'package:code_lab/widgets/search_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../widgets/cards/card_3.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(HomeController());
    // final pref = Get.put(LocalStorage());
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: Get.width,
              child: Column(
                children: [
                  searchBox(),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: Row(
                      children: [
                        Text("top_stores".tr,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.width * 0.3 - 8,
                    child: GetBuilder<HomeController>(builder: (_) {
                      if (_.brands!.message != "Success" &&
                          _.brands!.brands == null) {
                        // ListView.builder(
                        //     shrinkWrap: true,
                        //     physics: const ScrollPhysics(),
                        //     itemCount: 5,
                        //     scrollDirection: Axis.horizontal,
                        //     itemBuilder: ((context, index) {
                        //       if (index == 0) {
                        //         return Container(
                        //           margin: const EdgeInsets.only(left: 8.0),
                        //           child: Shimmer.fromColors(
                        //               highlightColor: Colors.grey.shade100,
                        //               baseColor: Colors.grey.shade100,
                        //               child: card1(_.brands!.brands![index])),
                        //         );
                        //       }
                        //       if (index == 9) {
                        //         return Container(
                        //           margin: const EdgeInsets.only(right: 18.0),
                        //           child: Shimmer.fromColors(
                        //               highlightColor: Colors.grey.shade100,
                        //               baseColor: Colors.grey.shade100,
                        //               child: Container()),
                        //         );
                        //       }
                        //       return Shimmer.fromColors(
                        //           highlightColor: Colors.grey.shade100,
                        //           baseColor: Colors.grey.shade100,
                        //           child: Container());
                        //     }));
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (_.brands!.brands!.isEmpty) {
                        return const Center(child: Text("No Store Found"));
                      }
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: _.brands!.brands?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            if (_.brands!.brands!.length <= index) {
                              return Container();
                            }
                            if (index == 0) {
                              return Container(
                                margin: const EdgeInsets.only(left: 8.0),
                                child: card1(_.brands!.brands![index]),
                              );
                            }
                            if (index == 9) {
                              return Container(
                                margin: const EdgeInsets.only(right: 18.0),
                                child: card1(_.brands!.brands![index]),
                              );
                            }
                            return card1(_.brands!.brands![index]);
                          }));
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder(
                        future: getBanner(),
                        builder: (c, s) {
                          if (s.hasData) return card2(s.data);
                          return democard2();
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder<LocalStorage>(builder: (_) {
                    return Visibility(
                      visible: LocalStorage.accessToken == "" ||
                              LocalStorage.accessToken == "null"
                          ? true
                          : false,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(Icons.login),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("onboard_here".tr),
                              const SizedBox(
                                height: 8,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.LOGIN);
                                },
                                child: Text(
                                  "login".tr + " / " + 'signup'.tr,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: ThemeData.light().primaryColor),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
                  // ListTile(
                  //   leading: Icon(Icons.login),
                  //   title: Text("  Onboard Hear"),
                  //   horizontalTitleGap: 0,
                  //   minVerticalPadding: 0,
                  //   subtitle: Row(
                  //     children: [
                  //       TextButton(
                  //           onPressed: () {},
                  //           child: Text("Login"),
                  //           style: TextButton.styleFrom(
                  //               padding: EdgeInsets.zero,
                  //               minimumSize: Size.zero)),
                  //       Text("/ "),
                  //       TextButton(
                  //           onPressed: () {},
                  //           child: Text("Signup"),
                  //           style: TextButton.styleFrom(
                  //               padding: EdgeInsets.zero, minimumSize: Size.zero))
                  //     ],
                  //   ),
                  // )
                  Visibility(
                    visible: LocalStorage.accessToken! == "" ? true : false,
                    child: const SizedBox(
                      height: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: Row(
                      children: [
                        Text("top_coupons_and_deals".tr,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.width * 0.6 + 10,
                    child: GetBuilder<HomeController>(builder: (_) {
                      if (_.brands!.message != "Success") {
                        // return ListView.builder(
                        //     shrinkWrap: true,
                        //     physics: const ScrollPhysics(),
                        //     itemCount: 10,
                        //     scrollDirection: Axis.horizontal,
                        //     itemBuilder: ((context, index) {
                        //       if (index == 0) {
                        //         return Container(
                        //           margin: const EdgeInsets.only(left: 8.0),
                        //           child: democard3(context),
                        //         );
                        //       }
                        //       if (index == 9) {
                        //         return Container(
                        //           margin: const EdgeInsets.only(right: 18.0),
                        //           child: democard3(context),
                        //         );
                        //       }
                        //       return democard3(context);
                        //     }));
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (_.brands!.brands!.isEmpty) {
                        return const Center(child: Text("No Deals Found"));
                      }
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: _.homeModel?.deals?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            if (index == 0) {
                              return Container(
                                margin: const EdgeInsets.only(left: 8.0),
                                child:
                                    card3(context, _.homeModel!.deals![index]),
                              );
                            }
                            if (index == 9) {
                              return Container(
                                margin: const EdgeInsets.only(right: 18.0),
                                child:
                                    card3(context, _.homeModel!.deals![index]),
                              );
                            }
                            return card3(context, _.homeModel!.deals![index]);
                          }));
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
          // Positioned(top: 20, child: searchBox()),
        ],
      )),
    );
  }
}

getBanner() {
  var res = RemoteService.getBanner();
  return res;
}
