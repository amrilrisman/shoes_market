import 'package:flutter/material.dart';
import 'package:package/pages/home/current_page.dart';
import 'package:package/pages/sign-in_page.dart';
import 'package:package/pages/sign-up_page.dart';
import 'package:package/pages/splash_screen_page.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.rootName: (context) => const SplashScreen(),
        SignIn.rootName: (context) => const SignIn(),
        SignUpPage.rootName: (context) => const SignUpPage(),
        CurrentPage.rootName: (context) => const CurrentPage(),
      },
    );
  }
}
