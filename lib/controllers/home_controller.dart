import 'dart:convert';

import 'package:code_lab/models/Home_Model.dart';
import 'package:code_lab/models/deals_model.dart';
import 'package:code_lab/models/store_list.dart';
import 'package:code_lab/services/remote_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/deals_list.dart';

class HomeController extends GetxController {
  bool reset = false;

  BrandsList? brands = BrandsList();
  HomeModel? homeModel = HomeModel();
  @override
  onInit() {
    getStores();
    getDeals();

    super.onInit();
  }

  getDeals() async {
    var res = await RemoteService.fatchDeals("In");

    homeModel = res;
    update();
  }

  getStores() async {
    var res = await RemoteService.fatchStores("In");

    brands = res;
    update();
  }
}
