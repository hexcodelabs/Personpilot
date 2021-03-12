import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/me.dart';
import 'package:aiapp/me/reason.dart';

class CheckIn extends StatefulWidget {
  @override
  _CheckInState createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  double _valueRating = 3;
  String _feel = "Good";
  IconData _ratingIcon = FontAwesomeIcons.smile;
  @override
  Widget build(BuildContext context) {
    var me = Provider.of<Me>(context);
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
                                    _ratingIcon,
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
                                    _feel,
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
                                    if (_valueRating >= 1.0 &&
                                        _valueRating < 2.0) {
                                      _ratingIcon =
                                          FontAwesomeIcons.angry;
                                      _feel = "Terrible";
                                    }
                                    if (_valueRating >= 2.0 &&
                                        _valueRating < 3.0) {
                                      _ratingIcon =
                                          FontAwesomeIcons.meh;
                                      _feel = "Bad";
                                    }
                                    if (_valueRating >= 3.0 &&
                                        _valueRating < 4.0) {
                                      _ratingIcon =
                                          FontAwesomeIcons.smile;
                                      _feel = "Okay";
                                    }
                                    if (_valueRating >= 4.0 &&
                                        _valueRating < 5.0) {
                                      _ratingIcon =
                                          FontAwesomeIcons.grinAlt;
                                      _feel = "Good";
                                    }
                                    if (_valueRating == 5.0) {
                                      _ratingIcon =
                                          FontAwesomeIcons.laughBeam;
                                      _feel = "Great";
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
                              MaterialPageRoute(
                                  builder: (context) => MeReasonsPage()))
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
                          me.setFeel = _feel,
                          me.setRatingIcon = _ratingIcon,
                          me.setRatingValue = _valueRating,
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MeReasonsPage()))
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
                            Text("Me", style: TextStyle(
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
          ),
        ),
      ),
    );
  }
}
