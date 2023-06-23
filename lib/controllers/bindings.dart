import 'package:code_lab/controllers/login_controller.dart';
import 'package:code_lab/localStorage/pref.dart';
import 'package:get/get.dart';

class RootBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<LocalStorage>(LocalStorage());
    Get.put(LoginController());
  }
}
