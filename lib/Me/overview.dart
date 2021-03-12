import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/stateOfMind.dart';
import 'package:aiapp/remindersFlow1/suggession.dart';


class Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFEFF5F9),//Color(0xFFEFF5F9)
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          centerTitle:true,
          title: Text(
            "Malthe (Me)",
            style: AppTheme.headingText,
          ),
          actions: [
            // action button
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Color(0xFF03BFB5),
                          shape: BoxShape.circle,),
                      child: Center(
                        child: Text("Me",style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,),)
                      ),
                    ),
                  ),

              ],
            ),

          ],
        ),
      backgroundColor: Color(0xFFEFF5F9),
      body: SafeArea(
        child: Center(
          child: Container(
//            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Please choose a module.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width * 0.85,
                          height: 60,
                          onPressed: () => {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),),
                          color: Color(0xFF018076),
                          child: Column(
                            children: [
                              Text(
                                "State of mind",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "How I feel",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic
                                ),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width * 0.85,
                          height: 60,
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SuggestionPage()))
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),),
                          color: Color(0xFF018076),
                          child: Column(
                            children: [
                              Text(
                                "Reminders",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "How I develop",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic
                                ),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width * 0.85,
                          height: 60,
                          onPressed: () => {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),),
                          color: Color(0xFF018076),
                          child: Column(
                            children: [
                              Text(
                                "Advice",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "How I develop",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic
                                ),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width * 0.85,
                          height: 60,
                          onPressed: () => {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),),
                          color: Color(0xFF018076),
                          child: Column(
                            children: [
                              Text(
                                "Reflexion",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "How I develop",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Center(
                      child: Container(
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
          ),
        ),
      ),
    );
  }
}
