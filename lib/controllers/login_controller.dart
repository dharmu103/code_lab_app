import 'package:code_lab/controllers/home_controller.dart';
import 'package:code_lab/localStorage/pref.dart';
import 'package:code_lab/models/user_model.dart';
import 'package:code_lab/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper_platform_interface/src/models/cropped_file/unsupported.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  ButtonState btnstate = ButtonState.idle;
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController fnameTextController = TextEditingController();
  TextEditingController lnameTextController = TextEditingController();
  TextEditingController cpasswordTextController = TextEditingController();
  UserModel user = UserModel();
  @override
  onReady() async {
    await Future.delayed(const Duration(seconds: 1));
    getProfile();

    super.onReady();
  }

  Future<String?> loginWithEmailPassword() async {
    btnstate = ButtonState.loading;
    update();

    String? res = await RemoteService.loginWithEmailandPassword({
      "email": emailTextController.text,
      "password": passwordTextController.text
    });
    if (res == "") {
      btnstate = ButtonState.success;
    } else {
      btnstate = ButtonState.fail;
    }
    update();

    await Future.delayed(const Duration(seconds: 1), () {
      return res;
    });
    print(res);
    btnstate = ButtonState.idle;
    update();
    Get.find<LocalStorage>().setAccessToken();

    return res;
  }

  signupWithEmailPassword() async {
    btnstate = ButtonState.loading;
    update();

    String? res = await RemoteService.signupWithEmailandPassword({
      "email": emailTextController.text,
      "password": passwordTextController.text,
      "first_name": fnameTextController.text,
      "last_name": lnameTextController.text
    });

    // print(res);
    if (res == "") {
      btnstate = ButtonState.success;
      update();
    } else {
      btnstate = ButtonState.fail;
      update();
    }

    update();
    await Future.delayed(const Duration(seconds: 1), () {
      return res;
    });
    btnstate = ButtonState.idle;

    update();
    Get.find<LocalStorage>().setAccessToken();
    await getProfile();
    return res;
  }

  Future<String> uploadProfileImage(Map map) async {
    var res = await RemoteService.uploadProfileImage(map);
    if (res["status"] == 200) {
      return "";
    } else {
      return res['message'];
    }
  }

  Future<String> getProfile() async {
    if (LocalStorage.accessToken == "") {
    } else {
      print("ye bhi");
      var res =
          await RemoteService.getProfile(LocalStorage.accessToken.toString());
      //   if (res["status"] == 200) {
      //     return "";
      //   } else {
      //     return res['message'];
      //   }
      // }
    }
    print(RemoteService.user.profile!.profileImage);
    user = RemoteService.user;
    print(user.profile!.profileImage);
    update();
    return "";
  }
}
