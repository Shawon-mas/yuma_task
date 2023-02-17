import 'package:dio/dio.dart';

Future<Response?> authPost({required String url, required dynamic body}) async {
  Dio dio = Dio();
  Response  response = await dio.post(
      url,
      data: body,
    options: Options(contentType: Headers.jsonContentType),
  );
 return response;
}

/*Future<http.Response?> generalGet({required String url}) async {
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return response;
  } else
    return null;
}*/
//ApiServices().headerWithToken()
/*
else if(response.statusCode==409){
      print(false);
      print('registered');
      print(response.data);
    }
 */