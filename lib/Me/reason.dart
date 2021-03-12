import 'dart:ui';
import 'package:aiapp/stateOfMind/emotions.dart';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/me.dart';


class MeReasonsPage extends StatefulWidget {
  @override
  _MeReasonsPageState createState() => _MeReasonsPageState();
}

class _MeReasonsPageState extends State<MeReasonsPage> {


  Widget button(String text, int key, BuildContext context) {
    Me me = Provider.of<Me>(context);
    return FlatButton(
      minWidth: 100,
      height: 50,
      onPressed: () => {
        me.setReasonIsSelected = [
          key,
          !me.getReasonsIsSelected[key]
        ]
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Color(0xFF03BFB5), width: 2)),
      color: me.getReasonsIsSelected[key]
          ? Color(0xFF03BFB5)
          : Colors.white,
      child: Text(
        text,
        style: me.getReasonsIsSelected[key]
            ? AppTheme.btnReasonTxt1
            : AppTheme.btnReasonTxt2,
      ),
    );
  }

  Widget reasonButtons(List<String> reasons, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button(reasons[0], 0, context),
              button(reasons[1], 1, context),
              button(reasons[2], 2, context)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button(reasons[3], 3, context),
              button(reasons[4], 4, context),
              button(reasons[5], 5, context)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button(reasons[6], 6, context),
              button(reasons[7], 7, context),
              button(reasons[8], 8, context)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button(reasons[9], 9, context),
              button(reasons[10], 10, context),
              button(reasons[11], 11, context)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button(reasons[12], 12, context),
              button(reasons[13], 13, context),
              button(reasons[14], 14, context)
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Me me = Provider.of<Me>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        backgroundColor: Color(0xFFEFF5F9),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
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
                    "What is making you feel good?",
                    style: AppTheme.msgText,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Choose upto five reasons.",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  reasonButtons(me.getReasons, context),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        minWidth: 150,
                        height: 50,
                        onPressed: () => {
                          me.setReasonsToDefault = 0
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side:
                            BorderSide(color: Color(0xFF03BFB5), width: 2)),
                        child: Text(
                          "Skip",
                          style: AppTheme.btnText1,
                        ),
                      ),
                      MaterialButton(
                        minWidth: 150,
                        height: 50,
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EmotionsPage()))
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side:
                            BorderSide(color: Color(0xFF03BFB5), width: 2)),
                        color: Color(0xFF03BFB5),
                        child: Text(
                          "Continue",
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
