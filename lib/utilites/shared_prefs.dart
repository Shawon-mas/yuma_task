import 'package:shared_preferences/shared_preferences.dart';

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

  storeUserNumber(userNumber) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_number', userNumber);
  }
  getUserNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_number');
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

  removeLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('isLogin');
  }
  //User Info Store

  storeUserData(user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_info', user);
  }

  getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_info');
  }

  removeUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('user_info');
  }

//Token Store
  saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', token);
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }


  prefsClear() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }



}
