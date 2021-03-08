import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme();
  static TextStyle headingText = const TextStyle(
      color: Color(0xFF03BFB5),
      fontSize: 20,
      fontWeight: FontWeight.bold,);

  static TextStyle msgText = const TextStyle(
    color: Colors.black87,
    fontSize: 20,
    fontWeight: FontWeight.normal,);

  static LinearGradient ratingGradient = LinearGradient(
    colors: [
      const Color(0xFF018076),
      const Color(0xFF03BFB5),
    ],
    begin: Alignment.bottomLeft,
    end:
    Alignment.topRight,);
  static TextStyle btnText1 = const TextStyle(
    color: Color(0xFF03BFB5),
    fontSize: 18,
    fontWeight: FontWeight.normal,);
  static TextStyle btnText2 = const TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.normal,);
  static TextStyle btnReasonTxt1 = const TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.normal,);
  static TextStyle btnReasonTxt2 = const TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.normal,);

}
