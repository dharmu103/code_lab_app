// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deals_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealsList _$DealsListFromJson(Map<String, dynamic> json) => DealsList(
      dealsList: (json['dealsList'] as List<dynamic>?)
          ?.map((e) => DealsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DealsListToJson(DealsList instance) => <String, dynamic>{
      'dealsList': instance.dealsList,
    };
