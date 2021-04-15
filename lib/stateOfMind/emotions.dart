import 'dart:ui';
import 'package:aiapp/stateOfMind/done.dart';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/stateOfMind.dart';
import 'package:aiapp/Me/overview.dart';
import 'package:page_transition/page_transition.dart';

class EmotionsPage extends StatefulWidget {
  @override
  _EmotionsPageState createState() => _EmotionsPageState();
}

class _EmotionsPageState extends State<EmotionsPage> {

  List<bool> isEmotionSelected;

  @override
  void initState() {
    var stateOfMind = Provider.of<StateOfMind>(context, listen: false);
    setState(() {
      isEmotionSelected = List.from(stateOfMind.getEmotionsIsSelected);
    });

    super.initState();
  }


  Widget button(String text, int key, BuildContext context) {
    return FlatButton(
      minWidth: 100,
      height: 50,
      onPressed: () => {
        if(isEmotionSelected.where((element) => element==true).toList().length<5){
          setState((){
            isEmotionSelected[key]= !isEmotionSelected[key];
          })
        }else{
          if(isEmotionSelected[key]==true){
            setState((){
              isEmotionSelected[key]= !isEmotionSelected[key];
            })
          }
        }
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Color(0xFFFFC10D), width: 2)),
      color: isEmotionSelected[key]
          ? Color(0xFFFFC10D)
          : Colors.white,
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
    StateOfMind stateOfMind = Provider.of<StateOfMind>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.06,
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
                    "Choose up to five emotions.",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.44,
                      child: emotionButtons(stateOfMind.getEmotions, context)),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        minWidth: 150,
                        height: 50,
                        onPressed: () => {
                          Navigator.pushAndRemoveUntil(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: DonePage(),
                            ),
                              (route)=>false
                          )
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
                          stateOfMind.setEmotionIsSelected = isEmotionSelected,
                          Navigator.pushAndRemoveUntil(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: DonePage(),
                            ),
                                  (route)=>false
                          )
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
                                  color: Color(0xFF03BFB5),
                                  size: 20.0,
                                ),
                                Text("Co-pilot",style: TextStyle(color: Color(0xFF03BFB5)),)
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Overview()))
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                        ],
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
