import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/me.dart';
import 'package:aiapp/providers/registration.dart';
import 'package:aiapp/Me/somDone.dart';
import 'package:page_transition/page_transition.dart';

class MeEmotionsPage extends StatefulWidget {

  @override
  _MeEmotionsPageState createState() => _MeEmotionsPageState();
}

class _MeEmotionsPageState extends State<MeEmotionsPage> {
  List<bool> isEmotionSelected;

  @override
  void initState() {
    var me = Provider.of<MeStateOfMind>(context, listen: false);
    setState(() {
      isEmotionSelected = List.from(me.getEmotionsIsSelected);
    });

    super.initState();
  }

  Widget button(String text, int key, BuildContext context) {
    return FlatButton(
      minWidth: 100,
      height: 50,
      onPressed: () => {
        if (isEmotionSelected
                .where((element) => element == true)
                .toList()
                .length <
            5)
          {
            setState((){
              isEmotionSelected[key]= !isEmotionSelected[key];
            })

          }
        else
          {
            if (isEmotionSelected[key] == true)
              {
                setState((){
                  isEmotionSelected[key]= !isEmotionSelected[key];
                })
              }
          }
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Color(0xFFFFC10D), width: 2)),
      color: isEmotionSelected[key] ? Color(0xFFFFC10D) : Colors.white,
      child: Text(
        text,
        style: isEmotionSelected[key]
            ? AppTheme.btnReasonTxt1
            : AppTheme.btnReasonTxt2,
      ),
    );
  }

  Widget buttonRow(List<String> emotions, BuildContext context, int index) {
    return (Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          button(emotions[index], index, context),
          button(emotions[index + 1], index + 1, context),
          button(emotions[index + 2], index + 2, context)
        ],
      ),
    ));
  }

  Widget emotionButtons(List<String> emotions, BuildContext context) {
    return (ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: (emotions.length ~/ 3).toInt(),
        itemBuilder: (BuildContext context, int index) {
          return buttonRow(emotions, context, index * 3);
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
              "What emotions resonate with you",
              style: AppTheme.msgText,
            ),
            Text(
              "right now?",
              style: AppTheme.msgText,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Choose upto five emotions.",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.42,
                child: emotionButtons(me.getEmotions, context)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  minWidth: 150,
                  height: 50,
                  onPressed: () => {
                    for (var i = 0; i < 3; i++) {Navigator.pop(context)},
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: MeSomDonePage(),
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
                    setState((){
                      me.setEmotionIsSelected = isEmotionSelected;
                    }),
                    for (var i = 0; i < 3; i++) {Navigator.pop(context)},
                    Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: MeSomDonePage(),
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
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Center(
                child: GestureDetector(
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Column(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.user,
                            color: Colors.black,
                            size: 20.0,
                          ),
                          Text(
                            "Me",
                            style: TextStyle(color: Color(0xFF03BFB5)),
                          )
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
