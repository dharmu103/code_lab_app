class Brands {
  String? sId;
  String? country;
  String? name;
  String? nameArabic;
  String? link;
  List<Null>? tags;
  int? index;
  int? iV;
  String? logo;

  Brands(
      {this.sId,
      this.country,
      this.name,
      this.nameArabic,
      this.link,
      this.tags,
      this.index,
      this.iV,
      this.logo});

  Brands.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    country = json['country'];
    name = json['name'];
    nameArabic = json['name_arabic'];
    link = json['link'];
    // if (json['tags'] != null) {
    //   tags = <Null>[];
    //   json['tags'].forEach((v) {
    //     tags!.add(new Null.fromJson(v));
    //   });
    // }
    index = json['index'];
    iV = json['__v'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['country'] = country;
    data['name'] = name;
    data['name_arabic'] = nameArabic;
    data['link'] = link;
    // if (this.tags != null) {
    //   data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    // }
    data['index'] = index;
    data['__v'] = iV;
    data['logo'] = logo;
    return data;
  }
}
