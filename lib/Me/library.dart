import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aiapp/providers/registration.dart';
import 'package:aiapp/providers/me.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:aiapp/Me/set.dart';

class MeLibrary extends StatefulWidget {
  @override
  _MeLibraryState createState() => _MeLibraryState();
}

class _MeLibraryState extends State<MeLibrary> {
  String swipeDirection;
  int index = 0;
  List<bool> showMoreStatus;

  @override
  void initState() {
    super.initState();
    var meReminders = Provider.of<MeReminders>(context, listen: false);
    showMoreStatus = List.filled(meReminders.getReminders.length, false);
  }

  @override
  Widget build(BuildContext context) {
    var registration = Provider.of<Registration>(context);
    var meReminders = Provider.of<MeReminders>(context);
    String name = registration.getName;

    List<Map<String,dynamic>> reminders = meReminders.getReminders;
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
                    if (index != reminders.length - 1) {
                      index++;
                    } else {
                      index = reminders.length - 1;
                    }
                  });
                }
                if (swipeDirection == 'right') {
                  print('right');
                  setState(() {
                    if (index != 0) {
                      index--;
                    } else {
                      index = 0;
                    }
                  });
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.9,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reminders[index]["name"],
                          style: AppTheme.reminderTextTitle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          reminders[index]["intro"],
                          style: AppTheme.reminderText,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        showMoreStatus[index] == true
                            ? Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.8,
                                  child: RichText(
                                    textAlign: TextAlign.left,
                                    text: TextSpan(
                                        style: AppTheme.reminderText,
                                        children: [
                                          new TextSpan(
                                            text: reminders[index]["title"],
                                          ),
                                          new TextSpan(text: "\n"),
                                          new TextSpan(
                                            text: reminders[index]["background"],
                                          ),
                                        ]),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.8,
                                  child: Text(
                                    reminders[index]["source"],
                                    style: AppTheme.reminderItalicText,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            )
                            : Text(""),
                        GestureDetector(
                          onTap: () => {
                            showMoreStatus[index] == false
                                ? setState(() {
                                    showMoreStatus[index] = true;
                                  })
                                : setState(() {
                                    showMoreStatus[index] = false;
                                  })
                          },
                          child: Text(
                            showMoreStatus[index] == false
                                ? "Read more"
                                : "Show less",
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              color: Color(0xFF03BFB5),
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                          border: Border.all(color: Colors.black, width: 2.0)),
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
                        if (index != 0) {
                          index--;
                        } else {
                          index = 0;
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
                          border: Border.all(color: Colors.black, width: 2.0)),
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
                        if (index != reminders.length - 1) {
                          index++;
                        } else {
                          index = reminders.length - 1;
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
                  onPressed: () => {Navigator.pop(context)},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Color(0xFF03BFB5), width: 2)),
                  child: Text(
                    "Cancel",
                    style: AppTheme.btnText1,
                  ),
                ),
                MaterialButton(
                  minWidth: 150,
                  height: 50,
                  onPressed: () => {
                    meReminders.setActiveReminders = index,
                    Navigator.pop(context),
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: MeSetPage(
                          index: index,
                        ),
                      ),
                    )
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Color(0xFF03BFB5), width: 2)),
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
