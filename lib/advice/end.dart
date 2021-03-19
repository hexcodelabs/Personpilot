import 'dart:ui';
import 'package:aiapp/Me/overview.dart';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/registration.dart';

class AdviceFlowEnd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var registration = Provider.of<Registration>(context);
    String name = registration.getName;
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
              height: 70,
            ),
            Text(
              "Okay, back to work you go, $name.",
              style: AppTheme.msgText,
            ),
            SizedBox(
              height: 50,
            ),
            AspectRatio(
              aspectRatio: 16 / 7,
              child: Image.asset(
                'assets/images/happy-face.png',
                width: 50.0,
                height: 50.0,
//                      fit: BoxFit.contain,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Overview()))
                  },
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
