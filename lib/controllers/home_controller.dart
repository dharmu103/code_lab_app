import 'package:code_lab/models/HomePage_dela.dart';
import 'package:code_lab/models/Home_Model.dart';
import 'package:code_lab/models/carousel_list.dart';
import 'package:code_lab/models/country_list.dart';
import 'package:code_lab/models/refer_details.dart';
import 'package:code_lab/models/store_list.dart';
import 'package:code_lab/services/remote_services.dart';
import 'package:get/get.dart';

import '../models/categories_list_model.dart';
import '../models/store_model.dart';

class HomeController extends GetxController {
  bool reset = false;

  BrandsList? brands = BrandsList();
  HomeModel? homeModel = HomeModel();
  CountryList? countryList = CountryList();
  Root? referDetail = Root();
  List<HomeDeals>? searchDeal = [];
  List<Brands>? searchStore = [];
  List<HomeDeals>? filteredDeal = [];
  bool searchLoading = false;
  CarouselList? carouselList = CarouselList();
  CatagoriesList? categoriesList = CatagoriesList();
  String? filterText = '';
  @override
  onInit() {
    getStores();
    getDeals();
    getCountries();
    getReferDetails();
    fatchCarousel();
    fatchCatagory();
    super.onInit();
  }

  getDeals() async {
    var res = await RemoteService.fatchDeals();
    //print('stores ' + res!.deals!.length.toString());
    homeModel = res;
    filteredDeal = homeModel?.deals;
    update();
  }

  getStores() async {
    var res = await RemoteService.fatchStores();
    //print('stores ' + res!.brands!.length.toString());
    brands = res;
    update();
  }

  getCountries() async {
    var res = await RemoteService.fatchCountry();
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

  searchAlgo(text) async {
    searchDeal?.clear();
    searchStore?.clear();
    if (text == null || text == "") {
      searchDeal?.clear();
      searchStore?.clear();
    } else {
      homeModel!.deals!.forEach((element) {
        if (element.name!
                .toLowerCase()
                .startsWith(text.toString().toLowerCase()) ||
            element.name!.startsWith(text.toString().camelCase.toString()) ||
            (element.name!.startsWith(text.toString().toLowerCase())) ||
            element.description!
                .toLowerCase()
                .startsWith(text.toString().toLowerCase()) ||
            element.description!
                .startsWith(text.toString().camelCase.toString())) {
          searchDeal?.add(element);
        }
      });
      // serching for brands
      brands?.brands?.forEach((element) {
        if (element.name!
                .toLowerCase()
                .startsWith(text.toString().toLowerCase()) ||
            element.name!.startsWith(text.toString().camelCase.toString()) ||
            (element.name!.startsWith(text.toString().toLowerCase())) ||
            element.name!
                .toLowerCase()
                .startsWith(text.toString().toLowerCase())) {
          searchStore?.add(element);
        }
      });

      searchLoading = false;
      update();
    }
  }

  fatchCarousel() async {
    var res = await RemoteService.fatchCarousel();
    //print(res?.carousel?.length);
    carouselList = res;
    update();
  }

  Future<CatagoriesList?> fatchCatagory() async {
    categoriesList = await RemoteService.fatchCatagory();
    update();
    return categoriesList;
  }

  filterDeal(filter) {
    if (filterText == filter) {
      filterText = "";
      filteredDeal = homeModel?.deals;
      update();
    } else {
      filterText = filter;
      update();
      List x = [];
      //print(homeModel?.deals?.length);
      homeModel?.deals?.forEach(
        (element) {
          //print("${element.name}    ---------");
          //print("${element.tags}    ---------");
          if (element.tags != []) {
            if (element.tags!.contains(filter)) {
              x.add(element);
            }
          }
        },
      );
      //print(x.length);
      filteredDeal = x.cast<HomeDeals>();
    }

    update();
  }
}
