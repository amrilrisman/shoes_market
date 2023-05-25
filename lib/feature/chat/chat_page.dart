// ignore_for_file: sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:package/core/style/theme.dart';
import 'package:package/feature/chat/detailChat_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  _appBar({required BuildContext context}) {
    return PreferredSize(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: margin30, vertical: 16),
          child: Center(
            child: Text(
              'Message Support',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
          ),
        ),
      ),
      preferredSize: const Size.fromHeight(87),
    );
  }

  _emptyChat() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: backgroundColor3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon_headset.png',
            height: 62,
            width: 74,
            color: secondaryColor,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Opps no message yet?',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'You have never done a transaction',
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
            minWidth: 152,
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onPressed: () {},
            child: Text(
              'Explore Store',
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

  _bodyFavorite() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: backgroundColor3,
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: ((context, index) => Padding(
              padding: index == 0
                  ? const EdgeInsets.only(top: 30, bottom: 10)
                  : index == 1
                      ? const EdgeInsets.only(top: 10, bottom: 30)
                      : const EdgeInsets.all(10),
              child: _cardFavorite(onTap: () {
                Navigator.pushNamed(context, DetailChatPage.rootName);
              }),
            )),
      ),
    );
  }

  Widget _cardFavorite({required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: margin30),
        padding: const EdgeInsets.only(bottom: 12),
        decoration: const BoxDecoration(
            // color: backgroundColor4,
            // borderRadius: BorderRadius.circular(12),
            border: Border(
          bottom: BorderSide(
            color: Color(0XFF2B2939),
          ),
        )),
        child: Row(
          children: [
            Container(
              height: 54,
              width: 54,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/Logo Shop Picture.png'),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    maxLines: 1,
                    style: primaryTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: regular,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Good night, This item is on',
                    maxLines: 1,
                    style: priceTextStyle.copyWith(
                      fontSize: 14,
                      color: const Color(0XFF999999),
                      fontWeight: medium,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              'now',
              maxLines: 1,
              style: priceTextStyle.copyWith(
                fontSize: 10,
                color: const Color(0XFF999999),
                fontWeight: light,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: _appBar(context: context),
      // body: _emptyChat(),
      body: _bodyFavorite(),
    );
  }
}
