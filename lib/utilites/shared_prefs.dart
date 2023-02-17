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


  prefsClear() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }



}
