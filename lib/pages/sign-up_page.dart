import 'package:flutter/material.dart';
import 'package:package/content/reusable_widget.dart';
import 'package:package/pages/sign-in_page.dart';
import 'package:package/theme/theme.dart';

class SignUpPage extends StatelessWidget {
  static String rootName = '/sign-up';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor1,
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.all(margin30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign Up',
                style: primaryTextStyle.copyWith(
                    fontSize: 24, fontWeight: semiBold),
              ),
              Text(
                'Register and Happy Shoping',
                style: descriptionTextStyle.copyWith(
                    fontSize: 14, fontWeight: regular),
              ),
              const SizedBox(height: 20),
              formInput(
                titleForm: 'Full Name',
                hintText: 'Your Full Name',
                iconLeading: 'assets/fullname_icon.png'
              ),
              const SizedBox(height: 20),
              formInput(
                titleForm: 'Username',
                hintText: 'Your Full Name',
                iconLeading: 'assets/username_icon.png'
              ),
              const SizedBox(height: 20),
              formInput(
                titleForm: 'Email Address',
                hintText: 'Your Full Name',
                iconLeading: 'assets/Email_Icon.png'
              ),
              const SizedBox(height: 20),
              formInput(
                titleForm: 'Passowrd',
                hintText: 'Your Full Name',
                iconLeading: 'assets/Password_Icon.png'
              ),
              const SizedBox(height: 30),
              buttonPrimary(onTap: () {
                // TODO: Sign up
              }, textButton: 'Sign Up'),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: descriptionTextStyle.copyWith(
                        fontSize: 12, fontWeight: regular),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SignIn.rootName);
                    },
                    child: Text(
                      'Sign In',
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
