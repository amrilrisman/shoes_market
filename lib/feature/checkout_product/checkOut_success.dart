// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:package/core/style/theme.dart';
import 'package:package/feature/home/current_page.dart';

class CheckOutSuccessPage extends StatelessWidget {
  static String rootName = '/checkout-success';
  const CheckOutSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context: context),
      backgroundColor: backgroundColor3,
      body: _bodySuccessCheckOut(context),
    );
  }

  _bodySuccessCheckOut(context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: backgroundColor3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/empty_cart.png',
            height: 62,
            width: 74,
            color: secondaryColor,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'You made a transaction',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Stay at home while we\nprepare your dream shoes',
            textAlign: TextAlign.center,
            style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
                color: const Color(0XFF999999)),
          ),
          const SizedBox(
            height: 20,
          ),
          FlatButton(
            height: 44,
            minWidth: 192,
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onPressed: () {
              Navigator.pushNamed(context, CurrentPage.rootName);
            },
            child: Text(
              'Order Other Shoes',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          FlatButton(
            height: 44,
            minWidth: 192,
            color: const Color(0XFF39374B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onPressed: () {},
            child: Text(
              'View My Order',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          )
        ],
      ),
    );
  }

  _appBar({required BuildContext context}) {
    return PreferredSize(
      // ignore: sort_child_properties_last
      child: AppBar(
        backgroundColor: backgroundColor1,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Checkout Success',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
      preferredSize: const Size.fromHeight(75),
    );
  }
}
