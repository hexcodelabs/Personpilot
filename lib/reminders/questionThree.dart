import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/stateOfMind.dart';


class QuestionThree extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF5F9),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        centerTitle:true,
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
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Okay, let me help with you that. I",
                    style: AppTheme.msgText,
                  ),
                  Text(
                    "can give you some reminders",
                    style: AppTheme.msgText,
                  ),
                  Text(
                    "during the cource of your workday",
                    style: AppTheme.msgText,
                  ),
                  Text(
                    "to help you remember to drink",
                    style: AppTheme.msgText,
                  ),
                  Text(
                    "enough fluids.",
                    style: AppTheme.msgText,
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Wouldn't that be great?",
                    style: AppTheme.msgText,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      'assets/images/questionThree.png',
                      width: 50.0,
                      height: 50.0,
//                      fit: BoxFit.contain,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        minWidth: 150,
                        height: 50,
                        onPressed: () => {

                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side:
                            BorderSide(color: Color(0xFF03BFB5), width: 2)),
                        child: Text(
                          "Probably not",
                          style: AppTheme.btnText1,
                        ),
                      ),
                      MaterialButton(
                        minWidth: 150,
                        height: 50,
                        onPressed: () => {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side:
                            BorderSide(color: Color(0xFF03BFB5), width: 2)),
                        color: Color(0xFF03BFB5),
                        child: Text(
                          "Yes, awesome",
                          style: AppTheme.btnText2,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Center(
                      child: Container(
                        child: Column(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.user,
                              color: Colors.black,
                              size: 20.0,
                            ),
                            Text("Me")
                          ],
                        ),
                      ),
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