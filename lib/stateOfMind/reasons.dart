import 'dart:ui';
import 'package:aiapp/stateOfMind/emotions.dart';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/stateOfMind.dart';
import 'package:aiapp/Me/overview.dart';
import 'package:page_transition/page_transition.dart';

class ReasonsPage extends StatefulWidget {
  @override
  _ReasonsPageState createState() => _ReasonsPageState();
}

class _ReasonsPageState extends State<ReasonsPage> {

  List<bool> isReasonSelected;

  @override
  void initState() {
    var stateOfMind = Provider.of<StateOfMind>(context, listen: false);
    setState(() {
      isReasonSelected = List.from(stateOfMind.getReasonsIsSelected);
    });
    super.initState();
  }

  Widget button(String text, int key, BuildContext context) {

    return FlatButton(
      height: 50,
      onPressed: () => {
        if(isReasonSelected.where((element) => element==true).toList().length<5){
          setState((){
            isReasonSelected[key] = !isReasonSelected[key];
          })
        }else{
          if(isReasonSelected[key]==true){
            setState((){
              isReasonSelected[key] = !isReasonSelected[key];
            })
          }
        }

      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Color(0xFF03BFB5), width: 2)),
      color: isReasonSelected[key]
          ? Color(0xFF03BFB5)
          : Colors.white,
      child: Text(
        text,
        style: isReasonSelected[key]
            ? AppTheme.btnReasonTxt1
            : AppTheme.btnReasonTxt2,
      ),
    );
  }

  Widget buttonRow(List<String> reasons, BuildContext context, int index) {
    return (Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          button(reasons[index], index, context),
          button(reasons[index + 1], index + 1, context),
//          button(reasons[index + 2], index + 2, context)
        ],
      ),
    ));
  }

  Widget reasonButtons(List<String> reasons, BuildContext context) {
    return (ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: (reasons.length ~/ 2).toInt(),
        itemBuilder: (BuildContext context, int index) {
          return buttonRow(reasons, context, index * 2);
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
                    "What is making you feel good?",
                    style: AppTheme.msgText,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Choose up to five reasons.",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height*0.48,
                      child: reasonButtons(stateOfMind.getReasons, context)),
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
                              child: EmotionsPage(),
                            ),
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
                          stateOfMind.setReasonIsSelected = isReasonSelected,
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: EmotionsPage(),
                            ),
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
