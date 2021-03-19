import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:page_transition/page_transition.dart';
import 'package:aiapp/registration/regPageTwo.dart';


class RegPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF03BFB5),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        centerTitle:true,
        title: Text(
          "Personpilot",
          style: AppTheme.headingTextWhite,
        ),
      ),
      backgroundColor: Color(0xFF03BFB5),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    "Hi there,",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,)
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "I'm",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,)
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Personpilot",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Your co-pilot at work",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          minWidth: 200,
                          height: 50,
                          onPressed: () => {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: RegPageTwo(),
                              ),
                            )
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side:
                              BorderSide(color: Colors.white, width: 2)),
                          color: Colors.white,
                          child: Text(
                            "Hi!",
                            style: TextStyle(
                              color: Color(0xFF03BFB5),
                              fontSize: 20,
                              fontWeight: FontWeight.normal,),
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
