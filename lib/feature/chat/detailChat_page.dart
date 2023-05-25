// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:package/core/style/theme.dart';
import 'package:package/widgets/card_chat.dart';
import 'package:package/widgets/card_previewItems.dart';

class DetailChatPage extends StatelessWidget {
  static String rootName = '/detailChat';
  const DetailChatPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: _appBar(context: context),
      body: _bodyChat(context),
    );
  }

  _appBar({required BuildContext context}) {
    return PreferredSize(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: margin30, vertical: 16),
          child: Row(
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  'assets/Button Back.png',
                  height: 12,
                  width: 6,
                ),
              ),
              const SizedBox(width: 25),
              Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.only(right: 2, bottom: 2),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/Logo Shop Picture.png'),
                      fit: BoxFit.fill),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: const Color(0XFF51C17E),
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: const Color(0XFF1F1D2B), width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Shoe Stroe',
                    style: primaryTextStyle.copyWith(
                      color: backgroundCard,
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    'Online',
                    style: primaryTextStyle.copyWith(
                      color: const Color(0XFF999999),
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      preferredSize: const Size.fromHeight(90),
    );
  }

  contenChat() {
    return Expanded(
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          ChatBubble(
            text: 'Hi, This item is still available?',
            isSend: true,
            hasProduct: true,
          ),
          ChatBubble(
            text: 'Good night, This item is only available in size 42 and 43',
            isSend: false,
            hasProduct: false,
          ),
          ChatBubble(
            text: 'Owww, it suits me very well',
            isSend: true,
            hasProduct: false,
          ),
        ],
      ),
    );
  }

  Widget _cardPreview() {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 20, right: 130, bottom: 20),
        decoration: BoxDecoration(
            color: const Color(0xFF2B2844),
            borderRadius: BorderRadius.circular(
              12,
            ),
            border: Border.all(
              color: primaryColor,
              width: 1,
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                      image: AssetImage('assets/item_shoes.png'),
                      fit: BoxFit.fill)),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Court Vision start s',
                    style: primaryTextStyle.copyWith(
                      color: backgroundCard,
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\$57,15',
                    style: priceTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 19),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/close_iconButton.png',
                width: 22,
                height: 22,
              ),
            ),
          ],
        ));
  }

  _chatInput() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _cardPreview(),
        Container(
          margin: const EdgeInsets.all(20),
          width: double.infinity,
          height: 45,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: backgroundColor4,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: TextField(
                      style: primaryTextStyle.copyWith(
                          color: backgroundCard,
                          fontSize: 14,
                          fontWeight: regular),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: 'Typle Message...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: descriptionTextColor,
                          fontSize: 14,
                          fontWeight: regular,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                width: 45,
                margin: const EdgeInsets.only(left: 20),
                padding: const EdgeInsets.only(
                    left: 16, right: 13, bottom: 13, top: 13),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: primaryColor),
                child: Image.asset(
                  'assets/icon_send_btn.png',
                  height: 15,
                  width: 18,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _bodyChat(context) {
    return Container(
      width: double.infinity,
      color: backgroundColor3,
      child: Column(
        children: [
          contenChat(),
          const SizedBox(
            height: 20,
          ),
          _chatInput(),
        ],
      ),
    );
  }
}
