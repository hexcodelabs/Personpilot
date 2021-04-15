import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/me.dart';
import 'package:page_transition/page_transition.dart';
import 'package:aiapp/Me/emosions.dart';
import 'package:aiapp/providers/registration.dart';

class MeReasonsPage extends StatefulWidget {
  @override
  _MeReasonsPageState createState() => _MeReasonsPageState();
}

class _MeReasonsPageState extends State<MeReasonsPage> {
  List<bool> isReasonSelected;

  @override
  void initState() {
    var me = Provider.of<MeStateOfMind>(context, listen: false);
    setState(() {
      isReasonSelected = List.from(me.getReasonsIsSelected);
    });
    super.initState();
  }

  Widget button(String text, int key, context) {
    return FlatButton(
      minWidth: 100,
      height: 50,
      onPressed: () => {
        if (isReasonSelected
                .where((element) => element == true)
                .toList()
                .length <
            5)
          {
            setState((){
              isReasonSelected[key] = !isReasonSelected[key];
            })
            }
        else
          {
            if (isReasonSelected[key] == true)
              {
                setState((){
                  isReasonSelected[key] = !isReasonSelected[key];
                })
              }
          }
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Color(0xFF03BFB5), width: 2)),
      color: isReasonSelected[key] ? Color(0xFF03BFB5) : Colors.white,
      child: Text(
        text,
        style: isReasonSelected[key]
            ? AppTheme.btnReasonTxt1
            : AppTheme.btnReasonTxt2,
      ),
    );
  }

  Widget buttonRow(List<String> reasons, int index,context) {
    return (Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          button(reasons[index], index, context),
          button(reasons[index + 1], index + 1,context),
//          button(reasons[index + 2], index + 2,context)
        ],
      ),
    ));
  }

  Widget reasonButtons(List<String> reasons, BuildContext context) {
    return (ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: (reasons.length ~/ 2).toInt(),
        itemBuilder: (BuildContext context, int index) {
          return buttonRow(reasons, index * 2,context);
        }));
  }

  @override
  Widget build(BuildContext context) {
    var me = Provider.of<MeStateOfMind>(context);
    var registration = Provider.of<Registration>(context);
    String name = registration.getName;
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => {Navigator.pop(context)},
                      child: FaIcon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.black,
                        size: 25.0,
                      ),
                    ),
                    Text(
                      "$name (Me)",
                      style: AppTheme.headingText,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFF03BFB5), width: 2),
                              borderRadius:
                              BorderRadius.all(Radius.circular(50))),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.user,
                              color: Color(0xFF03BFB5),
                            ),
                          ),
                        ),
                        FaIcon(
                          FontAwesomeIcons.ellipsisH,
                          color: Colors.black,
                          size: 25.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
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
            Container(
                height: MediaQuery.of(context).size.height * 0.55,
                child: reasonButtons(me.getReasons, context)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  minWidth: 150,
                  height: 50,
                  onPressed: () => {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: MeEmotionsPage(),
                      ),
                    )
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Color(0xFF03BFB5), width: 2)),
                  child: Text(
                    "Skip",
                    style: AppTheme.btnText1,
                  ),
                ),
                MaterialButton(
                  minWidth: 150,
                  height: 50,
                  onPressed: () => {
                    me.setReasonIsSelected = isReasonSelected,
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: MeEmotionsPage(),
                      ),
                    )
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Color(0xFF03BFB5), width: 2)),
                  color: Color(0xFF03BFB5),
                  child: Text(
                    "Continue",
                    style: AppTheme.btnText2,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Column(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.square,
                            color: Colors.black,
                            size: 20.0,
                          ),
                          Text("Co-pilot")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Column(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.user,
                            color: Color(0xFF03BFB5),
                            size: 20.0,
                          ),
                          Text(
                            "Me",
                            style: TextStyle(color: Color(0xFF03BFB5)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
