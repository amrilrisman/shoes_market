// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:package/core/data/spref.dart';

import 'package:package/services/request_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterService {
  Future registerService(
      {required String name,
      required String email,
      required String username,
      required String password}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var headers = {'Accept': ' '};
    var dataBody = {
      'name': name,
      'email': email,
      'username': username,
      'password': password,
    };

    var response = await RequestService.post(
      url: '/register',
      headers: headers,
      dataBody: dataBody,
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body)["data"];
      var token = 'Bearer ' + data['access_token'];
      preferences.setString(SprefKey.token, token.toString());
      print(token);
      return token;
    } else {
      return null;
    }
  }
}
