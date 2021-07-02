import 'dart:async';

import 'package:aiapp/Me/reminders.dart';
import 'package:aiapp/firebase-functions/database.dart';
import 'package:aiapp/introduction/quote.dart';
import 'package:aiapp/providers/me.dart';
import 'package:aiapp/providers/registration.dart';
import 'package:aiapp/registration/regPageOne.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:page_transition/page_transition.dart';
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

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);

/// Initialize the [FlutterLocalNotificationsPlugin] package.
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
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
    if (widget.isSignedIn == 2) {
      listenToNotifications();
    }
  }

  Future listenToNotifications() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      RemoteNotification notification = message.notification;
      if (notification != null) {
        print('Title: ${notification.title}');
        print('Body: ${notification.body}');
        // flutterLocalNotificationsPlugin.show(
        //     notification.hashCode,
        //     notification.title,
        //     notification.body,
        //     NotificationDetails(
        //       android: AndroidNotificationDetails(
        //         channel.id,
        //         channel.name,
        //         channel.description,
        //         icon: 'launch_background',
        //       ),
        //     ));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      Timer.run(() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MeRemindersPage()));
      });
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
