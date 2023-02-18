import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yuma_task/view/screen/auth/sign_in_screen.dart';
import '../../../controller/auth_controller.dart';
import '../../../data/notification/notification_services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utilites/shared_prefs.dart';
import '../../widget/text_widget.dart';

class DashBoardScreen extends StatelessWidget {
  final controller = Get.put(AuthController());

  DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.withOpacity(0.7),
        title: TextWidget(
          value: 'Dashboard',
          textColor: Colors.black.withOpacity(0.7),
          fontWeight: FontWeight.w700,
          size: 18.sp,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await SharedPrefs().prefsClear();
                Get.offAll(() => SignInScreen());
              },
              icon: Icon(FontAwesomeIcons.signOut,color: Colors.black.withOpacity(0.7))),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: customFields(
                    title: 'First Name',
                    textEditingController: controller.firstNameHomeController,
                    enabled: false,
                  ),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Expanded(
                  child: customFields(
                    title: 'Last Name',
                    textEditingController: controller.lastNameHomeController,
                    enabled: false,
                  ),
                ),
              ],
            ),
            customFields(
              title: 'Username',
              textEditingController: controller.userHomeController,
              enabled: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FloatingActionButton(
          child: Icon(Icons.notification_add_outlined,color: Colors.black.withOpacity(0.7),),
          backgroundColor: Colors.yellow,
          onPressed: () {
            //  print('tap');
            NotificationServices().showNotification(
              title: 'Flutter Local Notification',
              body: 'Flutter Local Notification Body Section',
            );
          },
        ),
      ),
    );
  }

  Column customFields(
      {required String title,
      required TextEditingController textEditingController,
      required bool enabled,
      Widget? trailingIcon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          value: title,
          textColor: Colors.black,
          size: 14.sp,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(
          height: 7.h,
        ),
        TextField(
          enabled: enabled,
          controller: textEditingController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            suffixIcon: trailingIcon,
            hintStyle: TextStyle(
              fontSize: 16.sp,
              color: Color.fromRGBO(
                0,
                48,
                73,
                0.5,
              ),
            ),
            contentPadding: EdgeInsets.fromLTRB(
              5.0,
              5.0,
              5.0,
              5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black54,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
