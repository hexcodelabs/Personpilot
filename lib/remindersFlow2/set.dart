import 'dart:ui';
import 'package:aiapp/Me/overview.dart';
import 'package:aiapp/remindersFlow2/done.dart';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/me.dart';
import 'package:page_transition/page_transition.dart';
import 'package:aiapp/Me/reminderDone.dart';
import 'package:aiapp/providers/registration.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ReminderFlowTwoSet extends StatefulWidget {
  final index;
  ReminderFlowTwoSet({Key key, @required this.index}) : super(key: key);

  @override
  _ReminderFlowTwoSetState createState() => _ReminderFlowTwoSetState();
}

class _ReminderFlowTwoSetState extends State<ReminderFlowTwoSet> {
  var newFormat = DateFormat("h:mm a");
  DateTime rangeStartTime = DateTime.parse("2021-01-01 00:00:00");
  DateTime rangeEndTime = DateTime.parse("2021-01-01 23:59:00");

  DateTime startTime = DateTime.parse("2021-01-01 09:00:00");
  DateTime endTime = DateTime.parse("2021-01-01 22:00:00");
  int noOfReminders = 5;

  @override
  Widget build(BuildContext context) {
    var meReminders = Provider.of<MeReminders>(context);
    var registration = Provider.of<Registration>(context);

    String name = registration.getName;
    String reminderName = meReminders.getReminders[widget.index][0];
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
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Text(
                'That\'s good choice, $name. Please set your "$reminderName" reminder.',
                style: AppTheme.msgText,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Color(0xFF42466C).withOpacity(0.8), BlendMode.srcATop),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(
                        'assets/images/mountains.jpg',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => {
                                if (noOfReminders > 1)
                                  {
                                    setState(() {
                                      noOfReminders = noOfReminders - 1;
                                    })
                                  }
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "${noOfReminders}X",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23),
                                ),
                                Container(
                                  width: 180,
                                  height: 25,
                                  color: Colors.white,
                                  child: Center(
                                    child: Text(
                                      "Reminders per day",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () => {
                                setState(() {
                                  noOfReminders = noOfReminders + 1;
                                })
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  newFormat.format(startTime),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white.withOpacity(0.8),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("START AT",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white.withOpacity(0.5),
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  newFormat.format(endTime),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white.withOpacity(0.8),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("END AT",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white.withOpacity(0.5),
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                        SfRangeSlider(
                            min: rangeStartTime,
                            max: rangeEndTime,
                            values: SfRangeValues(startTime, endTime),
                            activeColor: Colors.white,
                            inactiveColor: Colors.grey,
                            onChanged: (SfRangeValues values) {
                              setState(() {
                                startTime = values.start;
                                endTime = values.end;
                              });
                            })
                      ],
                    ),
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
                  onPressed: () => {
//                    meReminders.setRemoveReminder = widget.index,
//                    for (int i = 0; i < 1; i++) {Navigator.pop(context)}
                  },
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
//                    meReminders.setActiveRemindersDetails = [
//                      widget.index,
//                      noOfReminders,
//                      startTime,
//                      endTime
//                    ],
//                    for (int i = 0; i < 2; i++) {Navigator.pop(context)},
                    Navigator.pop(context),
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: ReminderFlowTwoDone(),
                      ),
                    ),
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
