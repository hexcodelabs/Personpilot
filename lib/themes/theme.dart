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
}
