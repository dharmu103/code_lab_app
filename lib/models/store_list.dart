import 'package:code_lab/models/store_model.dart';

class BrandsList {
  String? message;
  List<Brands>? brands;

  BrandsList({this.message, this.brands});

  BrandsList.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(Brands.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (brands != null) {
      data['brands'] = brands!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
