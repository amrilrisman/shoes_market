import 'package:package/theme/theme.dart';
import 'package:flutter/material.dart';

Widget formInput(
    {String? titleForm,
    String? hintText,
    String? iconLeading,
    TextEditingController? controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        titleForm!,
        style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
      ),
      const SizedBox(height: 12),
      Container(
        height: 50,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
            color: backgroundColor2, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Image.asset(
              iconLeading!,
              width: 17,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: controller,
                style: TextStyle(color: primarTextColor),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 6),
                    hintText: '$hintText',
                    hintStyle: descriptionTextStyle,
                    border: InputBorder.none),
              ),
            )
          ],
        ),
      )
    ],
  );
}

Widget buttonPrimary({required Function() onTap, required String textButton}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 50,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        textButton,
        style: primaryTextStyle.copyWith(fontSize: 16),
      ),
    ),
  );
}
