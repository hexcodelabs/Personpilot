import 'package:aiapp/firebase-functions/auth.dart';
import 'package:aiapp/firebase-functions/database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StateOfMind with ChangeNotifier {
  double _value = 3;
  IconData _ratingIcon = FontAwesomeIcons.smile;
  String _feel = "Okay";
  List<bool> _isReasonSelected = List.filled(16, false);
  List<bool> _isEmotionSelected = List.filled(50, false);
  List<String> _reasons = [
    "Appreciation/Recognition",
    "Colleagues",
    "Energy level",
    "Flexibility",
    "Personal development",
    "Job content",
    "Motivation",
    "Manager relationship",
    "Private life",
    "Health",
    "Work-life balance",
    "Company culture",
    "Company mission",
    "Company communications",
    "Company policies",
    "Work load"
  ];
  List<String> _emotions = [
    "Tired",
    "Content",
    "Humurous",
    "Satisfied",
    "Worried",
    "Exhausted",
    "Unhappy",
    "Disappointed",
    "Guilty",
    "Upbeat",
    "Frustrated",
    "Anxious",
    "Engaged",
    "Resentful",
    "Lonely",
    "Bored",
    "Insecure",
    "Secure",
    "Noticed",
    "Unnoticed",
    "Annoyed",
    "Stressed",
    "Demoralized",
    "Passionate",
    "Ecstatic",
    "Sad",
    "Depressed",
    "Self-conscious",
    "Panicked",
    "Afraid",
    "Angry",
    "Ashamed",
    "Jealous",
    "Disguted",
    "Embarrassed",
    "Appreciated",
    "Unappreciated",
    "Inspired",
    "Uninspired",
    "Happy",
    "Grateful",
    "Proud",
    "Eager",
    "Relieved",
    "Motivated",
    "Reassured",
    "Loved",
    "Calm",
    "Mindful",
    "Relaxed"

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
  set setReasonIsSelected(List<bool> values) {
    _isReasonSelected = values;
    notifyListeners();
  }
  set setEmotionIsSelected(List<bool> values) {
    _isEmotionSelected = values; // value[0] ==> position  value[1] ==> value
    notifyListeners();
  }
  Database database = new Database();
  FireBaseFunctions _auth = new FireBaseFunctions(); 

  Future<void> updateStateOfMindData() async {
    var userId = await _auth.getUserID();
    var userName = await _auth.fetchName();
    var userData = {
      "name": userName,
      "feel":_feel,
      "reasons":_isReasonSelected,
      "emotions": _isEmotionSelected,
      "lastCheckIn": DateTime.now()
    };
    await database.updateStateOfMind(userId, userData);
  }

  Future<void> getStateOfMindData() async {
    Database database = new Database();
    FireBaseFunctions _auth = new FireBaseFunctions();
    var userId = await _auth.getUserID();
    var data = await database.fetchStateOfMind(userId);
    if (data != null) {
      _feel  = data["feel"];
      if(_feel=="Terrible"){
        _ratingIcon = FontAwesomeIcons.angry;
      }
      else if(_feel=="Bad"){
        _ratingIcon = FontAwesomeIcons.meh;
      }
      else if(_feel=="Okay"){
        _ratingIcon = FontAwesomeIcons.smile;
      }
      else if(_feel=="Good"){
        _ratingIcon = FontAwesomeIcons.grinAlt;
      }
      else{
        _ratingIcon = FontAwesomeIcons.laughBeam;
      }
      for(int i=0;i<_isReasonSelected.length;i++){
        _isReasonSelected[i] = data["reasons"][i];
      }
      for(int i=0;i<_isEmotionSelected.length;i++){
        _isEmotionSelected[i] = data["emotions"][i];
      }
    }
    notifyListeners();
  }
  
  set setReasonsToDefault(int value){
    _isReasonSelected = List.filled(15, false);
    notifyListeners();
  }
  set setEmotionsToDefault(int value){
    _isEmotionSelected = List.filled(15, false);
    notifyListeners();
  }
  set setFeelToDefault(int value){
    _feel = "Okay";
    _value = 3;
    _ratingIcon = FontAwesomeIcons.smile;
    notifyListeners();
  }
}
