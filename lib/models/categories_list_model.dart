class CatagoriesList {
  String? message;
  List<Categories>? categories;

  CatagoriesList({this.message, this.categories});

  CatagoriesList.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['categories'] = this.categories?.map((v) => v.toJson()).toList();
    return data;
  }
}

class Categories {
  String? sId;
  String? name;
  String? nameArabic;
  int? index;
  int? iV;

  Categories({this.sId, this.name, this.nameArabic, this.index, this.iV});

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    nameArabic = json['name_arabic'];
    index = json['index'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['name_arabic'] = this.nameArabic;
    data['index'] = this.index;
    data['__v'] = this.iV;
    return data;
  }
}
