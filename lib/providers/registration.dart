import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Registration with ChangeNotifier {
  String _email;
  String _pass;
  String _name;

  String get getEmail => _email;
  String get getPass => _pass;
  String get getName => _name;

  set setEmail(String value) {
    _email = value;
    notifyListeners();
  }
  set setPass(String value) {
    _pass = value;
    notifyListeners();
  }
  set setName(String value) {
    _name = value;
    notifyListeners();
  }
}
