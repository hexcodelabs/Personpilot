import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/me.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:page_transition/page_transition.dart';
import 'package:aiapp/Me/library.dart';
import 'package:aiapp/providers/registration.dart';

import 'updateReminder.dart';

class MeRemindersPage extends StatefulWidget {
  @override
  _MeRemindersPageState createState() => _MeRemindersPageState();
}

class _MeRemindersPageState extends State<MeRemindersPage> {
  List<bool> showMoreStatus;

  @override
  void initState() {
    super.initState();
    var meReminders = Provider.of<MeReminders>(context, listen: false);
    showMoreStatus = List.filled(meReminders.getReminders.length, false);
  }

  Widget reminderContainer(context, int index) {
    var meReminders = Provider.of<MeReminders>(context, listen: false);
    List<Map<String, dynamic>> reminders = meReminders.getReminders;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Container(
//        height: MediaQuery.of(context).size.height * 0.25,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    reminders[index]["name"],
                    style: AppTheme.reminderTextTitle,
                  ),
                  PopupMenuButton<String>(
                    icon: FaIcon(
                      FontAwesomeIcons.ellipsisH,
                      color: Colors.black,
                      size: 20.0,
                    ),
                    onSelected: (value) async => {
                      if (value == "Delete reminder")
                        {
                          meReminders.setRemoveReminder = index,
                          meReminders.removeReminderDetails = index,
                          await meReminders.removeReminder(index)
                        }
                      else if (value == "Edit reminder")
                        {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: MeUpdateSetPage(index: index,),
                            ),
                          ),
                        }
                    },
                    itemBuilder: (BuildContext context) {
                      return {'Edit reminder', 'Delete reminder'}
                          .map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice, style: AppTheme.reminderText),
                        );
                      }).toList();
                    },
                  ),
//                  Container(
//                    child: DropdownButtonHideUnderline(
//                      child: ButtonTheme(
//                        alignedDropdown: true,
//                        child: DropdownButton(
//                          icon: FaIcon(
//                            FontAwesomeIcons.ellipsisH,
//                            color: Colors.black,
//                            size: 20.0,
//                          ),
//                          items: [
//                            DropdownMenuItem(
//                              child: Text("Edit reminder"),
//                              value: 1,
//                            ),
//                            DropdownMenuItem(
//                              child: Text("Delete reminder"),
//                              value: 2,
//                            ),
//                          ],
//                          onChanged: (value)=>{
//                            print(value)
//
//                          },
//                        ),
//                      ),),
//                  ),
                ],
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
                          width: MediaQuery.of(context).size.width * 0.8,
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
                          width: MediaQuery.of(context).size.width * 0.8,
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
                  showMoreStatus[index] == false ? "Read more" : "Show less",
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
    );
  }

  @override
  Widget build(BuildContext context) {
    var meReminders = Provider.of<MeReminders>(context);
    var registration = Provider.of<Registration>(context);
    String name = registration.getName;
    return Scaffold(
      backgroundColor: Color(0xFFEFF5F9),
      body: SafeArea(
        child: Column(
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
              height: 20,
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: MeLibrary(),
                  ),
                )
              },
              child: DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: [8, 4],
                strokeWidth: 2,
                color: Color(0xFF03BFB5),
                radius: Radius.circular(12),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Column(
                      children: [
                        Text(
                          "Tap here to",
                          style: TextStyle(
                            color: Color(0xFF03BFB5),
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          "ADD A NEW REMINDER",
                          style: TextStyle(
                            color: Color(0xFF03BFB5),
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Active reminders",
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  itemCount: meReminders.getActiveReminders?.length == null
                      ? 0
                      : meReminders.getActiveReminders.length,
                  itemBuilder: (BuildContext context, int index) {
                    int idx = meReminders.getActiveReminders.elementAt(index);
                    return reminderContainer(context, idx);
                  }),
            ),
            Spacer(),
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
