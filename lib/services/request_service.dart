import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:package/core/data/spref.dart';

import 'package:shared_preferences/shared_preferences.dart';

class RequestService {
  // https://shamo-backend.buildwithangga.id/api/register
  static String baseUrl = 'https://shamo-backend.buildwithangga.id/api';
  static get({
    required String url,
    required Map<String, String> headers,
  }) {
    try {
      var response = http.get(Uri.parse(baseUrl + url), headers: headers);
      return response;
    } catch (e) {
      return null;
    }
  }

  static post(
      {required String url,
      required Map<String, String> headers,
      required Map<String, dynamic> dataBody}) async {
    try {
      var response = await http.post(
        Uri.parse(baseUrl + url),
        headers: headers,
        body: dataBody,
      );
      return response;
    } catch (e) {
      return null;
    }
  }

  static token() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString(SprefKey.token);
    if (token != null) {
      return token;
    } else {
      return null;
    }
  }
}
