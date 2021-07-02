import 'dart:io';
import 'dart:ui';
import 'package:aiapp/firebase-functions/auth.dart';
import 'package:aiapp/firebase-functions/database.dart';
import 'package:aiapp/providers/me.dart';
import 'package:aiapp/providers/stateOfMind.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:aiapp/stateOfMind/rating.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/registration.dart';

class IntroductionQuotePage extends StatefulWidget {
  @override
  _IntroductionQuotePageState createState() => _IntroductionQuotePageState();
}

class _IntroductionQuotePageState extends State<IntroductionQuotePage> {
  String name;
  FireBaseFunctions fbFunctions = new FireBaseFunctions();
  bool isLoading = false;

  @override
  void initState() {
    
    fetchData(context);

    //fetching all data
    var stateOfMind = Provider.of<StateOfMind>(context, listen: false);
    stateOfMind.getStateOfMindData();

    var meQuote = Provider.of<MeQuotes>(context, listen: false);
    meQuote.fetchQuotes();

    var meStateOfMind = Provider.of<MeStateOfMind>(context, listen: false);
    meStateOfMind.getStateOfMindData();

    var meReminders = Provider.of<MeReminders>(context, listen: false);
    meReminders.fetchReminders();
    
    //for notifications
    requestPermissionNotifications();
    saveDeviceID();

    super.initState();
  }
  
  Future requestPermissionNotifications() async{
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    if (Platform.isIOS) {
      NotificationSettings settings = await _fcm.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: true,
        provisional: true,
        sound: true,
      );
      print('User granted permission: ${settings.authorizationStatus}');
    }
  }
  Future saveDeviceID() async{
      Database database = new Database();
      var isSavedDeviceID = await database.saveDeviceToken();
      if(isSavedDeviceID){
        print("Succesfully saved device id");
      }
      else{
        print("Error saving device id");
      }
    }

  void fetchData(context) async {
    var registration = Provider.of<Registration>(context, listen: false);
    var me = Provider.of<MeReminders>(context, listen: false);
    setState(() {
      isLoading = true;
    });
    print("Starting fetching reminder data");
    name = await fbFunctions.fetchName();
    me.setReminders = await fbFunctions.fetchReminders();
    await fbFunctions.fetchReminders();
    print("done");
    registration.setName = name;

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    String text =
        "When people go to work, they \n shouldn't have to leave their \n hearts at home.";
    String author = "Betty Bender";
    return isLoading
        ? Center(
            child: Container(
              color: Color(0xFF03BFB5),
              child: Center(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    'assets/images/loading.gif',
                  ),
                ),
              ),
            ),
          )
        : Container(
      decoration: BoxDecoration(
        gradient: AppTheme.ratingGradient,
      ),
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(
                  color: Colors.black, //change your color here
                ),
                elevation: 0,
                centerTitle: true,
                title: Text(
                  "Personpilot",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                                child: Text(
                              "Pilot icon",
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.center,
                            )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          AspectRatio(
                            aspectRatio: 19 / 5,
                            child: SvgPicture.asset(
                              'assets/images/quotation.svg',
                              color: Colors.white.withOpacity(0.6),
//                      fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            text,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            author,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MaterialButton(
                                minWidth: 200,
                                height: 50,
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: RatingPage(),
                                      ),
                                      (route) => false);
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                        color: Colors.white, width: 2)),
                                color: Colors.white,
                                child: Text(
                                  "Continue",
                                  style: AppTheme.btnText1,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        );
  }
}
