import 'package:flutter/cupertino.dart';
import 'package:package/services/register_service.dart';

class RegisterProvider with ChangeNotifier {
  Future<bool?> register(
      {String? name, String? email, String? username, String? password}) async {
    try {
      await RegisterService().registerService(
          name: name!, email: email!, username: username!, password: password!);
      return true;
    } catch (e) {
      return false;
    }
  }
}
