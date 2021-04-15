import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MeStateOfMind with ChangeNotifier {
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
    _isEmotionSelected = values;
    notifyListeners();
  }

  set setReasonsToDefault(int value) {
    _isReasonSelected = List.filled(15, false);
    notifyListeners();
  }

  set setEmotionsToDefault(int value) {
    _isEmotionSelected = List.filled(15, false);
    notifyListeners();
  }

  set setFeelToDefault(int value) {
    _feel = "Okay";
    _value = 3;
    _ratingIcon = FontAwesomeIcons.smile;
    notifyListeners();
  }
}

class MeReminders with ChangeNotifier {

//  List<Map<String,String>> _reminders = [
//    {
//      "name":"Drink fluids",
//      "intro":"Not getting enough fluids can cause headaches, loss of focus, loss of energy, crankiness,dull skin etc.",
//      "title":"WATER/FLUIDS!",
//      "background":"\nAn adequate daily fluid intake is: \n- About 15.5 cups (3.7 liters) of \nfluids a day for men.\n"
//          "- About 11.5 cups (2.7 liters) of \nfluids a day for women.",
//      "source":"The U.S National Academies of \nSciences, Engineering, and Medicine",
//      "q1":"Are you drinking enough fluids while \nat work?",
//      "q2":"Great! Would you like me to give \nyou reminders during your work day\n"
//          "to make sure you get enough fluids?",
//      "q3":"Okay, let me help you with that. I \ncan give you some reminders \nduring the cource of your workday \n"
//          "to help you remember to drink \nenough fluids."
//},
//    {
//      "name":"Breathe",
//      "intro":"Everyday functions of the body like digesting your food, moving your muscles or even just thinking, \nneed oxygen.",
//      "title":"Breathe!!",
//      "background":" ",
//      "source":"British Lung Foundation",
//      "q1":"Do you remember to pause and breathe deeply a couple a times during your work day?",
//      "q2":"Good to know! Would you like me to give you reminders during your work day to make sure \nyou continue to remember to pause once in a while and breathe \ndeeply?",
//      "q3":"Okay. I can help you to pause and take some deep breaths a couple of times a day. \nHow about that?",
//    }
//  ];
  List<Map<String,dynamic>> _reminders;


  List _activeReminders = [];
  DateTime _startTime = DateTime.parse("2021-01-01 09:00:00");
  DateTime _endTime = DateTime.parse("2021-01-01 22:00:00");
  int _noOfReminders = 5;
  Map _activeRemindersDetails = new Map();

  List get getReminders => _reminders;

  List get getActiveReminders => _activeReminders;
  DateTime get getStartTime => _startTime;
  DateTime get getEndTime => _endTime;
  int get getNoOfReminders => _noOfReminders;
  Map get getActiveRemindersDetails => _activeRemindersDetails;

  set setReminders(var data){
    _reminders = data;
    notifyListeners();
  }
  set setActiveReminders(int value) {
    _activeReminders.add(value);
    _activeReminders = _activeReminders.toSet().toList();
    notifyListeners();
  }

  set setStartTime(DateTime val) {
    _startTime = val;
    notifyListeners();
  }

  set setEndTime(DateTime val) {
    _endTime = val;
    notifyListeners();
  }

  set setNoOfReminders(int val) {
    _noOfReminders = val;
    notifyListeners();
  }

  set setRemindersToDefault(int val) {
    _activeReminders = [];
    notifyListeners();
  }

  set setTimesToDefault(int val) {
    _startTime = DateTime.parse("2021-01-01 09:00:00");
    _endTime = DateTime.parse("2021-01-01 22:00:00");
    _noOfReminders = 5;
    notifyListeners();
  }

  set setRemoveReminder(int index) {
    _activeReminders.removeWhere((element) => element == index);
    notifyListeners();
  }

  set removeReminderDetails(int index) {
    _activeRemindersDetails.removeWhere((key, value) => value == index);
    notifyListeners();
  }

  set setActiveRemindersDetails(var details) {
    //0 -> index   1 -> noOfReminders  2 -> startTime  3 -> endTime
    _activeRemindersDetails[details[0]] = [details[1], details[2], details[3]];
    print(_activeRemindersDetails);
    notifyListeners();
  }
}

class MeAdvices extends ChangeNotifier {
  List<List<String>> _advices = [
    [
      "Expert XYY",
      "Bunc id tincidunt duis faucibus urna\n adipiscing."
          "Id lorem diam egestas vel\n facilisis fames"
    ],
    ["David Meltzer", "Practice ending fear."]
  ];

  List<List<String>> get getAdvices => _advices;
}

class MeQuotes extends ChangeNotifier {
  List<List<String>> _quotes = [
    [
      "Do not be embarrased by your \nfailures, learn from them and start \nagain.",
      "Richard Branson",
      "https://www.jing.fm/clipimg/full/177-1776545_avatars-richard-branson-cartoon-png.png"
    ],
    [
      "Concentrate all your thoughts upon \nthe work in hand. The sun's rays do \nnot burn until brought to a focus.",
      "Alexander Graham Bell",
      "https://freepikpsd.com/wp-content/uploads/2019/10/alexander-graham-bell-clipart-6-Free-PNG-Images-Transparent.png"
    ]
  ];

  List<List<String>> get getQuotes => _quotes;
}
