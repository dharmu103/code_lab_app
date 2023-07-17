import 'package:code_lab/controllers/home_controller.dart';
import 'package:code_lab/localStorage/pref.dart';
import 'package:code_lab/models/banner_list_model.dart';
import 'package:code_lab/models/carousel_list.dart';
import 'package:code_lab/routes/pages.dart';
import 'package:code_lab/screens/details/details_screen.dart';
import 'package:code_lab/screens/search_screen.dart';
import 'package:code_lab/services/remote_services.dart';
import 'package:code_lab/theme/colors.dart';
import 'package:code_lab/widgets/cards/card_1.dart';
import 'package:code_lab/widgets/cards/card_2.dart';
import 'package:code_lab/widgets/carousel.dart';
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
          body: Container(
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [
            //     Colors.lightBlue.shade300.withOpacity(.08),
            //     Colors.lightBlue.shade100.withOpacity(0.8)
            //   ],
            // ),
            ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    // Image.asset(
                    //   "assets/images/logo.png",
                    //   height: 40,
                    // ),
                    Text(
                      "CODELAB",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Container(height: 70, child: searchBox()),

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
                            itemCount: _.brands!.brands!.length >= 5
                                ? 6
                                : _.brands!.brands?.length ?? 0,
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
                              if (index == _.brands!.brands!.length - 1) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 18.0),
                                  child: card1(_.brands!.brands![index]),
                                );
                              }
                              if (index == 5) {
                                return Container(
                                    margin: const EdgeInsets.only(right: 18.0),
                                    child: seeAllcard1());
                              }
                              return card1(_.brands!.brands![index]);
                            }));
                      }),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<HomeController>(builder: (_) {
                      return carousels(_.carouselList);
                    }),

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
                                Text(
                                  "onboard_here".tr,
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
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
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold),
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
                            itemCount: _.homeModel?.deals?.length == null
                                ? 0
                                : _.homeModel!.deals!.length >= 5
                                    ? 6
                                    : _.homeModel?.deals?.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              if (index == 0) {
                                return Container(
                                  margin: const EdgeInsets.only(left: 8.0),
                                  child: card3(
                                      context, _.homeModel!.deals![index]),
                                );
                              }
                              if (index == _.homeModel!.deals!.length - 1) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 18.0),
                                  child: card3(
                                      context, _.homeModel!.deals![index]),
                                );
                              }
                              if (index == 5) {
                                return Container(
                                    margin: const EdgeInsets.only(right: 18.0),
                                    child: seeAllcard3());
                              }
                              return card3(context, _.homeModel!.deals![index]);
                            }));
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FutureBuilder<BannerList?>(
                          future: getBanner(),
                          builder: (c, s) {
                            if (s.hasError) {
                              return Container(
                                child: Text("error"),
                              );
                            }
                            if (s.hasData) {
                              return Column(
                                children: List.generate(
                                    s.data?.banner?.length ?? 0,
                                    (index) => Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: GetBuilder<HomeController>(
                                            init: HomeController(),
                                            initState: (_) {},
                                            builder: (_) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Get.to(TopDeal(
                                                      args: _.brands!.brands!
                                                          .firstWhere(
                                                              (element) =>
                                                                  element.sId ==
                                                                  s
                                                                      .data
                                                                      ?.banner?[
                                                                          index]
                                                                      .store)));
                                                },
                                                child: BannerCard(
                                                  s.data?.banner?[index].image,
                                                ),
                                              );
                                            },
                                          ),
                                          // child: Text(
                                          //     s.data?.banner?[index].image ??
                                          //         "No Image"),
                                        )),
                              );
                            }
                            ;

                            return Container();
                          }),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(top: 20, child: searchBox()),
          ],
        ),
      )),
    );
  }
}

Future<BannerList?> getBanner() async {
  var res = await RemoteService.getBanner();
  print(res?.banner?.length ?? "No Banner Found");
  return res;
}
