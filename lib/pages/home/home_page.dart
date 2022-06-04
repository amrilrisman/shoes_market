import 'package:flutter/material.dart';
import 'package:package/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          height: 280,
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _cardProduct();
              }),
        )
      ],
    );
  }

  Widget _cardProduct() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 278,
      width: 215,
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
            fit: BoxFit.fitWidth,
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
              return _cardArrivals();
            })
      ],
    );
  }

  Widget _cardArrivals() {
    return Container(
      height: 120,
      padding: EdgeInsets.symmetric(horizontal: margin30),
      margin: EdgeInsets.only(bottom: margin30),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor1,
          body: SingleChildScrollView(
            child: Column(
              children: [
                _headers(),
                const SizedBox(height: 30),
                Container(
                  height: 40,
                  width: double.infinity,
                  color: secondaryColor,
                ),
                const SizedBox(height: 30),
                _popularProduct(),
                const SizedBox(height: 30),
                _newArrivals(),
              ],
            ),
          )),
    );
  }
}
