import 'package:flutter/material.dart';
import 'package:package/core/style/theme.dart';
import 'package:package/feature/auth/sign-in_page.dart';
import 'package:package/feature/auth/sign-up_page.dart';
import 'package:package/feature/cart/cart_page.dart';
import 'package:package/feature/chat/detailChat_page.dart';
import 'package:package/feature/checkout_product/checkOut_success.dart';
import 'package:package/feature/checkout_product/detail_checkOut_page.dart';
import 'package:package/feature/detail_product/detail_product.dart';
import 'package:package/feature/home/current_page.dart';
import 'package:package/feature/profile/edt_profile.dart';
import 'package:package/feature/splash_screen_page.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent,
        colorScheme: schemeColor,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.rootName: (context) => const SplashScreen(),
        SignIn.rootName: (context) => const SignIn(),
        SignUpPage.rootName: (context) => SignUpPage(),
        CurrentPage.rootName: (context) => const CurrentPage(),
        EdtProfile.rootName: (context) => EdtProfile(),
        DetailChatPage.rootName: (context) => const DetailChatPage(),
        DetailsProductPage.rootName: (context) => const DetailsProductPage(),
        CartPage.rootName: (context) => const CartPage(),
        DetailCheckOutPage.rootName: (context) => const DetailCheckOutPage(),
        CheckOutSuccessPage.rootName: (context) => const CheckOutSuccessPage()
      },
    );
  }
}
