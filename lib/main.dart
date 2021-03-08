
import 'package:aiapp/reminders/end.dart';
import 'package:aiapp/reminders/questionOne.dart';
import 'package:aiapp/reminders/questionThree.dart';
import 'package:aiapp/reminders/questionTwo.dart';
import 'package:aiapp/reminders/reminderDone.dart';
import 'package:aiapp/reminders/suggession.dart';
import 'package:aiapp/stateOfMind/done.dart';
import 'package:aiapp/stateOfMind/emotions.dart';

import 'package:flutter/material.dart';
import 'package:aiapp/stateOfMind/rating.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/stateOfMind.dart';

void main() {
  Provider.debugCheckInvalidValueType=null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => StateOfMind(),
        ),
      ],
      child: MaterialApp(
        title: 'AI App',
        debugShowCheckedModeBanner: false,
        home: EndPage(),
      ),
    );
  }
}
