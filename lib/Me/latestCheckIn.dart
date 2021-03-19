import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/me.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:page_transition/page_transition.dart';
import 'package:aiapp/Me/checkIn.dart';
import 'package:aiapp/providers/registration.dart';

class LatestCheckIn extends StatelessWidget {
  String date = "01";
  String month = "01";
  String year = "2021";
  @override
  Widget build(BuildContext context) {
    var me = Provider.of<MeStateOfMind>(context);
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
              height: 20,
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: CheckIn(),
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
                  height: 90,
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
                          "MAKE A NEW MOOD CHECK IN",
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
              "Your latest mood check-in:",
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "$date/$month/$year",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
            Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: FaIcon(
                            me.getRatingIcon,
                            color: Colors.black,
                            size: 90.0,
                          )),
                      Container(
                        height: 30,
                        width: 150,
                        child: Center(
                          child: Text(
                            me.getFeel,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Spacer(),
            Center(
              child: Text("Reasons for mood",style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.5)
              ),),
            ),
            Container(
              height: 50.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                  itemCount: me.getReasonsIsSelected.length,
                  itemBuilder: (BuildContext context, int index) {
                    if(me.getReasonsIsSelected[index] == true){
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(5,0,5,0),
                        child: Container(
                          height: 40,
                          width: 100,
                          child: Center(
                            child: Text(me.getReasons[index], style: TextStyle(
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.5)
                            ),),
                          ),
                        ),
                      );
                    }else{
                      return(
                      Container()
                      );
                    }
                  }
              )
            ),
            Center(
              child: Text("Resonating emotions",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.5)
              ),),
            ),
            Container(
                height: 50.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                    itemCount: me.getEmotions.length,
                    itemBuilder: (BuildContext context, int index) {
                      if(me.getEmotionsIsSelected[index] == true){
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(5,0,5,0),
                          child: Container(
                            height: 40,
                            width: 100,
                            child: Center(
                              child: Text(me.getEmotions[index], style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black.withOpacity(0.5)
                              ),),
                            ),
                          ),
                        );
                      }else{
                        return(
                            Container()
                        );
                      }
                    }
                )
            ),
            Center(
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
            )

          ],
        ),
      ),
    );
  }
}
