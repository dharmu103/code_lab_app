import 'dart:convert';

import 'package:code_lab/models/deals_model.dart';
import 'package:code_lab/models/store_list.dart';
import 'package:code_lab/services/remote_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/deals_list.dart';

class HomeController extends GetxController {
  RxList<DealsModel> dealsList = RxList<DealsModel>();

  bool reset = false;

  StoreList? stores = StoreList();
  DealsList? deals = DealsList();
  @override
  onInit() {
    getStores();
    getDeals();

    super.onInit();
  }

  getDeals() async {
    var res = await RemoteService.fatchDeals("In");

    deals = res;
    update();
  }

  getStores() async {
    var res = await RemoteService.fatchStores("In");

    stores = res;
    update();
  }
}
