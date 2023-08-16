import 'package:code_lab/services/remote_services.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';

class ContectUsController extends GetxController {
  ButtonState btnState = ButtonState.idle;

  Future<String?> sendForm(map) async {
    btnState = ButtonState.loading;
    update();
    var res = await RemoteService.sendFeedBack(map);
    btnState = ButtonState.idle;
    update();
    return res;
  }
}
