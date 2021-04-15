import 'dart:ui';
import 'package:aiapp/Me/overview.dart';
import 'package:aiapp/quote/end.dart';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/registration.dart';
import 'package:aiapp/providers/me.dart';

class QuoteSuggestion extends StatelessWidget {
  final index = 1;

  @override
  Widget build(BuildContext context) {
    var registration = Provider.of<Registration>(context);
    var meQuotes = Provider.of<MeQuotes>(context);
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
              height: 30,
            ),
            Text("Hi $name.", style: AppTheme.msgText),
            Text("Here's a quote you might like:", style: AppTheme.msgText),
            SizedBox(
              height: 40,
            ),
            Text(
              "\"${meQuotes.getQuotes[index][0]}\"",
              textAlign: TextAlign.center,
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              meQuotes.getQuotes[index][1],
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 30,
            ),
            AspectRatio(
                aspectRatio: 16 / 6,
                child: Image.network(meQuotes.getQuotes[index][2])),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  minWidth: 150,
                  height: 50,
                  onPressed: () => {
                    Navigator.pop(context),
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: QuoteFlowEnd(),
                      ),
                    ),
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Color(0xFF03BFB5), width: 2)),
                  color: Color(0xFF03BFB5),
                  child: Text(
                    "Thanks",
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
    );
  }
}
