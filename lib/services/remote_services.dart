import 'dart:convert';

import 'package:code_lab/localStorage/pref.dart';
import 'package:code_lab/models/Home_Model.dart';
import 'package:code_lab/models/country_list.dart';
import 'package:code_lab/models/refer_details.dart';
import 'package:code_lab/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/deals_list.dart';
import '../models/store_list.dart';
import '../models/store_model.dart';

class RemoteService {
  static late String token;
  static const String baseUrl = "http://54.159.201.11:3000/app";
  static const String noAuth = "no-auth";
  static const headers = {'Content-Type': 'application/json'};

  static UserModel user = UserModel();

  static Map<String, String> authHeader = {
    'Content-Type': 'application/json',
    'token': token
  };

  static initiatizeAuthHeader(token) async {
    authHeader = {
      "Content-type": "application/json; charset=utf-8",
      "token": token,
    };
  }

// $baseUrl/no-auth/home?country=UAE
  static Future<String?> signupWithEmailandPassword(
      Map<String, String> map) async {
    http.Response res = await http.post(
        Uri.parse(baseUrl + '/' + noAuth + "/signup"),
        headers: headers,
        body: jsonEncode(map));

    if (res.statusCode == 200) {
      token = jsonDecode(res.body)["token"];
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("accessToken", jsonDecode(res.body)["token"]);
      initiatizeAuthHeader(token);
      return "";
    } else {
      return jsonDecode(res.body)["message"];
    }
  }

  static Future<String?> loginWithEmailandPassword(
      Map<String, String> map) async {
    http.Response res = await http.post(
        Uri.parse(baseUrl + '/' + noAuth + "/login"),
        headers: headers,
        body: jsonEncode(map));

    if (res.statusCode == 200) {
      token = jsonDecode(res.body)["token"];
      initiatizeAuthHeader(token);
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("accessToken", jsonDecode(res.body)["token"]);
      return "";
    } else {
      return jsonDecode(res.body)["message"];
    }
  }

  static Future<BrandsList?> fatchStores() async {
    var country = LocalStorage.country;
    http.Response res = await http.get(
        headers: headers,
        // Uri.parse(baseUrl + no_auth + "/home?country=$country"),
        Uri.parse("$baseUrl/no-auth/brand?country=$country"));

    var resp = jsonDecode(res.body);

    if (res.statusCode == 200) {
      // print(res.statusCode);
      // print(res.body);
      return BrandsList.fromJson(resp);
    }
    return null;
  }

  static Future getProfile(String string) async {
    token = string;
    initiatizeAuthHeader(token);
    try {
      http.Response res = await http.get(
          headers: authHeader,
          // Uri.parse(baseUrl + no_auth + "/home?country=$country"),
          Uri.parse("$baseUrl/auth/profile"));

      var resp = jsonDecode(res.body);
      // print(res.statusCode);
      // print(res.body);
      if (res.statusCode == 200) {
        user = UserModel.fromJson(resp);
        return "";
      }
      return jsonDecode(res.body)["message"];
    } catch (e) {}
  }

  static Future<HomeModel?> fatchDeals() async {
    var country = LocalStorage.country;
    print(country);
    http.Response res = await http.get(
        // Uri.parse(baseUrl + no_auth + "/home?country=$country"),
        Uri.parse("$baseUrl/no-auth/home?country=$country"));

    var resp = jsonDecode(res.body);

    if (res.statusCode == 200) {
      // print(res.statusCode);
      // print(res.body);
      return HomeModel.fromJson(resp);
    }
    return null;
  }

  static Future<DealsList?> fatchDealsByStore(Brands store) async {
    try {
      http.Response res = await http.get(
          headers: headers,
          // Uri.parse(baseUrl + no_auth + "/home?country=$country"),
          Uri.parse("$baseUrl/no-auth/store/deals?store=${store.sId}"));

      var resp = jsonDecode(res.body);

      if (res.statusCode == 200) {
        // var x = DealsList.fromJson(resp);
        return DealsList.fromJson(resp);
      }
    } catch (e) {}
    return null;
  }

  static Future uploadProfileImage(map) async {
    try {
      // var request = http.MultipartRequest(
      //   'POST',
      //   Uri.parse(baseUrl + '/app/' + "upload-profile-image"),
      // );
      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrl/auth/upload-profile-image'));

      // request.files.add(http.MultipartFile(
      //   'profile_image',
      //   map['image'].readAsBytes().asStream(),
      //   map['image'].lengthSync(),
      //   filename: map['image'].path,
      //   // contentType: MediaType('image', 'jpeg'),
      // ));

      request.files
          .add(await http.MultipartFile.fromPath('file', map['image'].path));

      request.headers.addAll({
        "Content-type": "application/x-www-form-urlencoded",
        "token": LocalStorage.accessToken.toString(),
      });

      http.StreamedResponse res = await request.send();

      var responseData = await http.Response.fromStream(res);

      var response = jsonDecode(responseData.body);
      if (responseData.statusCode == 200) {
        return response;
      } else {
        return {
          "status": 400,
          "message": "Failed to upload profile image!",
        };
      }
    } catch (e) {
      return {
        "status": 400,
        "message": "Failed",
      };
    }
  }

  static Future<String> getBanner() async {
    http.Response res = await http.get(
        headers: headers,
        // Uri.parse(baseUrl + no_auth + "/home?country=$country"),
        Uri.parse("$baseUrl/no-auth/banner"));
    return jsonDecode(res.body)["banner"]["image"];
  }

  static fatchCounties() async {
    try {
      http.Response res = await http.get(
          headers: headers,
          // Uri.parse(baseUrl + no_auth + "/home?country=$country"),
          Uri.parse("$baseUrl/no-auth/country"));

      var resp = jsonDecode(res.body);
      // print(res.statusCode);
      if (res.statusCode == 200) {
        // var x = DealsList.fromJson(resp);
        return CountryList.fromJson(resp);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static shareReferLink() async {
    try {
      http.Response res = await http.get(
          headers: authHeader,
          // Uri.parse(baseUrl + no_auth + "/home?country=$country"),
          Uri.parse("$baseUrl/auth/referral-details"));

      var resp = jsonDecode(res.body);
      print(resp);
      print(res.statusCode);
      if (res.statusCode == 200) {
        // var x = DealsList.fromJson(resp);
        return Root.fromJson(resp);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
