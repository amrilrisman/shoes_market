import 'dart:async';

import 'package:flutter/material.dart';
import 'package:package/pages/sign-in_page.dart';
import 'package:package/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  static String rootName = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3),
        (() => Navigator.pushNamed(context, SignIn.rootName)));
  }

  @override
  Widget build(BuildContext context) {
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
