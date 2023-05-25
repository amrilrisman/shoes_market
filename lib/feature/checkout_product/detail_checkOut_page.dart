import 'package:flutter/material.dart';
import 'package:package/core/style/theme.dart';
import 'package:timelines/timelines.dart';

class DetailCheckOutPage extends StatelessWidget {
  static String rootName = '/detail-check-out';
  const DetailCheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context: context),
      backgroundColor: backgroundColor3,
      body: _body(),
      bottomNavigationBar: _bottmNavBar(context),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'List Items',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
                color: backgroundCard,
              ),
            ),
            _previewItems(),
            _addressDetails(),
            _paymentSummary(),
          ],
        ),
      ),
    );
  }

  _bottmNavBar(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0XFF2B2938),
          ),
        ),
      ),
      child: FlatButton(
        height: 50,
        minWidth: double.infinity,
        color: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Text(
          'Checkout Now',
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        onPressed: () => Navigator.pushNamed(context, '/checkout-success'),
      ),
    );
  }

  _addressDetails() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: backgroundColor4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Address Details',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 150,
            child: Timeline.tileBuilder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0),
              theme: TimelineThemeData(
                nodePosition: 0,
                connectorTheme: const ConnectorThemeData(
                  thickness: 3.0,
                  color: Color(0xffd3d3d3),
                ),
                indicatorTheme: const IndicatorThemeData(
                  size: 10.0,
                ),
              ),
              builder: TimelineTileBuilder.connected(
                  contentsBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // index 0 = store location
                            // index 1 = detination location
                            Text(
                              index == 0 ? 'Store Location' : 'Your Address',
                              style: primaryTextStyle.copyWith(
                                  color: Color(0XFF999999),
                                  fontWeight: light,
                                  fontSize: 12),
                            ),
                            Text(
                              index == 0 ? 'Adidas Core' : 'Marsemmon',
                              style: primaryTextStyle.copyWith(
                                  color: backgroundCard,
                                  fontWeight: medium,
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                  connectorBuilder: (_, index, __) => const DashedLineConnector(
                        color: Colors.white,
                        thickness: 1,
                      ),
                  indicatorBuilder: (_, index) {
                    if (index <= 0) {
                      return Image.asset(
                        'assets/Restaurant Icon.png',
                        height: 40,
                        width: 40,
                      );
                    } else {
                      return Image.asset(
                        'assets/Location Icon.png',
                        height: 40,
                        width: 40,
                      );
                    }
                  },
                  itemExtentBuilder: (_, __) => 70,
                  itemCount: 2),
            ),
          ),
        ],
      ),
    );
  }

  _paymentSummary() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: backgroundColor4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          _customTextTile(
            leading: Text(
              'Product Quantity',
              style: priceTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                  color: const Color(0XFF999999)),
            ),
            trailing: Text(
              '2 Items',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          _customTextTile(
            leading: Text(
              'Product Price',
              style: priceTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                  color: const Color(0XFF999999)),
            ),
            trailing: Text(
              '\$575,96',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          _customTextTile(
            leading: Text(
              'Shipping',
              style: priceTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                  color: const Color(0XFF999999)),
            ),
            trailing: Text(
              'Free',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            color: Color(0XFF2E3141),
            thickness: 1,
          ),
          const SizedBox(
            height: 8,
          ),
          _customTextTile(
            leading: Text(
              'Total',
              style: priceTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
            trailing: Text(
              '\$575,96',
              style: priceTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _customTextTile({required Widget leading, required Widget trailing}) {
    return Row(
      children: [
        Expanded(child: leading),
        const SizedBox(
          width: 10,
        ),
        trailing
      ],
    );
  }

  _previewItems() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: backgroundColor4),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/item_shoes.png',
                      height: 60,
                      width: 60,
                      fit: BoxFit.fill,
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
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          '\$143,98',
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
                  Text(
                    '2 Items',
                    style: priceTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                      color: const Color(0XFF999999),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  _appBar({required BuildContext context}) {
    return PreferredSize(
      // ignore: sort_child_properties_last
      child: AppBar(
        backgroundColor: backgroundColor1,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Checkout Details',
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
}
