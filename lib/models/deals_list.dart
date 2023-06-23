import 'deals_model.dart';

class DealsList {
  String? message;
  List<Deal>? deal;

  DealsList({this.message, this.deal});

  DealsList.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['deal'] != null) {
      deal = <Deal>[];
      json['deal'].forEach((v) {
        deal!.add(Deal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (deal != null) {
      data['deal'] = deal!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
