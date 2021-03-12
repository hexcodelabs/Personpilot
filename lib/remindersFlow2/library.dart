import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  String swipeDirection;
  int index = 0;
  List<List<String>> reminders = [
    [
      "Drink fluids",
      "Not getting fluids can cause headaches, loss of focus, loss of energy, crankiness,dull skin etc."
    ],
    [
      "Breathe",
      "Bunc id tincidunt duis faucibus urma adipiscing. Id lorem diam egestas vel facilisis fames."
    ]
  ];
  @override
  Widget build(BuildContext context) {
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
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Reminder library",
                    style: AppTheme.boldText,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(
                      'Swipe through the library and activate the reminder you find most relevent to you.',
                      style: AppTheme.msgText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onPanUpdate: (details) {
                      swipeDirection = details.delta.dx < 0 ? 'left' : 'right';
                    },
                    onPanEnd: (details) {
                      if (swipeDirection == 'left') {
                        print('left');
                        setState(() {
                          if (index != 0) {
                            index--;
                          } else {
                            index = 0;
                          }
                        });
                      }
                      if (swipeDirection == 'right') {
                        print('right');
                        setState(() {
                          if (index != reminders.length - 1) {
                            index++;
                          } else {
                            index = reminders.length - 1;
                          }
                        });
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.9,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              reminders[index][0],
                              style: AppTheme.reminderTextTitle,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              reminders[index][1],
                              style: AppTheme.reminderText,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 20, 35, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.black, width: 2.0)),
                            child: Center(
                              child: Container(
                                  child: FaIcon(
                                FontAwesomeIcons.chevronLeft,
                                color: Colors.black,
                                size: 25.0,
                              )),
                            ),
                          ),
                          onTap: () => {
                            print('left'),
                            setState(() {
                              if (index != reminders.length - 1) {
                                index++;
                              } else {
                                index = reminders.length - 1;
                              }
                            })
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.black, width: 2.0)),
                            child: Center(
                              child: Container(
                                  child: FaIcon(
                                FontAwesomeIcons.chevronRight,
                                color: Colors.black,
                                size: 25.0,
                              )),
                            ),
                          ),
                          onTap: () => {
                            setState(() {
                              if (index != 0) {
                                index--;
                              } else {
                                index = 0;
                              }
                            })
                          },
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        minWidth: 150,
                        height: 50,
                        onPressed: () => {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side:
                                BorderSide(color: Color(0xFF03BFB5), width: 2)),
                        child: Text(
                          "Cancel",
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
                        child: Column(
                          children: [
                            Text(
                              "Activate this",
                              style: AppTheme.btnText2,
                            ),
                            Text(
                              "reminder",
                              style: AppTheme.btnText2,
                            ),
                          ],
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
