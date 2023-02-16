import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controller/global_controller.dart';
import '../../../utilites/images.dart';
class SplashScreen extends StatelessWidget {
  final controller = Get.put(GlobalController());

   SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getCurrentUserFromServer();
    return Scaffold(
      body: Center(
        child: Container(
          height: 200.h,
          width: 200.w,
          child: Image.asset(MyImage.logo),
        ),
      ),
    );
  }
}
