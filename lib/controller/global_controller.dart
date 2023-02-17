
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../utilites/shared_prefs.dart';
import '../view/screen/auth/dashboard_screen.dart';
import '../view/screen/auth/sign_in_screen.dart';


class GlobalController extends GetxController {

  getCurrentUserFromServer() async{
    bool isLogin= await SharedPrefs().getIsLogin()??false;

    Future.delayed(const Duration(milliseconds: 3000), () {
      if (isLogin) {
        Get.offAll(()=>DashBoardScreen());
      } else {
        Get.offAll(()=>SignInScreen());
      }
    });


    //do server response here
  }



  @override
  void onInit() {
    //getCurrentUser();
    super.onInit();
  }
}
