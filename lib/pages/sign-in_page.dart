import 'package:flutter/material.dart';
import 'package:package/theme/theme.dart';

class SignIn extends StatelessWidget {
  static String rootName = '/sign-in';
  const SignIn({Key? key}) : super(key: key);

  Widget _formInput(
      {String? titleForm,
      String? hintText,
      String? iconLeading,
      TextEditingController? controller}) {
    return Column(
      children: [
        Text(
          titleForm!,
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
        ),
        Container(
          height: 50,
          color: backgroundColor2,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Image.asset(iconLeading!),
              const SizedBox(width: 16),
              // const Expanded(
              //   // child: TextField(
              //   //   controller: controller,
              //   //   style: TextStyle(color: primarTextColor),
              //   //   decoration: InputDecoration(hintText: '$hintText'),
              //   // ),
              // )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Text(
            'Login',
            style:
                primaryTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
          ),
          Text(
            'Sign In to Countinue',
            style: descriptionTextStyle.copyWith(fontWeight: regular),
          ),
          const SizedBox(height: 70),
          const SizedBox(height: 20),
          const SizedBox(height: 30),
          Spacer()
        ],
      ),
    );
  }
}
