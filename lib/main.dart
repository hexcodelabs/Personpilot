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
        Provider<StateOfMind>(create: (_) => StateOfMind()),
      ],
      child: MaterialApp(
        title: 'AI App',
        debugShowCheckedModeBanner: false,
        home: RatingPage(),
      ),
    );
  }
}
