import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StateOfMind with ChangeNotifier {
  double _value = 3;
  IconData _ratingIcon = FontAwesomeIcons.smile;
  String _feel = "Good";

  double get getRatingValue => _value;
  IconData get getRatingIcon => _ratingIcon;
  String get getFeel => _feel;

  set setRatingValue(double value) {
    _value = value;
    notifyListeners();
  }
  set setRatingIcon(IconData icon) {
    _ratingIcon = icon;
    notifyListeners();
  }
  set setFeel(String feel) {
    _feel = feel;
    notifyListeners();
  }
}
