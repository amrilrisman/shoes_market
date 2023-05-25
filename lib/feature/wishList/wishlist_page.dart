// ignore_for_file: sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:package/core/style/theme.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key}) : super(key: key);
  _appBar({required BuildContext context}) {
    return PreferredSize(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: margin30, vertical: 16),
          child: Center(
            child: Text(
              'Favorite Shoes',
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

  _emptyFavorite() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: backgroundColor3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon_navbar_fav.png',
            height: 62,
            width: 74,
            color: secondaryColor,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'You don\'t have dream shoes?',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Let\'s find your favorite shoes',
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
              child: _cardFavorite(onTap: () {}),
            )),
      ),
    );
  }

  Widget _cardFavorite({required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: margin30),
        padding: const EdgeInsets.fromLTRB(12, 10, 20, 14),
        decoration: BoxDecoration(
          color: backgroundColor4,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: primarTextColor,
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                    image: AssetImage('assets/item_shoes.png'),
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
                    'Terrex Urban Low',
                    maxLines: 2,
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\$143,98',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: secondaryColor,
              ),
              child: Image.asset(
                'assets/icon_navbar_fav.png',
                height: 10,
                width: 12,
                color: primarTextColor,
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
      appBar: _appBar(context: context),
      backgroundColor: backgroundColor1,
      // body: _emptyFavorite(),
      body: _bodyFavorite(),
    );
  }
}
