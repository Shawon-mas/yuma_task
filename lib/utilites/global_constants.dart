import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:fluttertoast/fluttertoast.dart';


const String loginLottie='https://assets3.lottiefiles.com/private_files/lf30_ul3enyal.json';

successSnackBar(BuildContext context, String text) {
  var snackBar = SnackBar(
    backgroundColor: Colors.green,
    content: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

errorSnackBar(BuildContext context, String text) {



  var snackBar = SnackBar(

    backgroundColor: Colors.red,
    content: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

infoSnackBar(BuildContext context, String text) {
  var snackBar = SnackBar(
    backgroundColor: Colors.indigo,
    content: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

successToast(String text){
  return  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
getErrorSnack(String value){
  Get.snackbar(
    value,
    '',
    icon: Icon(Icons.error_outline, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    borderRadius: 20,
    margin: EdgeInsets.all(15),
    colorText: Colors.white,
    duration: Duration(seconds: 4),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,


  );
}
