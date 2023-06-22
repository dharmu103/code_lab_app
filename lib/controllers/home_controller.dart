import 'package:code_lab/models/Home_Model.dart';
import 'package:code_lab/models/country_list.dart';
import 'package:code_lab/models/refer_details.dart';
import 'package:code_lab/models/store_list.dart';
import 'package:code_lab/services/remote_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool reset = false;

  BrandsList? brands = BrandsList();
  HomeModel? homeModel = HomeModel();
  CountryList? countryList = CountryList();
  Root? referDetail = Root();
  @override
  onInit() {
    getStores();
    getDeals();
    getCountries();
    getReferDetails();
    super.onInit();
  }

  getDeals() async {
    var res = await RemoteService.fatchDeals();
    print('stores ' + res!.deals!.length.toString());
    homeModel = res;
    update();
  }

  getStores() async {
    var res = await RemoteService.fatchStores();
    print('stores ' + res!.brands!.length.toString());
    brands = res;
    update();
  }

  getCountries() async {
    var res = await RemoteService.fatchCounties();
    print(res);
    countryList = res;
    print(countryList?.countries?.length);
    update();
  }

  getReferDetails() async {
    var res = await RemoteService.shareReferLink();
    referDetail = res;
    update();
  }
}
