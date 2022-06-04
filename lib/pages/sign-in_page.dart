import 'package:flutter/material.dart';
import 'package:package/content/reusable_widget.dart';
import 'package:package/pages/sign-up_page.dart';
import 'package:package/theme/theme.dart';

class SignIn extends StatelessWidget {
  static String rootName = '/sign-in';
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  titleForm: 'Email Address',
                  iconLeading: 'assets/Email_Icon.png',
                  hintText: 'Your Email Address'),
              const SizedBox(height: 20),
              formInput(
                  titleForm: 'Password',
                  iconLeading: 'assets/Password_Icon.png',
                  hintText: 'Your Password'),
              const SizedBox(height: 30),
              buttonPrimary(
                  onTap: () {
                    //TODO: untuk aksi login
                  },
                  textButton: 'Sign In'),
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
