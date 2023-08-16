class HomeDeals {
  String? sId;
  String? store;
  String? name;
  String? nameArabic;
  String? description;
  String? descriptionArabic;
  String? coupon;
  String? link;

  List? tags;
  int? index;
  String? lastUsed;
  String? usedTimes;
  int? iV;
  String? image;

  HomeDeals(
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
      this.lastUsed,
      this.usedTimes,
      this.iV,
      this.image});

  HomeDeals.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    store = json['store'];
    name = json['name'];
    nameArabic = json['name_arabic'];
    description = json['description'];
    descriptionArabic = json['description_arabic'];
    coupon = json['coupon'];
    link = json['link'];
    tags = json['tags'].cast();
    lastUsed = json["last_used"];
    usedTimes = json["used_times"];
    index = json['index'];
    iV = json['__v'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['store'] = this.store;
    data['name'] = this.name;
    data['name_arabic'] = this.nameArabic;
    data['description'] = this.description;
    data['description_arabic'] = this.descriptionArabic;
    data['coupon'] = this.coupon;
    data['link'] = this.link;

    data['index'] = this.index;
    data['tags'] = this.tags;
    data['__v'] = this.iV;
    data['image'] = this.image;
    return data;
  }
}
