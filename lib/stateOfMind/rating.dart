import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/stateOfMind.dart';
import 'package:aiapp/stateOfMind/reasons.dart';

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double _valueRating = 3;
  @override
  Widget build(BuildContext context) {
    var stateOfMind = Provider.of<StateOfMind>(context);
    String name = "Tharaka";
    String time = "afternoon";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF5F9),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        centerTitle:true,
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
                                stateOfMind.getRatingIcon,
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
                                    stateOfMind.getFeel,
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
                                  value: _valueRating,
                                  activeColor: Colors.white,
                                  inactiveColor: Colors.grey,
                                  onChanged: (double value) {
                                    setState(() {
                                      _valueRating = value;
                                    });
                                    stateOfMind.setRatingValue = value;
                                    if (stateOfMind.getRatingValue >= 1.0 &&
                                        stateOfMind.getRatingValue < 2.0) {
                                      stateOfMind.setRatingIcon =
                                          FontAwesomeIcons.angry;
                                      stateOfMind.setFeel = "Terrible";
                                    }
                                    if (stateOfMind.getRatingValue >= 2.0 &&
                                        stateOfMind.getRatingValue < 3.0) {
                                      stateOfMind.setRatingIcon =
                                          FontAwesomeIcons.meh;
                                      stateOfMind.setFeel = "Bad";
                                    }
                                    if (stateOfMind.getRatingValue >= 3.0 &&
                                        stateOfMind.getRatingValue < 4.0) {
                                      stateOfMind.setRatingIcon =
                                          FontAwesomeIcons.smile;
                                      stateOfMind.setFeel = "Okay";
                                    }
                                    if (stateOfMind.getRatingValue >= 4.0 &&
                                        stateOfMind.getRatingValue < 5.0) {
                                      stateOfMind.setRatingIcon =
                                          FontAwesomeIcons.grinAlt;
                                      stateOfMind.setFeel = "Good";
                                    }
                                    if (stateOfMind.getRatingValue == 5.0) {
                                      stateOfMind.setRatingIcon =
                                          FontAwesomeIcons.laughBeam;
                                      stateOfMind.setFeel = "Great";
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
                        onPressed: () => {},
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReasonsPage()))
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
