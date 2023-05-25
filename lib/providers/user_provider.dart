import 'package:flutter/foundation.dart';
import 'package:package/models/user_model.dart';
import 'package:package/services/user_service.dart';

class UserProvider with ChangeNotifier {
  late UserModel _userModel;
  // final bool _isLoadingData = true;

  UserModel get userModel => _userModel;
  // bool get isLoadingData => _isLoadingData;

  set userModel(UserModel usermodel) {
    _userModel = userModel;
    notifyListeners();
  }

  Future getUser() async {
    var userModel = await UserService().userService();
    _userModel = userModel;

    notifyListeners();
  }

  // loadingDataUser() {
  //   if (_userModel ) {
  //     _isLoadingData == false;
  //   }
  //   notifyListeners();
  // }
}
