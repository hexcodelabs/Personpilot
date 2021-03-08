import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/stateOfMind.dart';

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
      backgroundColor: Color(0xFFEFF5F9),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Personpilot",
                    style: AppTheme.headingText,
                  ),
                  SizedBox(
                    height: 70,
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
                    child: Column(
                      children: <Widget>[
                        Container(
                            decoration: BoxDecoration(
                              gradient: AppTheme.ratingGradient,
                            ),
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
                                          stateOfMind.setRatingIcon = FontAwesomeIcons.angry;
                                          stateOfMind.setFeel = "Terrible";
                                        }
                                        if (stateOfMind.getRatingValue >= 2.0 &&
                                            stateOfMind.getRatingValue < 3.0) {
                                          stateOfMind.setRatingIcon = FontAwesomeIcons.meh;
                                          stateOfMind.setFeel = "Bad";
                                        }
                                        if (stateOfMind.getRatingValue >= 3.0 &&
                                            stateOfMind.getRatingValue < 4.0) {
                                          stateOfMind.setRatingIcon = FontAwesomeIcons.smile;
                                          stateOfMind.setFeel = "Okay";
                                        }
                                        if (stateOfMind.getRatingValue >= 4.0 &&
                                            stateOfMind.getRatingValue < 5.0) {
                                          stateOfMind.setRatingIcon = FontAwesomeIcons.grinAlt;
                                          stateOfMind.setFeel = "Good";
                                        }
                                        if (stateOfMind.getRatingValue == 5.0) {
                                          stateOfMind.setRatingIcon = FontAwesomeIcons.laughBeam;
                                          stateOfMind.setFeel = "Great";
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
