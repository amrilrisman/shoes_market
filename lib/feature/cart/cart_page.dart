// ignore_for_file: sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:package/core/style/theme.dart';
import 'package:package/feature/checkout_product/detail_checkOut_page.dart';

class CartPage extends StatelessWidget {
  static String rootName = '/cart_page';
  const CartPage({Key? key}) : super(key: key);

  _appBar({required BuildContext context}) {
    return PreferredSize(
      child: AppBar(
        backgroundColor: backgroundColor1,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Your Cart',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 16,
            color: backgroundCard,
          ),
        ),
      ),
      preferredSize: const Size.fromHeight(75),
    );
  }

  _emptyCart() {
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
            'Opss! Your Cart is Empty',
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

  _bodyCart(context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: backgroundColor3,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: ((context, index) => Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(top: 30, bottom: 10)
                        : index == 1
                            ? const EdgeInsets.only(top: 10, bottom: 30)
                            : const EdgeInsets.all(10),
                    child: _cardCart(onTap: () => null),
                  )),
            ),
          ),
          _navigationBottmBuy(
              tapCheckOut: () =>
                  Navigator.pushNamed(context, DetailCheckOutPage.rootName)),
        ],
      ),
    );
  }

  _navigationBottmBuy({required Function() tapCheckOut}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(
        color: backgroundColor3,
        border: const Border(
          top: BorderSide(
            width: 1,
            // color: Color(0XFF2B2938),
            color: Color(0XFF2B2938),
          ),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: primaryTextStyle.copyWith(
                    color: backgroundCard,
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                ),
                Text(
                  '\$287,96',
                  style: priceTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Color(0XFF2B2938),
            thickness: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: tapCheckOut,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    'Continue to Checkout',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      color: backgroundCard,
                      fontWeight: semiBold,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: backgroundCard,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _cardCart({required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: margin30),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: backgroundColor4,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //NOTe : remove and photo product
            Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                        image: AssetImage('assets/item_shoes.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icon_trash.png',
                        width: 10,
                        height: 12,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Remove',
                        style: priceTextStyle.copyWith(
                          fontSize: 12,
                          color: alertColor,
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 12,
            ),
            //NOTe : title and price
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terrex Urban Low',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
                    maxLines: 1,
                    style: priceTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                _widgetCounter(
                  ontap: () {},
                  icon: Icon(
                    Icons.add,
                    size: 16,
                    color: backgroundCard,
                  ),
                  backgroundColor: primaryColor,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  '2',
                  maxLines: 1,
                  style: priceTextStyle.copyWith(
                    color: backgroundCard,
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                _widgetCounter(
                  ontap: () {},
                  icon: Icon(
                    Icons.remove,
                    color: backgroundCard,
                    size: 16,
                  ),
                  backgroundColor: const Color(0XFF3F4251),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _widgetCounter(
      {required Function() ontap,
      required Color backgroundColor,
      required Widget icon}) {
    return Container(
      height: 16,
      width: 16,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: _appBar(context: context),
      // body: _emptyCart(),
      body: _bodyCart(context),
    );
  }
}
