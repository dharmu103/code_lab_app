import 'package:code_lab/models/deals_model.dart';
import 'package:code_lab/models/store_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'store_list.g.dart';

@JsonSerializable()
class StoreList {
  String? message;
  List<StoreModel>? stores;
  List<DealsModel>? deals;

  StoreList({this.message, this.stores, this.deals});

  factory StoreList.fromJson(Map<String, dynamic> json) =>
      _$StoreListFromJson(json);

  Map<String, dynamic> toJson() => _$StoreListToJson(this);
}
