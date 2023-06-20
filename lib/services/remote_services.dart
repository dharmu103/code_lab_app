import 'dart:convert';
import 'dart:math';

import 'package:code_lab/localStorage/pref.dart';
import 'package:code_lab/models/Home_Model.dart';
import 'package:code_lab/models/deals_model.dart';
import 'package:code_lab/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/deals_list.dart';
import '../models/store_list.dart';
import '../models/store_model.dart';

class RemoteService {
  static late String token;
  static const String BASE_URL = "http://54.159.201.11:3000";
  static const String no_auth = "/app/no-auth";
  static const headers = {'Content-Type': 'application/json'};
  String country = "UAE";
  static UserModel user = UserModel();

  static Map<String, String> auth_headers = {
    'Content-Type': 'application/json',
    'token': token
  };

  static initiatizeAuthHeader() async {
    auth_headers = {
      "Content-type": "application/json; charset=utf-8",
      "token": token,
    };
  }

// http://54.159.201.11:3000/app/no-auth/home?country=UAE
  static Future<String?> signupWithEmailandPassword(
      Map<String, String> map) async {
    http.Response res = await http.post(
        Uri.parse(BASE_URL + no_auth + "/signup"),
        headers: headers,
        body: jsonEncode(map));

    if (res.statusCode == 200) {
      token = jsonDecode(res.body)["token"];
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("accessToken", jsonDecode(res.body)["token"]);
      initiatizeAuthHeader();
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
      token = jsonDecode(res.body)["token"];
      initiatizeAuthHeader();
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("accessToken", jsonDecode(res.body)["token"]);
      return "";
    } else {
      return jsonDecode(res.body)["message"];
    }
  }

  static Future<BrandsList?> fatchStores(String country) async {
    http.Response res = await http.get(
        headers: headers,
        // Uri.parse(BASE_URL + no_auth + "/home?country=$country"),
        Uri.parse("http://54.159.201.11:3000/app/no-auth/brand?country=UAE"));

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
    initiatizeAuthHeader();
    try {
      http.Response res = await http.get(
          headers: auth_headers,
          // Uri.parse(BASE_URL + no_auth + "/home?country=$country"),
          Uri.parse("http://54.159.201.11:3000/app/auth/profile"));

      var resp = jsonDecode(res.body);
      // print(res.statusCode);
      // print(res.body);
      if (res.statusCode == 200) {
        user = UserModel.fromJson(resp);
        return "";
      }
      return jsonDecode(res.body)["message"];
    } catch (e) {
      print(e.toString());
      print("error");
    }
  }

  static Future<HomeModel?> fatchDeals(String country) async {
    http.Response res = await http.get(
        // Uri.parse(BASE_URL + no_auth + "/home?country=$country"),
        Uri.parse("http://54.159.201.11:3000/app/no-auth/home?country=UAE"));

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
          // Uri.parse(BASE_URL + no_auth + "/home?country=$country"),
          Uri.parse(
              "http://54.159.201.11:3000/app/no-auth/store/deals?store=${store.sId}"));

      var resp = jsonDecode(res.body);

      if (res.statusCode == 200) {
        print(res.statusCode);
        print(res.body);
        var x = DealsList.fromJson(resp);
        print(x.message);
        print(x.deal?.length);
        return DealsList.fromJson(resp);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future uploadProfileImage(map) async {
    print(map);
    print(map);
    try {
      // var request = http.MultipartRequest(
      //   'POST',
      //   Uri.parse(BASE_URL + '/app/' + "upload-profile-image"),
      // );
      var request = http.MultipartRequest('POST',
          Uri.parse('http://54.159.201.11:3000/app/auth/upload-profile-image'));

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
      print(responseData.statusCode);
      print(responseData.body);
      if (responseData.statusCode == 200) {
        return response;
      } else {
        return {
          "status": 400,
          "message": "Failed to upload profile image!",
        };
      }

// var headers = {
//   'token': 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjQ3MzRiZTk1Y2Q3M2NlMjJhMGQ2MzA3IiwiaWF0IjoxNjg1OTMyMTAxLCJleHAiOjE2ODk1MzIxMDEsImF1ZCI6Imh0dHA6Ly9teXNvZnRjb3JwLmluIiwiaXNzIjoiTXlzb2Z0IGNvcnAiLCJzdWIiOiJzb21lQHVzZXIuY29tIn0.inyxCBJqze7SspDtdNCT71vNYIhEQh4R-iGHIf0cy8eiZfFEG4r1wNELY53AdW3AtoMCf5-fHd_FEF6bWfzJduNRHk9Josl1I5_nV3qQ6X6vSAlId-z59wDoIlPdn7bCPTyWZtaacKfeMXHVZMxskMNxD4Zw0uSniaxCTvsOwXRXYyY4EcNz33LUBj0H7CSblwl0q0DanbvoR1XYaytp7B_KrSmP1QxR00dyHwK-rrX4eEJa4mnZuXDi10VcaQqSJ6ZBgGp8DHLMJ_14Jhm7SiX_dfx99mTrCz0pSQ8Pc9jQaCxMo_F6W2YL6GWU4W-04_nuHb9bCF3aPe5FWeNJ3w'
// };
// var request = http.MultipartRequest('POST', Uri.parse('http://localhost:3000/app/auth/upload-profile-image'));
// request.files.add(await http.MultipartFile.fromPath('file', '/C:/Users/Lenovo/Downloads/get profile.png'));
// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }

      // Response res = await client.post(
      //   Uri.parse(baseUrl + accounts + auth + "upload-profile-image"),
      //   headers: {
      //     "Content-type": "application/json; charset=utf-8",
      //     "access_id": accessId,
      //   },
      //   body: jsonEncode(map),
      // );

      // var response = jsonDecode(res.body);

      // return response;
    } catch (e) {
      print("----------------------------------");
      print(e.toString());
      return {
        "status": 400,
        "message": "Failed",
      };
    }
  }

  static Future<String> getBanner() async {
    http.Response res = await http.get(
        headers: headers,
        // Uri.parse(BASE_URL + no_auth + "/home?country=$country"),
        Uri.parse("http://54.159.201.11:3000/app/no-auth/banner"));
    print(res.body);
    return jsonDecode(res.body)["banner"]["image"];
  }
}
