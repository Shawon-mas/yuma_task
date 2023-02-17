
class ApiUtils{
  static const String baseUrl='https://labapi.yuma-technology.co.uk:8443/delivery';
  static const String signInUrl='$baseUrl/consumer/login';
  static const String signUpUrl='$baseUrl/consumer/register';

  static const String userProfileUrl='$baseUrl/consumer/$userAuthId';

  //api key
  static const String firstNameAuth='first_name';
  static const String lastNameAuth='last_name';
  static const String userNameAuth='username';
  static const String emailAuth='email';
  static const String profileAuth='profile';
  static const String passwordAuth='password';

  static const String userAuthId='consumer_id';
  static const String userAuthSession='consumersession';

  static const String userAuthUniqueId='consumer_uuid';
  static const String userAuthSessionId='session_id';




}