import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// color
Color primaryColor = const Color(0xFF6C5ECF);
Color secondaryColor = const Color(0xFF38ABBE);
Color alertColor = const Color(0xFFED6363);
Color priceColor = const Color(0xFF2C96F1);
Color backgroundColor1 = const Color(0xFF1F1D2B);
Color backgroundColor2 = const Color(0xFF2B2937);
Color backgroundColor3 = const Color(0xFF242231);
Color backgroundColor4 = const Color(0xFF252836);
Color backgroundCard = const Color(0xFFF1F0F2);
Color primarTextColor = const Color(0xFFE1E1E1);
Color secondaryTextColor = const Color(0xFF999999);
Color descriptionTextColor = const Color(0xFF504F5E);
Color transparent = Colors.transparent;

ColorScheme schemeColor = ColorScheme.fromSwatch().copyWith(
  primary: primaryColor,
  secondary: secondaryColor,
  background: backgroundColor1,
);

// text style
TextStyle primaryTextStyle = GoogleFonts.poppins(color: primarTextColor);
TextStyle secondaryTextStyle = GoogleFonts.poppins(color: secondaryTextColor);
TextStyle priceTextStyle = GoogleFonts.poppins(color: priceColor);
TextStyle descriptionTextStyle =
    GoogleFonts.poppins(color: descriptionTextColor);

// margin
double margin30 = 30;

// font weight
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
