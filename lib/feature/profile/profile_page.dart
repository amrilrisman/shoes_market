// ignore_for_file: sort_child_properties_last, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:package/feature/auth/sign-in_page.dart';
import 'package:package/feature/profile/edt_profile.dart';
import 'package:package/providers/logout_provider.dart';
import 'package:package/core/style/theme.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  _appBar(Function() onTapLogout) {
    return PreferredSize(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: margin30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 64,
                width: 64,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/profile_default.png'),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hallo, Alex',
                      maxLines: 2,
                      style: primaryTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                    Text(
                      '@alexkeinn',
                      maxLines: 1,
                      style: secondaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: regular),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 16),
              InkWell(
                onTap: onTapLogout,
                splashColor: Colors.red.withOpacity(0.5),
                child: Image.asset(
                  'assets/icon_exit_btn.png',
                  height: 20,
                  width: 20,
                ),
              )
            ],
          ),
        ),
        preferredSize: const Size.fromHeight(125));
  }

  _menuSettings({required BuildContext context}) {
    return Container(
      width: double.infinity,
      color: backgroundColor3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: margin30, right: margin30, top: 20),
            child: Text(
              'Account',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          _cardSetting(
            onTap: () {
              Navigator.pushNamed(context, EdtProfile.rootName);
            },
            textButton: 'Edit Profile',
          ),
          _cardSetting(
            onTap: () {},
            textButton: 'Your Orders',
          ),
          _cardSetting(
            onTap: () {},
            textButton: 'Help',
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: margin30),
            child: Text(
              'General',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          _cardSetting(
            onTap: () {},
            textButton: 'Privacy & Policy',
          ),
          _cardSetting(
            onTap: () {},
            textButton: 'Term of Service',
          ),
          _cardSetting(
            onTap: () {},
            textButton: 'Rate App',
          ),
        ],
      ),
    );
  }

  _cardSetting({required Function() onTap, required String textButton}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: margin30, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textButton,
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
                fontWeight: regular,
              ),
            ),
            Image.asset(
              'assets/arrow_right.png',
              height: 6,
              width: 12,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    LogoutProvider logoutProvider = Provider.of<LogoutProvider>(context);
    logOutValidate() async {
      var response = await logoutProvider.logOutProvider();
      print(response);
      if (response == true) {
        Navigator.pushNamed(context, SignIn.rootName);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Gagal LogOut'),
            backgroundColor: alertColor,
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: _appBar(logOutValidate),
      body: _menuSettings(context: context),
    );
  }
}
