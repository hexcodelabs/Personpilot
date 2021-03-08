import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StateOfMind with ChangeNotifier {
  double _value = 3;
  IconData _ratingIcon = FontAwesomeIcons.smile;
  String _feel = "Good";
  List<bool> _isReasonSelected = List.filled(15, false);
  List<bool> _isEmotionSelected = List.filled(15, false);
  List<String> _reasons = [
    "Reason",
    "Reason",
    "Reason",
    "Reason",
    "Reason",
    "Reason",
    "Reason",
    "Reason",
    "Reason",
    "Reason",
    "Reason",
    "Reason",
    "Reason",
    "Reason",
    "Reason"
  ];
  List<String> _emotions = [
    "Emotion",
    "Emotion",
    "Emotion",
    "Emotion",
    "Emotion",
    "Emotion",
    "Emotion",
    "Emotion",
    "Emotion",
    "Emotion",
    "Emotion",
    "Emotion",
    "Emotion",
    "Emotion",
    "Emotion"
  ];


  double get getRatingValue => _value;
  IconData get getRatingIcon => _ratingIcon;
  String get getFeel => _feel;
  List<String> get getReasons => _reasons;
  List<String> get getEmotions => _emotions;
  List<bool> get getReasonsIsSelected => _isReasonSelected;
  List<bool> get getEmotionsIsSelected => _isEmotionSelected;

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
  set setReasonIsSelected(List<dynamic> values) {
    print(values);
    _isReasonSelected[values[0]] = values[1]; // value[0] ==> position  value[1] ==> value
    notifyListeners();
  }
  set setEmotionIsSelected(List<dynamic> values) {
    print(values);
    _isEmotionSelected[values[0]] = values[1]; // value[0] ==> position  value[1] ==> value
    notifyListeners();
  }
}
