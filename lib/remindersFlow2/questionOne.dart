import 'dart:ui';
import 'package:aiapp/Me/overview.dart';
import 'package:aiapp/remindersFlow2/library.dart';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/registration.dart';
import 'package:page_transition/page_transition.dart';

class QuestionOne extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var registration = Provider.of<Registration>(context);
    String name = registration.getName;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text("Good morning $name!",style: AppTheme.msgText),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Text(
                'I hope you are well. I can offer you a range of reminders that will'
                    ' enrich your work day.',
                  style: AppTheme.msgText,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Text(
                'Would you like to see a couple of examples?',
                style: AppTheme.msgText,
                textAlign: TextAlign.center,
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
                    "Maybe later",
                    style: AppTheme.btnText1,
                  ),
                ),
                MaterialButton(
                  minWidth: 150,
                  height: 50,
                  onPressed: () => {
                    Navigator.pop(context),
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: ReminderLibrary(),
                      ),
                    )
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side:
                      BorderSide(color: Color(0xFF03BFB5), width: 2)),
                  color: Color(0xFF03BFB5),
                  child: Text(
                    "Yes, please",
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
