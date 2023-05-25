import 'dart:convert';

import 'package:package/core/data/spref.dart';
import 'package:package/services/request_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutService {
  logoutService() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString(SprefKey.token);
    Map<String, dynamic> dataBody = {};
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': token.toString()
    };
    if (token != null) {
      var response = await RequestService.post(
        url: '/logout',
        headers: headers,
        dataBody: dataBody,
      );
      if (response.statusCode == 200) {
        var jsonObject = json.decode(response.body)['data'];
        preferences.clear();
        return jsonObject;
      } else {
        return null;
      }
    }
  }
}
