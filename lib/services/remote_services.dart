import 'dart:convert';

import 'package:code_lab/localStorage/pref.dart';
import 'package:code_lab/models/deals_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/deals_list.dart';
import '../models/store_list.dart';

class RemoteService {
  static const String BASE_URL = "http://54.159.201.11:3000";
  static const String no_auth = "/app/no-auth";
  static const headers = {'Content-Type': 'application/json'};
  String country = "UAE";
// http://54.159.201.11:3000/app/no-auth/home?country=UAE
  static Future<String?> signupWithEmailandPassword(
      Map<String, String> map) async {
    http.Response res = await http.post(
        Uri.parse(BASE_URL + no_auth + "/signup"),
        headers: headers,
        body: jsonEncode(map));

    if (res.statusCode == 200) {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("accessToken", jsonDecode(res.body)["token"]);
      return "";
    } else {
      return jsonDecode(res.body)["message"];
    }
  }

  static Future<String?> loginWithEmailandPassword(
      Map<String, String> map) async {
    http.Response res = await http.post(
        Uri.parse(BASE_URL + no_auth + "/login"),
        headers: headers,
        body: jsonEncode(map));

    if (res.statusCode == 200) {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("accessToken", jsonDecode(res.body)["token"]);
      return "";
    } else {
      return jsonDecode(res.body)["message"];
    }
  }

  static Future<StoreList?> fatchStores(String country) async {
    http.Response res = await http.get(
        headers: headers,
        // Uri.parse(BASE_URL + no_auth + "/home?country=$country"),
        Uri.parse("http://54.159.201.11:3000/app/no-auth/home?country=UAE"));

    var resp = jsonDecode(res.body);

    if (res.statusCode == 200) {
      print(res.statusCode);
      print(res.body);
      return StoreList.fromJson(resp);
    }
    return null;
  }

  static Future<DealsList?> fatchDeals(String country) async {
    http.Response res = await http.get(
        // Uri.parse(BASE_URL + no_auth + "/home?country=$country"),
        Uri.parse("http://54.159.201.11:3000/app/no-auth/home?country=UAE"));

    var resp = jsonDecode(res.body);

    if (res.statusCode == 200) {
      print(res.statusCode);
      print(res.body);
      return DealsList.fromJson(resp);
    }
    return null;
  }

  static Future uploadProfileImage(map) async {
    // try {
    //   var request = http.MultipartRequest(
    //     'POST',
    //     Uri.parse(baseUrl + accounts + auth + "upload-profile-image"),
    //   );

    //   request.files.add(http.MultipartFile(
    //     'profile_image',
    //     map['image'].readAsBytes().asStream(),
    //     map['image'].lengthSync(),
    //     filename: map['image'].path,
    //     contentType: MediaType('image', 'jpeg'),
    //   ));

    //   request.headers.addAll({
    //     "Content-type": "application/x-www-form-urlencoded",
    //     "access_id": LocalStorage.accessToken.toString(),
    //   });

    //   http.StreamedResponse res = await request.send();

    //   var responseData = await http.Response.fromStream(res);

    //   var response = jsonDecode(responseData.body);

    //   if (responseData.statusCode == 200) {
    //     return response;
    //   } else {
    //     return {
    //       "status": 400,
    //       "message": "Failed to upload profile image!",
    //     };
    //   }

    //   // Response res = await client.post(
    //   //   Uri.parse(baseUrl + accounts + auth + "upload-profile-image"),
    //   //   headers: {
    //   //     "Content-type": "application/json; charset=utf-8",
    //   //     "access_id": accessId,
    //   //   },
    //   //   body: jsonEncode(map),
    //   // );

    //   // var response = jsonDecode(res.body);

    //   // return response;
    // } catch (e) {
    //   return {
    //     "status": 400,
    //     "message": "Failed",
    //   };
    // }
  }
}
