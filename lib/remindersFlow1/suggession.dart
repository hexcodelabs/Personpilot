import 'dart:ui';
import 'package:aiapp/providers/me.dart';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/registration.dart';
import 'package:aiapp/remindersFlow1/questionOne.dart';
import 'package:aiapp/Me/overview.dart';
import 'package:page_transition/page_transition.dart';

class SuggestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var registration = Provider.of<Registration>(context);
    var meReminders = Provider.of<MeReminders>(context);
    String name = registration.getName;

    int index = 0; // Hard coded index

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Hi $name!",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                meReminders.getReminders[index][1],
                style: AppTheme.msgText,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(style: AppTheme.msgText, children: [
                  new TextSpan(
                    text: meReminders.getReminders[index][2],
                  ),
                  new TextSpan(
                    text: meReminders.getReminders[index][3],
                  ),
                ]),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                meReminders.getReminders[index][4],
                style: AppTheme.msgTextItalic,
                textAlign: TextAlign.left,
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
                    Navigator.pop(context),
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: QuestionOne(index:index),
                      ),
                    )
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Color(0xFF03BFB5), width: 2)),
                  color: Color(0xFF03BFB5),
                  child: Text(
                    "Interesting",
                    style: AppTheme.btnText2,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,20,0,0),
              child: Center(
                child: GestureDetector(
                  onTap: ()=>{
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Overview()))
                  },
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0,10,0,10),
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
