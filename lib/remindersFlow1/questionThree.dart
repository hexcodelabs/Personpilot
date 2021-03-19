import 'dart:ui';
import 'package:aiapp/Me/overview.dart';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/me.dart';
import 'package:page_transition/page_transition.dart';
import 'package:aiapp/remindersFlow1/set.dart';


class QuestionThree extends StatelessWidget {
  final index;
  QuestionThree({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var meReminders = Provider.of<MeReminders>(context);
    return Scaffold(
      backgroundColor: Color(0xFFEFF5F9),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personpilot",
                      style: AppTheme.headingText,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                meReminders.getReminders[index][7],
                style: AppTheme.msgText,
                textAlign: TextAlign.center,
              ),
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
              aspectRatio: 16 / 7,
              child: Image.asset(
                'assets/images/water.gif',
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
                        child: ReminderFlowOneSet(index:index),
                      ),
                    )
                  },
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
