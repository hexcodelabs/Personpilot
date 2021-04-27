import 'dart:async';

import 'package:aiapp/firebase-functions/database.dart';
import 'package:aiapp/introduction/quote.dart';
import 'package:aiapp/providers/me.dart';
import 'package:aiapp/providers/registration.dart';
import 'package:aiapp/registration/regPageOne.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/stateOfMind.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:aiapp/firebase-functions/auth.dart';
import 'package:aiapp/introduction/welcome.dart';
import 'package:flutter/material.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FireBaseFunctions fbFunctions = new FireBaseFunctions();
  Provider.debugCheckInvalidValueType = null;
  await fbFunctions.isSignedIn().then((value) => {runApp(MyApp(value))});
}

class MyApp extends StatefulWidget {
  final int isSignedIn;
  MyApp(this.isSignedIn);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    listenToNotifications();
  }

  Future listenToNotifications() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

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
        home: widget.isSignedIn == 2 ? IntroductionQuotePage() : RegPageOne(),
      ),
    );
  }
}
