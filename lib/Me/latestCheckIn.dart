import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/stateOfMind.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:page_transition/page_transition.dart';
import 'package:aiapp/Me/checkIn.dart';

class LatestCheckIn extends StatelessWidget {
  String date = "01";
  String month = "01";
  String year = "2021";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF5F9), //Color(0xFFEFF5F9)
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Malthe (Me)",
          style: AppTheme.headingText,
        ),
        actions: [
          // action button
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFF03BFB5),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                      child: Text(
                    "Me",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Color(0xFFEFF5F9),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: CheckIn(),
                        ),
                      )
                    },
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: [8, 4],
                      strokeWidth: 2,
                      color: Color(0xFF03BFB5),
                      radius: Radius.circular(12),
                      child: Container(
                        height: 90,
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: Column(
                            children: [
                              Text(
                                "Tap here to",
                                style: TextStyle(
                                  color: Color(0xFF03BFB5),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                "MAKE A NEW MOOD CHECK IN",
                                style: TextStyle(
                                  color: Color(0xFF03BFB5),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Your latest mood check-in:",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$date/$month/$year",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
