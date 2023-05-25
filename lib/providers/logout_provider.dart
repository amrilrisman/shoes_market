import 'package:flutter/foundation.dart';
import 'package:package/services/logout_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutProvider with ChangeNotifier {
  var _validateLogout;

  get validateLogout => _validateLogout;

  logOutProvider() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    
    try {
      var response = await LogOutService().logoutService();
      preferences.clear();
      _validateLogout = response;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
