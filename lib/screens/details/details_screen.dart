import 'package:code_lab/models/HomePage_dela.dart';
import 'package:code_lab/models/deals_list.dart';
import 'package:code_lab/models/store_model.dart';
import 'package:code_lab/services/remote_services.dart';
import 'package:code_lab/widgets/cards/card_4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../models/deals_model.dart';
import '../../widgets/cards/card_1.dart';
import '../../widgets/cards/card_2.dart';
import '../../widgets/cards/card_5.dart';
import '../../widgets/dailogs/code_dailog.dart';
import '../homeScreens/home_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    getDeals() {
      print(args.sId);
      return RemoteService.fatchDealsByStore(args);
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Brands Name"),
      // ),
      body: FutureBuilder<DealsList?>(
          future: getDeals(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text("Error"));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data!.deal!.isEmpty) {
                return const Center(
                  child: Text("No Deals Found"),
                );
              }
              return TopDeal(
                deals: snapshot.data!,
                args: args,
              );
            }

            return const Text("No Data Found");
          }),
    );
  }
}

class TopDeal extends StatelessWidget {
  TopDeal({super.key, required this.deals, required this.args});
  DealsList deals;
  Brands args;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.lightBlue.shade300.withOpacity(.08),
                Colors.lightBlue.shade100.withOpacity(0.8)
              ],
            ),
          ),
          child: ListView(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, size: 35),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    // IconButton(
                    //   icon: const Icon(Icons.search, size: 35),
                    //   onPressed: () {},
                    // ),
                  ],
                ),
              ),
              const SizedBox(height: 25.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height - 105.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  child: ListView(
                    primary: false,
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    children: [
                      Center(
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SizedBox(
                                  height: 100,
                                  width: 180,
                                  child: GetBuilder<HomeController>(builder: (_) {
                                    if (_.brands!.message != "Success" &&
                                        _.brands!.brands == null) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if (_.brands!.brands!.isEmpty) {
                                      return const Center(
                                          child: Text("No Store Found"));
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
                                              margin: const EdgeInsets.only(
                                                  left: 8.0),
                                              child:
                                                  card1(_.brands!.brands![index]),
                                            );
                                          }
                                          if (index == 9) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  right: 18.0),
                                              child:
                                                  card1(_.brands!.brands![index]),
                                            );
                                          }
                                          return card1(_.brands!.brands![index]);
                                        }));
                                  }),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              args.name.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FutureBuilder(
                                  future: getBanner(),
                                  builder: (c, s) {
                                    if (s.hasData) return card5(s.data);
                                    return democard2();
                                  }),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 200,
                              child: ListView.builder(
                                  itemCount: deals.deal?.length,
                                  itemBuilder: (c, i) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                deals.deal![i].description
                                                    .toString(),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  // fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                // Copy button logic
                      
                                                codeDailog2(
                                                    context, deals.deal![i]);
                                              },
                                              child: const Text('Get CODE'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            const SizedBox(height: 10.0),
                            // Container(
                            //   padding: const EdgeInsets.all(8.0),
                            //   decoration: BoxDecoration(
                            //     color: Colors.grey[200],
                            //     borderRadius: BorderRadius.circular(10.0),
                            //   ),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Flexible(
                            //         child: Text(
                            //           'Up to 70% off + 10% EXTRA on Best Sellers...',
                            //           maxLines: 2,
                            //           overflow: TextOverflow.ellipsis,
                            //           style: TextStyle(
                            //             fontSize: 18.0,
                            //             // fontWeight: FontWeight.bold,
                            //           ),
                            //         ),
                            //       ),
                            //       ElevatedButton(
                            //         onPressed: () {
                            //           // Copy button logic
                            //         },
                            //         child: const Text('Get CODE'),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
