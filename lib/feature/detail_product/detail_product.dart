// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:package/feature/cart/cart_page.dart';
import 'package:package/core/style/theme.dart';

class DetailsProductPage extends StatefulWidget {
  static String rootName = '/detail_page';
  const DetailsProductPage({Key? key}) : super(key: key);

  @override
  State<DetailsProductPage> createState() => _DetailsProductPageState();
}

class _DetailsProductPageState extends State<DetailsProductPage> {
  int _currentSlider = 0;
  bool isLike = true;

  final List listSlider = [
    'assets/item_shoes.png',
    'assets/item_shoes.png',
    'assets/item_shoes.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  _headers() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                'assets/Button Back.png',
                width: 6,
                height: 12,
                color: backgroundColor1,
              ),
            ),
            Image.asset(
              'assets/icon_cart.png',
              width: 20,
              height: 22,
            ),
          ],
        ),
      ),
    );
  }

  _sliderIndicator({required double width, required Color color}) {
    return Container(
      width: width,
      height: 4,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  _sliderProduct() {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 280,
          width: double.infinity,
          child: PageView.builder(
            itemCount: listSlider.length,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (newValue) {
              setState(() {
                _currentSlider = newValue;
              });
            },
            itemBuilder: ((context, index) => Image.asset(
                  listSlider[index],
                  width: double.infinity,
                  fit: BoxFit.fill,
                )),
          ),
        ),
        Container(
          height: 5,
          margin: const EdgeInsets.only(bottom: 17),
          width: MediaQuery.of(context).size.width * 0.2,
          child: Align(
            alignment: Alignment.center,
            child: ListView.builder(
                itemCount: listSlider.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) => _sliderIndicator(
                    color: index == _currentSlider
                        ? primaryColor
                        : const Color(0XFFC4C4C4),
                    width: index == _currentSlider ? 16 : 4))),
          ),
        )
      ],
    );
  }

  _cardFimiliarShoes() {
    return Container(
      height: 54,
      width: 54,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        image: const DecorationImage(
            image: AssetImage(
              'assets/item_shoes.png',
            ),
            fit: BoxFit.fill),
      ),
    );
  }

  _snackBarAddWhiteList() {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
        content: Container(
          height: 42,
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Text(
            'Has been added to the Whitelist',
            style: primaryTextStyle.copyWith(
              fontWeight: regular,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  _snackBarRemoveWhiteList() {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
        content: Container(
          height: 42,
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
            color: alertColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Text(
            'Has been removed from the Whitelist',
            style: primaryTextStyle.copyWith(
              fontWeight: regular,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  showDialogAddCart() {
    // check_list
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        // contentPadding: const EdgeInsets.all(20),
        backgroundColor: backgroundColor3,
        content: SizedBox(
          height: 266,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close_rounded,
                    size: 16,
                    color: backgroundCard,
                  ),
                ),
              ),
              Image.asset(
                'assets/check_list.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Hurray :)',
                style: primaryTextStyle.copyWith(
                  color: backgroundCard,
                  fontWeight: semiBold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Item added successfully',
                style: primaryTextStyle.copyWith(
                  color: const Color(0XFF999999),
                  fontWeight: regular,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FlatButton(
                minWidth: 165,
                height: 44,
                color: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, CartPage.rootName),
                // TODO: btn vie card

                child: Text(
                  'View My Cart',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _contentProduct() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          color: backgroundColor1,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'terrex urban low'.toUpperCase(),
                            style: primaryTextStyle.copyWith(
                                color: backgroundCard,
                                fontSize: 18,
                                fontWeight: semiBold),
                          ),
                          Text(
                            'hiking'.toUpperCase(),
                            style: primaryTextStyle.copyWith(
                                color: const Color(0XFF999999),
                                fontSize: 12,
                                fontWeight: regular),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 46,
                      width: 46,
                      margin: const EdgeInsets.only(left: 16),
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 13),
                      decoration: BoxDecoration(
                        color:
                            isLike ? backgroundCard : const Color(0XFF423F53),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/icon_navbar_fav.png',
                        color:
                            isLike == true ? backgroundCard : backgroundColor1,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //NOTE: prite
              Container(
                padding: const EdgeInsets.all(16),
                margin: EdgeInsets.only(
                    bottom: 30, left: margin30, right: margin30),
                decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price starts from',
                      style: primaryTextStyle.copyWith(
                          color: backgroundCard,
                          fontSize: 14,
                          fontWeight: regular),
                    ),
                    Text(
                      '\$143,98',
                      style: priceTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
              ),

              // NOTE: description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Description',
                  style: primaryTextStyle.copyWith(
                    color: backgroundCard,
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.',
                  style: priceTextStyle.copyWith(
                    color: Color(0xFF999999),
                    fontSize: 14,
                    fontWeight: light,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              // NOTE: other same as products // Familiar Shoess
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Fimiliar Shoes',
                  style: primaryTextStyle.copyWith(
                    color: backgroundCard,
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 55,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 22)
                        : index == 9
                            ? const EdgeInsets.only(right: 22)
                            : EdgeInsets.zero,
                    child: _cardFimiliarShoes(),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              // NOTE: button Actions
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 16),
                child: Row(
                  children: [
                    FlatButton(
                      height: 54,
                      minWidth: 54,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: primaryColor)),
                      onPressed: () {},
                      child: Image.asset(
                        'assets/icon_chat_btn.png',
                        height: 23,
                        width: 23,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: FlatButton(
                        height: 54,
                        color: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onPressed: () {
                          showDialogAddCart();
                        },
                        child: Text(
                          'Add to Cart',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Stack(
          children: [
            _sliderProduct(),
            _headers(),
          ],
        ),
        _contentProduct(),
      ],
    );
  }
}
