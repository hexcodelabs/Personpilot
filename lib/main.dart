
import 'file:///C:/Other%20Activities/GitHub/AIapp/lib/introduction/welcome.dart';
import 'package:aiapp/Me/latestCheckIn.dart';
import 'package:aiapp/Me/overview.dart';
import 'package:aiapp/introduction/quote.dart';
import 'package:aiapp/providers/me.dart';
import 'package:aiapp/providers/registration.dart';
import 'package:aiapp/registration/regPageOne.dart';
import 'package:aiapp/registration/regPageThree.dart';
import 'package:aiapp/registration/regPageTwo.dart';
import 'package:aiapp/remindersFlow1/end.dart';
import 'package:aiapp/remindersFlow2/done.dart';
import 'package:aiapp/remindersFlow2/library.dart';
import 'package:aiapp/remindersFlow2/questionOne.dart';
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
        ChangeNotifierProvider(
          builder: (context) => Registration(),
        ),
        ChangeNotifierProvider(
          builder: (context) => Me(),
        ),
      ],
      child: MaterialApp(
        title: 'AI App',
        debugShowCheckedModeBanner: false,
        home: RatingPage(),
      ),
    );
  }
}
