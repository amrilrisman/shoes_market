import 'dart:convert';

import 'package:package/core/data/spref.dart';
import 'package:package/services/request_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// email amrilris@gmail.com
/// 12345678
class LoginService {
  Future loginService({required String email, required String password}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Map<String, dynamic> dataBody = {
      'email': email,
      'password': password,
    };
    Map<String, String> headers = {};
    var response = await RequestService.post(
      url: '/login',
      headers: headers,
      dataBody: dataBody,
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data'];
      var token = 'Bearer ${data['access_token']}';
      preferences.setString(SprefKey.token, token);
      print(token);
      return token;
    } else {
      return null;
    }
  }
}
