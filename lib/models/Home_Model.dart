import 'HomePage_dela.dart';

class HomeModel {
  String? message;
  List<Stores>? stores;
  List<HomeDeals>? deals;

  HomeModel({this.message, this.stores, this.deals});

  HomeModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['stores'] != null) {
      stores = <Stores>[];
      json['stores'].forEach((v) {
        stores!.add(Stores.fromJson(v));
      });
    }
    if (json['deals'] != null) {
      deals = <HomeDeals>[];
      json['deals'].forEach((v) {
        deals!.add(HomeDeals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
    if (this.stores != null) {
      data['stores'] = this.stores!.map((v) => v.toJson()).toList();
    }
    if (this.deals != null) {
      data['deals'] = this.deals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stores {
  String? sId;
  String? country;
  String? name;
  String? nameArabic;
  String? link;
  List<Null>? tags;
  int? index;
  int? iV;
  String? logo;

  Stores(
      {this.sId,
      this.country,
      this.name,
      this.nameArabic,
      this.link,
      this.tags,
      this.index,
      this.iV,
      this.logo});

  Stores.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    country = json['country'];
    name = json['name'];
    nameArabic = json['name_arabic'];
    link = json['link'];

    index = json['index'];
    iV = json['__v'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
    data['country'] = this.country;
    data['name'] = this.name;
    data['name_arabic'] = this.nameArabic;
    data['link'] = this.link;

    data['index'] = this.index;
    data['__v'] = this.iV;
    data['logo'] = this.logo;
    return data;
  }
}
