import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/registration.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegPageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var registration = Provider.of<Registration>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF03BFB5),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Personpilot",
          style: AppTheme.headingTextWhite,
        ),
      ),
      backgroundColor: Color(0xFF03BFB5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      "Wonderful! What's your name?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: TextField(
                      onChanged: (text) => {registration.setName = text},
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      decoration: new InputDecoration(
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.2),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              width: 0, color: Colors.black.withOpacity(0.2)),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              width: 0, color: Colors.black.withOpacity(0.2)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              width: 0, color: Colors.black.withOpacity(0.2)),
                        ),
                        hintText: "Your name",
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.black, width: 2.0)),
                      child: Center(
                        child: Container(
                            child: FaIcon(
                              FontAwesomeIcons.plus,
                              color: Colors.black,
                              size: 30.0,
                            )),
                      ),
                    ),
                    onTap: () => {
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tap here to add profile picture",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          minWidth: 200,
                          height: 50,
                          onPressed: registration.getName == null ||
                                  registration.getName == ''
                              ? null
                              : () => {},
                          disabledColor: Colors.black.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.white,
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              color: registration.getName == null ||
                                  registration.getName == ''
                                  ?Colors.black.withOpacity(0.4): Color(0xFF03BFB5),
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        )
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
