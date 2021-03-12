import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/stateOfMind.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String text =
        "When people go to work, they \n shouldn't have to leave their \n hearts at home.";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF018076),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Personpilot",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,),
        ),
      ),
      backgroundColor: Color(0xFF018076),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: Text(
                          "Pilot icon",
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  AspectRatio(
                    aspectRatio: 19 / 5,
                    child: SvgPicture.asset(
                      'assets/images/quotation.svg',
//                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Betty Bender", style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white,),),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        minWidth: 200,
                        height: 50,
                        onPressed: () => {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side:
                            BorderSide(color: Colors.white, width: 2)),
                        color: Colors.white,
                        child: Text(
                          "Continue",
                          style: AppTheme.btnText1,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
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
