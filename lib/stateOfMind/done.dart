import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aiapp/Me/overview.dart';
import 'package:aiapp/providers/registration.dart';
import 'package:provider/provider.dart';


class DonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var registration = Provider.of<Registration>(context);
    String name = registration.getName;
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
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Thanks for checking in, $name!",
                    style: AppTheme.msgText,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "I'll be in touch.",
                    style: AppTheme.msgText,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  AspectRatio(
                    aspectRatio: 16 / 8,
                    child: Image.asset(
                      'assets/images/done.gif',
                      width: 50.0,
                      height: 50.0,
//                      fit: BoxFit.contain,
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Overview()))
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side:
                            BorderSide(color: Color(0xFF03BFB5), width: 2)),
                        color: Color(0xFF03BFB5),
                        child: Text(
                          "Cool",
                          style: AppTheme.btnText2,
                        ),
                      )
                    ],
                  ),
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
                                  color: Color(0xFF03BFB5),
                                  size: 20.0,
                                ),
                                Text("Co-pilot",style: TextStyle(color: Color(0xFF03BFB5)),)
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Overview()))
                            },
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
                        ],
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
