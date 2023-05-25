import 'package:flutter/foundation.dart';
import 'package:package/services/login_service.dart';

class LoginProvider with ChangeNotifier {
  bool _validateLogin = false;

  bool get validateLogin => _validateLogin;

  loginProvide({required String email, required String password}) async {
    _validateLogin = true;
    notifyListeners();
    try {
      await LoginService().loginService(email: email, password: password);
      _validateLogin = true;
      notifyListeners();
    } catch (e) {
      _validateLogin = false;
      notifyListeners();
    }
    _validateLogin = false;
    notifyListeners();
  }
}
