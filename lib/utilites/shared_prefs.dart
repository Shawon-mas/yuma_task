import 'package:shared_preferences/shared_preferences.dart';

import '../data/network/api_services.dart';

class SharedPrefs {


  //save user id
  storeUserId(userID) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_id', userID);
  }
  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }

  storeUserEmail(userID) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(ApiUtils.emailAuth, userID);
  }
  getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(ApiUtils.emailAuth);
  }

  storeUserFn(userID) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(ApiUtils.firstNameAuth, userID);
  }
  getUserFn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(ApiUtils.firstNameAuth);
  }

  storeUserLn(userID) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(ApiUtils.lastNameAuth, userID);
  }
  getUserLn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(ApiUtils.lastNameAuth);
  }


  //Session Manager
  isLogin(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', value);
  }

  getIsLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogin');
  }


//Session Store
  saveSession(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('session_id', token);
  }

  getSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('session_id');
  }

  generalStoreData({required String key, required String value})async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
  Future<dynamic> generalGetData({required String key})async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }


  prefsClear() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }



}
