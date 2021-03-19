import 'package:aiapp/Me/reason.dart';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/me.dart';
import 'package:page_transition/page_transition.dart';
import 'package:aiapp/providers/registration.dart';

class CheckIn extends StatefulWidget {
  @override
  _CheckInState createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  double ratingValue ;
  String feel;
  IconData ratingIcon;

  @override
  void initState() {
    var me = Provider.of<MeStateOfMind>(context,listen: false);
    setState(() {
      ratingValue = me.getRatingValue;
      feel = me.getFeel;
      ratingIcon = me.getRatingIcon;
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var me = Provider.of<MeStateOfMind>(context);
    var registration = Provider.of<Registration>(context);
    String name = registration.getName;
    String time = "afternoon";


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
                      onTap: ()=>{
                        Navigator.pop(context)
                      },
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
              "Good $time, $name",
              style: AppTheme.msgText,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "How are you feeling these days?",
              style: AppTheme.msgText,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                decoration: BoxDecoration(
                  gradient: AppTheme.ratingGradient,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            child: FaIcon(
                              ratingIcon,
                              color: Colors.white,
                              size: 100.0,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 30,
                          width: 150,
                          decoration:
                          BoxDecoration(color: Color(0xFF03BFB5)),
                          child: Center(
                            child: Text(
                              feel,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Slider(
                            min: 1,
                            max: 5,
                            value: ratingValue,
                            activeColor: Colors.white,
                            inactiveColor: Colors.grey,
                            onChanged: (double value) {
                              print(value);
                              setState(() {
                                ratingValue= value;
                              });

                              if (ratingValue >= 1.0 &&
                                  ratingValue  < 2.0) {
                                ratingIcon =
                                    FontAwesomeIcons.angry;
                                feel = "Terrible";
                              }
                              if (ratingValue  >= 2.0 &&
                                  ratingValue  < 3.0) {
                                ratingIcon =
                                    FontAwesomeIcons.meh;
                                feel = "Bad";
                              }
                              if (ratingValue  >= 3.0 &&
                                  ratingValue  < 4.0) {
                                ratingIcon =
                                    FontAwesomeIcons.smile;
                                feel = "Okay";
                              }
                              if (ratingValue  >= 4.0 &&
                                  ratingValue  < 5.0) {
                                ratingIcon =
                                    FontAwesomeIcons.grinAlt;
                                feel = "Good";
                              }
                              if (ratingValue == 5.0) {
                                ratingIcon =
                                    FontAwesomeIcons.laughBeam;
                                feel = "Great";
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
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
                        child: MeReasonsPage(),
                      ),
                    )
                  },
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
                  onPressed: () => {
                    me.setRatingValue = ratingValue,
                    me.setFeel = feel,
                    me.setRatingIcon = ratingIcon,
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: MeReasonsPage(),
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
              padding: const EdgeInsets.fromLTRB(0,10,0,0),
              child: Center(
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
                        Text("Me",style: TextStyle(
                            color: Color(0xFF03BFB5)
                        ),)
                      ],
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
