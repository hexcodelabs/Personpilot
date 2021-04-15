import 'package:aiapp/introduction/quote.dart';
import 'package:aiapp/providers/me.dart';
import 'package:aiapp/providers/registration.dart';
import 'package:aiapp/registration/regPageOne.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/stateOfMind.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:aiapp/firebase-functions/auth.dart';
import 'package:aiapp/introduction/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FireBaseFunctions fbFunctions = new FireBaseFunctions();
  Provider.debugCheckInvalidValueType = null;
  await fbFunctions.isSignedIn().then((value) => {runApp(MyApp(value))});
}

class MyApp extends StatelessWidget {
  final int isSignedIn;
  MyApp(this.isSignedIn);
  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StateOfMind(),
        ),
        ChangeNotifierProvider(
          create: (context) => Registration(),
        ),
        ChangeNotifierProvider(
          create: (context) => MeStateOfMind(),
        ),
        ChangeNotifierProvider(
          create: (context) => MeReminders(),
        ),
        ChangeNotifierProvider(
          create: (context) => MeAdvices(),
        ),
        ChangeNotifierProvider(
          create: (context) => MeQuotes(),
        ),
      ],
      child: MaterialApp(
        title: 'AI App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'OpenSans'),
        home: isSignedIn == 2
            ? IntroductionQuotePage()
            : RegPageOne(),
      ),
    );
  }
}
