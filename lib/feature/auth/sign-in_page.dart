// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:package/core/presentation/reusable_widget.dart';
import 'package:package/feature/auth/sign-up_page.dart';
import 'package:package/feature/home/current_page.dart';
import 'package:package/providers/login_provider.dart';
import 'package:package/core/style/theme.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  static String rootName = '/sign-in';
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    LoginProvider provider = Provider.of<LoginProvider>(context);

    _loginValidate() async {
      Navigator.pushNamed(context, CurrentPage.rootName);
      // if (emailController.text != '' && passwordController.text != '') {
      //   await provider.loginProvide(
      //     email: emailController.text,
      //     password: passwordController.text,
      //   );
      //   if (provider.validateLogin != true) {
      //     Navigator.pushNamed(context, CurrentPage.rootName);
      //   } else {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(
      //         content: const Text('Gagal Login'),
      //         backgroundColor: alertColor,
      //       ),
      //     );
      //   }
      // }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor1,
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.all(margin30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: primaryTextStyle.copyWith(
                    fontSize: 24, fontWeight: semiBold),
              ),
              Text(
                'Sign In to Countinue',
                style: descriptionTextStyle.copyWith(fontWeight: regular),
              ),
              const SizedBox(height: 70),
              formInput(
                  controller: emailController,
                  titleForm: 'Email Address',
                  iconLeading: 'assets/Email_Icon.png',
                  hintText: 'Your Email Address'),
              const SizedBox(height: 20),
              formInput(
                  controller: passwordController,
                  obscureText: true,
                  titleForm: 'Password',
                  iconLeading: 'assets/Password_Icon.png',
                  hintText: 'Your Password'),
              const SizedBox(height: 30),
              Consumer<LoginProvider>(
                  builder: ((context, value, child) =>
                      value.validateLogin == false
                          ? buttonPrimary(
                              onTap: _loginValidate, textButton: 'Sign In')
                          : buttonLoading())),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: descriptionTextStyle.copyWith(
                        fontSize: 12, fontWeight: regular),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpPage.rootName);
                    },
                    child: Text(
                      'Sign up',
                      style: priceTextStyle.copyWith(
                          fontSize: 12, fontWeight: medium),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
