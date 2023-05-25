import 'dart:async';

import 'package:flutter/material.dart';
import 'package:package/core/data/spref.dart';
import 'package:package/feature/auth/sign-in_page.dart';
import 'package:package/feature/home/current_page.dart';
import 'package:package/providers/user_provider.dart';
import 'package:package/core/style/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static String rootName = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // late  _preferences;
  @override
  void initState() {
    super.initState();

    // _sPreferences();
    _validateUserLogin();
  }

  _validateUserLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var duration = const Duration(seconds: 3);
    Timer(
        duration,
        () => preferences.getString(SprefKey.token) != null
            ? navigationHome()
            : navigationLogin());
  }

  navigationLogin() {
    Navigator.pushNamed(context, SignIn.rootName);
  }

  navigationHome() {
    Navigator.pushNamed(context, CurrentPage.rootName);
  }

  @override
  Widget build(BuildContext context) {
    // var cek = Provider.of<UserProvider>(context, listen: false);
    // print('-----> ' + cek.userModel.name.toString());

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Image.asset(
          'assets/logo_splash.png',
          width: 130,
          height: 150,
        ),
      ),
    );
  }
}
