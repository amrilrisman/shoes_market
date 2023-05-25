// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:package/core/presentation/reusable_widget.dart';
import 'package:package/feature/auth/sign-in_page.dart';
import 'package:package/feature/home/current_page.dart';
import 'package:package/providers/register_provider.dart';
import 'package:package/core/style/theme.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  static String rootName = '/sign-up';
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RegisterProvider _provider = Provider.of<RegisterProvider>(context);

    validateRegister() async {
      if (nameController.text != '' &&
          emailController.text != '' &&
          usernameController.text != '' &&
          passwordController.text != '') {
        var validateRegister = await _provider.register(
          name: nameController.text,
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text,
        );

        print('toStrinna sd +===> ' + validateRegister.toString());

        if (validateRegister == true) {
          Navigator.pushNamed(context, CurrentPage.rootName);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Gagal membuat account'),
              backgroundColor: alertColor,
            ),
          );
        }
      }
    }

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
                  controller: nameController,
                  titleForm: 'Full Name',
                  hintText: 'Your Full Name',
                  iconLeading: 'assets/fullname_icon.png'),
              const SizedBox(height: 20),
              formInput(
                  controller: usernameController,
                  titleForm: 'Username',
                  hintText: 'username',
                  iconLeading: 'assets/username_icon.png'),
              const SizedBox(height: 20),
              formInput(
                  controller: emailController,
                  titleForm: 'Email Address',
                  hintText: 'Email Address',
                  iconLeading: 'assets/Email_Icon.png'),
              const SizedBox(height: 20),
              formInput(
                  obscureText: true,
                  controller: passwordController,
                  titleForm: 'Passowrd',
                  hintText: '********',
                  iconLeading: 'assets/Password_Icon.png'),
              const SizedBox(height: 30),
              buttonPrimary(onTap: validateRegister, textButton: 'Sign Up'),
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
