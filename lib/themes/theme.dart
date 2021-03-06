import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme();
  static TextStyle headingText = const TextStyle(
      fontFamily:'OpenSans',
      color: Color(0xFF03BFB5),
      fontSize: 20,
      fontWeight: FontWeight.bold,);
  static TextStyle headingTextWhite = const TextStyle(
    fontFamily:'OpenSans',
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,);

  static TextStyle msgText = const TextStyle(
    fontFamily:'OpenSans',
    color: Colors.black87,
    fontSize: 20,
    fontWeight: FontWeight.w400,);
  static TextStyle msgTextItalic = const TextStyle(
    fontFamily:'OpenSans',
    color: Colors.black87,
    fontSize: 20,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w400,);

  static LinearGradient ratingGradient = LinearGradient(
    colors: [
      const Color(0xFF018076),
      const Color(0xFF03BFB5),
    ],
    begin: Alignment.bottomLeft,
    end:
    Alignment.topRight,);
  static TextStyle btnText1 = const TextStyle(
    fontFamily:'OpenSans',
    color: Color(0xFF03BFB5),
    fontSize: 18,
    fontWeight: FontWeight.normal,);
  static TextStyle btnText2 = const TextStyle(
    fontFamily:'OpenSans',
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.normal,);
  static TextStyle btnReasonTxt1 = const TextStyle(
    fontFamily:'OpenSans',
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.normal,);
  static TextStyle btnReasonTxt2 = const TextStyle(
    fontFamily:'OpenSans',
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.normal,);
  static TextStyle boldText = const TextStyle(
    fontFamily:'OpenSans',
    color: Colors.black87,
    fontSize: 20,
    fontWeight: FontWeight.bold,);
  static TextStyle reminderText = const TextStyle(
    fontFamily:'OpenSans',
    color: Colors.black87,
    fontSize: 17,
    fontWeight: FontWeight.normal,);
  static TextStyle reminderItalicText = const TextStyle(
    fontFamily:'OpenSans',
    fontStyle: FontStyle.italic,
    color: Colors.black87,
    fontSize: 17,
    fontWeight: FontWeight.normal,);
  static TextStyle reminderTextTitle = const TextStyle(
    fontFamily:'OpenSans',
    color: Colors.black87,
    fontSize: 20,
    fontWeight: FontWeight.bold,);

}
