// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:package/feature/detail_product/detail_product.dart';
import 'package:package/providers/user_provider.dart';
import 'package:package/core/style/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List textTabBar = [
    'All Shoes',
    'Running',
    'Training',
    'Basketball',
    'Hiking',
  ];
  Widget _cardProduct({required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        // height: 278,
        // width: 215,
        decoration: BoxDecoration(
          color: backgroundCard,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/item_shoes.png',
              height: 120,
              fit: BoxFit.fill,
            ),
            Text(
              'Hiking',
              style: descriptionTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                  color: const Color(0XFF999999)),
            ),
            const SizedBox(height: 6),
            Text(
              'COURT VISION 2.0',
              style: descriptionTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                  color: const Color(0XFF2E2E2E)),
            ),
            const SizedBox(height: 6),
            Text(
              'COURT VISION 2.0',
              style: priceTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardArrivals({required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        padding: EdgeInsets.symmetric(horizontal: margin30),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              decoration: BoxDecoration(
                  color: backgroundCard,
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/item_shoes.png'),
                    fit: BoxFit.fill,
                  )),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Foot Ball',
                      style: primaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: regular,
                          color: const Color(0XFF999999))),
                  Text(
                    'Predator 20.3 Firm Ground asda as a a',
                    maxLines: 2,
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  Text('Foot Ball',
                      style: priceTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    UserProvider user = Provider.of<UserProvider>(context);
    Widget _headers() {
      return Container(
        margin: EdgeInsets.fromLTRB(margin30, margin30, margin30, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, Amril',
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    '@amrilrisman',
                    style: descriptionTextStyle.copyWith(
                        fontSize: 16, fontWeight: regular),
                  )
                ],
              ),
            ),
            Container(
              height: 54,
              width: 54,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/profile_default.png'))),
            )
          ],
        ),
      );
    }

    Widget _cusTabBar() {
      return SizedBox(
        height: 40,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: textTabBar.length,
            itemBuilder: (context, index) => InkWell(
                  splashColor: transparent,
                  onTap: () => setState(() {
                    currentIndex = index;
                    print(currentIndex);
                  }),
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    margin: index == 0
                        ? EdgeInsets.only(left: margin30, right: 16)
                        : index == (textTabBar.length - 1)
                            ? const EdgeInsets.only(right: 30)
                            : const EdgeInsets.only(right: 16),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    decoration: BoxDecoration(
                        color:
                            currentIndex == index ? primaryColor : transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: currentIndex != index
                            ? Border.all(
                                color: const Color(0XFF302F37),
                                width: 0.5,
                              )
                            : null),
                    child: Text(textTabBar[index],
                        style: descriptionTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: light,
                            color: currentIndex == index
                                ? primarTextColor
                                : const Color(0XFF504F5E))),
                  ),
                )),
      );
      // return DefaultTabController(
      //   length: textTabBar.length,
      //   initialIndex: currentIndex,
      //   child: SingleChildScrollView(
      //     child: TabBar(
      //       indicatorColor: Colors.transparent,
      //       onTap: (index) {
      //         setState(() {
      //           currentIndex = index;
      //         });
      //         print(currentIndex);
      //       },
      //       indicator: BoxDecoration(color: primaryColor),
      //       tabs: textTabBar
      //           .map((items) => Container(
      //                 padding: const EdgeInsets.symmetric(
      //                     vertical: 10, horizontal: 12),
      //                 decoration: BoxDecoration(
      //                   border: Border.all(
      //                     color: const Color(0XFF302F37),
      //                     width: 0.5,
      //                   ),
      //                 ),
      //                 child: Text('$items',
      //                     style: descriptionTextStyle.copyWith(
      //                         fontSize: 13,
      //                         fontWeight: light,
      //                         color: const Color(0XFF504F5E))),
      //               ))
      //           .toList(),
      //     ),
      //   ),
      // );
    }

    Widget _popularProduct() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: margin30),
            child: Text('Popular Product',
                style: primaryTextStyle.copyWith(
                    fontSize: 22, fontWeight: semiBold)),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 250,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == 0
                        ? EdgeInsets.only(left: margin30, right: margin30)
                        : index == 4
                            ? EdgeInsets.only(right: margin30)
                            : EdgeInsets.only(right: margin30),
                    child: _cardProduct(
                        onTap: () => Navigator.pushNamed(
                            context, DetailsProductPage.rootName)),
                  );
                }),
          )
        ],
      );
    }

    Widget _newArrivals() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: margin30),
            child: Text('New Arrivals',
                style: primaryTextStyle.copyWith(
                    fontSize: 22, fontWeight: semiBold)),
          ),
          const SizedBox(height: 14),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(top: 15, bottom: 15)
                        : index == 4
                            ? const EdgeInsets.only(bottom: 30, top: 15)
                            : const EdgeInsets.only(top: 15, bottom: 15),
                    child: _cardArrivals(
                        onTap: () => Navigator.pushNamed(
                            context, DetailsProductPage.rootName)),
                  ),
                );
              })
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor1,
          body: SingleChildScrollView(
            child: Column(
              children: [
                _headers(),
                const SizedBox(height: 30),
                _cusTabBar(),
                currentIndex == 0
                    ? const SizedBox(height: 30)
                    : const SizedBox(),
                currentIndex == 0 ? _popularProduct() : const SizedBox(),
                const SizedBox(height: 30),
                _newArrivals(),
              ],
            ),
          )),
    );
  }
}
