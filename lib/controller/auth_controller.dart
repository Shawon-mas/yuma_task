import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'hide Response, FormData, MultipartFile;


import '../data/network/api_services.dart';
import '../data/network/response_repository.dart';

import '../model/profile_data_model.dart';
import '../utilites/global_constants.dart';
import '../utilites/shared_prefs.dart';
import '../view/screen/auth/dashboard_screen.dart';
import '../view/screen/auth/sign_in_screen.dart';

class AuthController extends GetxController {

  //sign in text-field controller
  final FocusNode userSignInFocus = FocusNode();
  final FocusNode passwordSignInFocus = FocusNode();

  final TextEditingController userSignInController = TextEditingController();
  final TextEditingController passwordSignInController = TextEditingController();

  //sign up text-field controller
  final FocusNode firstNameSignUpFocus = FocusNode();
  final FocusNode lastNameSignUpFocus = FocusNode();
  final FocusNode emailSignUpFocus = FocusNode();
  final FocusNode userSignUpFocus = FocusNode();
  final FocusNode passwordSignUpFocus = FocusNode();

  final TextEditingController firstNameSignUpController = TextEditingController();
  final TextEditingController lastNameSignUpController = TextEditingController();
  final TextEditingController emailSignUpController = TextEditingController();
  final TextEditingController userSignUpController = TextEditingController();
  final TextEditingController passwordSignUpController = TextEditingController();

  //profile data controller
  final TextEditingController firstNameHomeController = TextEditingController();
  final TextEditingController lastNameHomeController = TextEditingController();
  final TextEditingController emailHomeController = TextEditingController();
  final TextEditingController userHomeController = TextEditingController();

  var isSignInDone = false.obs;
  var isSignUpDone = false.obs;

  checkSignInTextField(BuildContext context) {
    if (userSignInController.text.isEmpty ||
        passwordSignInController.text.isEmpty) {
      errorSnackBar(context, "Please fill-up all the text-field ");
    }else{
      _userSignIn(context);
    }
  }
  checkSignUpTextField(BuildContext context) {
    if (firstNameSignUpController.text.isEmpty ||
        lastNameSignUpController.text.isEmpty ||
        emailSignUpController.text.isEmpty ||
        userSignUpController.text.isEmpty ||
        passwordSignUpController.text.isEmpty) {
      errorSnackBar(context, "Please fill-up all the text-field ");
    }else{
      _userSignUp(context);
    }
  }

  void _userSignIn(BuildContext context) async{
    isSignInDone.value=true;
    var request = {
      ApiUtils.userNameAuth: userSignInController.text.toString(),
      ApiUtils.passwordAuth: passwordSignInController.text.toString(),

    };

    try{
      var response = await authPost(url: ApiUtils.signInUrl, body: request);
      if(response !=null){
        print(response);
        successToast('User Sign In Successfully Done');
       await SharedPrefs().isLogin(true);
        await SharedPrefs().saveSession(response.data[ApiUtils.userAuthSessionId]);
        await SharedPrefs().storeUserId(response.data[ApiUtils.userAuthUniqueId]);
      //  print(await SharedPrefs().getIsLogin());
        print(await SharedPrefs().getSession());
        print(await SharedPrefs().getUserId());
        isSignInDone.value=false;
       Get.offAll(()=>DashBoardScreen());
      //  _getProfileData();
      }

    }catch (e) {
      if (e is DioError) {
        if (e.response!.statusCode == 409) {

          errorSnackBar(context, "Credentials did not match");
          isSignInDone.value=false;
        } else {

          errorSnackBar(context, "User Email ${userSignInController.text} doesnt exist");
          isSignInDone.value=false;
        }
      } else {
        errorSnackBar(context, "Something went wrong");
        isSignInDone.value=false;
      }
    }

  }
  void _userSignUp(BuildContext context) async{
    isSignUpDone.value=true;
    var request = {
    ApiUtils.userNameAuth: userSignUpController.text.toString(),
    ApiUtils.passwordAuth: passwordSignUpController.text.toString(),
    ApiUtils.emailAuth: emailSignUpController.text.toString(),
    ApiUtils.profileAuth: {
      ApiUtils.firstNameAuth: firstNameSignUpController.text.toString(),
      ApiUtils.lastNameAuth: lastNameSignUpController.text.toString()
    }
    };

    try{
      var response = await authPost(url: ApiUtils.signUpUrl, body: request);
      if(response !=null){
        print(response.data);
        print(response.statusCode);
        successToast('User Sign Up Successfully Done');
        isSignUpDone.value=false;
        Get.offAll(()=>SignInScreen());

      }

    }catch (e) {
      if (e is DioError) {
        if (e.response!.statusCode == 409) {

          errorSnackBar(context, "User Email:${emailSignUpController.text} already exists in Database");
          isSignUpDone.value=false;
        } else {

          errorSnackBar(context, "Something went wrong");
          isSignUpDone.value=false;
        }
      } else {
        errorSnackBar(context, "Something went wrong");
        isSignUpDone.value=false;
      }
    }
  }
  _getProfileData() async{

   // var session=await SharedPrefs().getSession();
    print('Session id: ${await SharedPrefs().getSession()}');

      try {
        final dio = Dio();
        dio.options.headers[ApiUtils.userAuthSession] = await SharedPrefs().getSession();
        final response=await dio.get('${ApiUtils.userProfileUrl}${await SharedPrefs().getUserId()}');
        if(response.statusCode==200){

          print(response);
          final model=profileDataModelFromJson(response.toString());
          await SharedPrefs().storeUserEmail(model!.username);
          await SharedPrefs().storeUserFn(model.profile!.firstName);
          await SharedPrefs().storeUserLn(model.profile!.lastName);
          print(await SharedPrefs().getUserFn());
          print(await SharedPrefs().getUserLn());
          print(await SharedPrefs().getUserEmail());
          firstNameHomeController.text= await SharedPrefs().getUserFn();
          lastNameHomeController.text= await SharedPrefs().getUserLn();
          userHomeController.text= await SharedPrefs().getUserEmail();

        }

      }  catch (e) {
        if (e is DioError) {
          if (e.response!.statusCode == 409) {

         print(e.response);
          } else {

            print(e.response);
          }
        } else {
          print(e.toString());
        }
      }


  }


@override
  void onInit() {
    // TODO: implement onInit
 // _getProfileDataFromLocal();
   _getProfileData();
    super.onInit();
  }
}

