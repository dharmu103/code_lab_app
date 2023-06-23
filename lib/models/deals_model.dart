class Deal {
  String? sId;
  String? store;
  String? name;
  String? nameArabic;
  String? description;
  String? descriptionArabic;
  String? coupon;
  String? link;
  List<Null>? tags;
  int? index;
  int? iV;
  String? image;

  Deal(
      {this.sId,
      this.store,
      this.name,
      this.nameArabic,
      this.description,
      this.descriptionArabic,
      this.coupon,
      this.link,
      this.tags,
      this.index,
      this.iV,
      this.image});

  Deal.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    store = json['store'];
    name = json['name'];
    nameArabic = json['name_arabic'];
    description = json['description'];
    descriptionArabic = json['description_arabic'];
    coupon = json['coupon'];
    link = json['link'];
    // if (json['tags'] != null) {
    //   tags = <Null>[];
    //   json['tags'].forEach((v) {
    //     tags!.add(Null.fromJson(v));
    //   });
    // }
    index = json['index'];
    iV = json['__v'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['store'] = store;
    data['name'] = name;
    data['name_arabic'] = nameArabic;
    data['description'] = description;
    data['description_arabic'] = descriptionArabic;
    data['coupon'] = coupon;
    data['link'] = link;
    // if (tags != null) {
    //   data['tags'] = tags!.map((v) => v!.toJson()).toList();
    // }
    data['index'] = index;
    data['__v'] = iV;
    data['image'] = image;
    return data;
  }
}
