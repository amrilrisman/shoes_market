import 'dart:convert';

import 'package:package/models/user_model.dart';
import 'package:package/services/request_service.dart';

class UserService {
  Future userService() async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': await RequestService.token(),
    };

    try {
      var response = await RequestService.get(url: '/user', headers: headers);
      var data = json.decode(response.body)['data'];
      if (response.statusCode == 200) {
        return UserModel.jsonObject(data);
      } else {
        return null;
      }
    } catch (e) {
      throw 'Terjadi Kesalan user service';
    }
  }
}
