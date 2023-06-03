import 'package:code_lab/controllers/home_controller.dart';
import 'package:code_lab/controllers/login_controller.dart';
import 'package:code_lab/localStorage/pref.dart';
import 'package:code_lab/routes/pages.dart';
import 'package:code_lab/theme/colors.dart';
import 'package:code_lab/widgets/cards/card_1.dart';
import 'package:code_lab/widgets/cards/card_2.dart';
import 'package:code_lab/widgets/search_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/cards/card_3.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final pref = Get.put(LocalStorage());
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

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    child: Row(
                      children: [
                        Text("Top Stores",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.width * 0.3 - 8,
                    child: GetBuilder<HomeController>(builder: (_) {
                      if (_.stores!.message != "Success") {
                        return Container(
                            // child: Text("data"),
                            );
                      }
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: _.stores!.stores!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            if (_.stores!.stores!.length <= index) {
                              return Container();
                            }
                            if (index == 0) {
                              return Container(
                                margin: const EdgeInsets.only(left: 8.0),
                                child: card1(_.stores!.stores![index].logo),
                              );
                            }
                            if (index == 9) {
                              return Container(
                                margin: const EdgeInsets.only(right: 18.0),
                                child: card1(_.stores!.stores![index].logo),
                              );
                            }
                            return card1(_.stores!.stores![index].logo);
                          }));
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: card2(),
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
                              const Text(" Onboard Hear"),
                              const SizedBox(
                                height: 8,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.LOGIN);
                                },
                                child: Text(
                                  "Login / Signup",
                                  style: TextStyle(
                                      fontSize: 18, color: primaryColor),
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    child: Row(
                      children: [
                        Text("Top Coupons and Deals",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.width * 0.6 + 10,
                    child: GetBuilder<HomeController>(builder: (_) {
                      if (_.stores!.message != "Success") {
                        return Container(
                          child: Text("data"),
                        );
                      }
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: _.stores!.deals!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            if (index == 0) {
                              return Container(
                                margin: const EdgeInsets.only(left: 8.0),
                                child: card3(context, _.stores!.deals![index]),
                              );
                            }
                            if (index == 9) {
                              return Container(
                                margin: const EdgeInsets.only(right: 18.0),
                                child: card3(context, _.stores!.deals![index]),
                              );
                            }
                            return card3(context, _.stores!.deals![index]);
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
