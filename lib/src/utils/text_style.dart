import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';


MaterialColor blackSwatch = const MaterialColor(
  0xFF000000, // The primary value
  <int, Color>{
    50: Colors.black, // You can define shades as needed
    100: Colors.black,
    200: Colors.black,
    300: Colors.black,
    400: Colors.black,
    500: Colors.black, // This is the primary color
    600: Colors.black,
    700: Colors.black,
    800: Colors.black,
    900: Colors.black,
  },
);
class HawaiiStyles {
  static Color primaryColor = blackSwatch;
  static Color textColor =  Colors.black;
  static Color buttonColor = Colors.black;
  static Color navBar = Colors.white;
  static Color textFormField = Colors.grey.shade50;
  static Color iconBg = Colors.grey.shade100;





  static TextStyle navBarTxt =
      GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black);
  static TextStyle logintxt =
  TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500);
  static TextStyle headLineStyle1 =
  TextStyle(fontSize: 25, color: textColor, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle2 =
  TextStyle(fontSize: 20, color: textColor, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle3 = TextStyle(
      fontSize: 16, color: Colors.grey.shade600, fontWeight: FontWeight.w500);
  static TextStyle headLineStyle4 = TextStyle(
      fontSize: 14, color: Colors.grey.shade500, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle5 = const TextStyle(
      fontSize: 15, color: Colors.white70, fontWeight: FontWeight.w600);
  static TextStyle headLineStyle6 = const TextStyle(
      fontSize: 15, color: Colors.white54, fontWeight: FontWeight.w400);
  static TextStyle headLineStyle7 = TextStyle(
      fontSize: 15, color: Colors.orange.shade900, fontWeight: FontWeight.w400);
  static TextStyle headLineStyle8 = const TextStyle(
      fontSize: 15, color: Colors.white70, fontWeight: FontWeight.w400);
  static TextStyle headLineStyle10 = TextStyle(
      fontSize: 14, color: Colors.grey.shade500, fontWeight: FontWeight.w500);
}
