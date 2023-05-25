// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:package/core/style/theme.dart';

class EdtProfile extends StatelessWidget {
  EdtProfile({Key? key}) : super(key: key);
  final TextEditingController _inputName = TextEditingController();
  static String rootName = '/edt_profile';

  _appBar({required BuildContext context}) {
    return PreferredSize(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: margin30, vertical: 16),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/remove_icon.png',
                      height: 14,
                      width: 14,
                    )),
                Text(
                  'Edit Profile',
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/check_icon.png',
                      height: 14,
                      width: 14,
                    )),
              ],
            ),
          ),
        ),
      ),
      preferredSize: const Size.fromHeight(87),
    );
  }

  _bodyEdtProfile() {
    return Container(
      color: backgroundColor3,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: margin30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: margin30),
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  'assets/profile_default.png',
                ),
              ),
            ),
          ),
          _textFieldCustom(
            title: 'Name',
            hint: 'Input name',
            controller: _inputName,
          ),
          const SizedBox(
            height: 24,
          ),
          _textFieldCustom(
              title: 'Username',
              hint: 'Input username',
              controller: _inputName),
          const SizedBox(
            height: 24,
          ),
          _textFieldCustom(
              title: 'Email Address',
              hint: 'Input email address',
              controller: _inputName),
        ],
      ),
    );
  }

  _textFieldCustom(
      {required String title,
      required String hint,
      required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: primaryTextStyle.copyWith(
            fontSize: 13,
            fontWeight: medium,
            color: const Color(0XFF999999),
          ),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: '$hint',
            hintStyle: const TextStyle(fontSize: 16, color: Color(0xFF504F5E)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: descriptionTextColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: descriptionTextColor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: descriptionTextColor),
            ),
          ),
          style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor1,
      appBar: _appBar(context: context),
      body: _bodyEdtProfile(),
    );
  }
}
