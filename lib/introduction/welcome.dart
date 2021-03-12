import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/stateOfMind.dart';

class IntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String text =
        "Let me introduce myself \nproperly. I am Personpilot - your\n new personal co-pilot."
        "\n    \n"
        "I will help you navigate and \n thrive at work, and i am very \nexited to offer my support."
        "\n    \n"
        "Remember, you're the pilot of \n your professional life, and I'm\n your devoted co-pilot.";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF5F9),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Personpilot",
          style: AppTheme.headingText,
        ),
      ),
      backgroundColor: Color(0xFFEFF5F9),
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
                      color: Color(0xFF03BFB5),
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
                    height: 50,
                  ),
                  Text(
                    "Welcome Malthe!",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    text,
                    style: AppTheme.msgText,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        minWidth: 200,
                        height: 50,
                        onPressed: () => {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side:
                                BorderSide(color: Color(0xFF03BFB5), width: 2)),
                        color: Color(0xFF03BFB5),
                        child: Column(
                          children: [
                            Text(
                              "Nice to meet you,",
                              style: AppTheme.btnText2,
                            ),
                            Text(
                              "Personpilot",
                              style: AppTheme.btnText2,
                            ),
                          ],
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
    );
  }
}
