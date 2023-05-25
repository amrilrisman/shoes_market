// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:package/core/style/theme.dart';

class CardPreviewItem extends StatelessWidget {
  const CardPreviewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SizedBox()),
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(right: 30, bottom: 12, top: 30),
          decoration: const BoxDecoration(
            color: Color(0XFF2B2844),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/item_shoes.png',
                      width: 70,
                      height: 70,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          'COURT VISION 2.0 SHOES ',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: descriptionTextStyle.copyWith(
                            color: backgroundCard,
                            fontSize: 14,
                            fontWeight: regular,
                          ),
                        ),
                      ),
                      Text(
                        '\$ 57,15',
                        overflow: TextOverflow.ellipsis,
                        style: priceTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  FlatButton(
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: primaryColor, width: 1),
                    ),
                    child: Text(
                      'Add to Cart',
                      style: primaryTextStyle.copyWith(
                        color: primaryColor,
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  FlatButton(
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: primaryColor,
                    child: Text(
                      'Buy Now',
                      style: primaryTextStyle.copyWith(
                        color: const Color(0XFF2B2844),
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
