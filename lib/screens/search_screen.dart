import 'package:code_lab/controllers/home_controller.dart';
import 'package:code_lab/widgets/cards/card_3.dart';
import 'package:code_lab/widgets/cards/card_4.dart';
import 'package:code_lab/widgets/search_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/cards/card_1.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    searchBoxField((v) {
                      c.searchAlgo(v);
                    }),
                  ],
                ),
              ),
              Container(
                width: Get.width,
                child: GetBuilder<HomeController>(
                  init: HomeController(),
                  initState: (_) {},
                  builder: (_) {
                    return Column(children: [
                      SizedBox(
                        height: 100,
                      ),
                      _.searchLoading == true
                          ? Container(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(),
                            )
                          : Container(),
                      c.searchStore?.length == 0
                          ? Container()
                          : SizedBox(
                              height: 100,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount: c.searchStore?.length ?? 0,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: ((context, index) {
                                    return card1(c.searchStore![index]);
                                  })),
                            ),
                      SizedBox(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: c.searchDeal?.length ?? 0,
                            scrollDirection: Axis.vertical,
                            itemBuilder: ((context, index) {
                              return card4(context, c.searchDeal![index]);
                            })),
                      )
                    ]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
