import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:aiapp/themes/theme.dart';
import 'package:provider/provider.dart';
import 'package:aiapp/providers/registration.dart';
import 'package:page_transition/page_transition.dart';
import 'package:aiapp/registration/regPageThree.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aiapp/common/error.dart';

class RegPageTwo extends StatefulWidget {
  @override
  _RegPageTwoState createState() => _RegPageTwoState();
}

class _RegPageTwoState extends State<RegPageTwo> {
  var isEmailValid;
  var isPassValid;
  Error error = new Error();

  @override
  Widget build(BuildContext context) {
    var registration = Provider.of<Registration>(context);

    return registration.getIsLoading
        ? Center(
            child: Container(
              color: Color(0xFF03BFB5),
              child: Center(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    'assets/images/loading.gif',
                  ),
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF03BFB5),
              leading: Center(
                child: GestureDetector(
                  onTap: () => {Navigator.pop(context)},
                  child: FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.black,
                    size: 25.0,
                  ),
                ),
              ),
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
                child: Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.05,
                          ),
                          Text("Good to meet you!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              "Would you like to create your free Personpilot "
                              "account with LinkedIn or email and password?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          MaterialButton(
                            minWidth: MediaQuery.of(context).size.width * 0.85,
                            height: 50,
                            onPressed: () async {
                            await registration.signUpWithGoogle();
                            if(registration.getIsRegistered){
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: RegPageThree(),
                                ),
                              );
                            }else{
                              if(registration.getIsError){
                                error.validationAlert(context,
                                    "Error in registration");
                              }
                            }

                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(
                                    color: Color(0xFF2867B2), width: 2)),
                            color: Color(0xFF2867B2),
                            child: Text(
                              "Create account with Google",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Or",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: TextFormField(
                              initialValue: registration.getEmail,
                              onChanged: (text) =>
                                  {registration.setEmail = text},
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              decoration: new InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: isEmailValid == "Null"
                                          ? Colors.red
                                          : Colors.white),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: isEmailValid == "Null"
                                          ? Colors.red
                                          : Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: isEmailValid == "Null"
                                          ? Colors.red
                                          : Colors.white),
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: TextFormField(
                              obscureText: true,
                              initialValue: registration.getPass,
                              onChanged: (text) =>
                                  {registration.setPass = text},
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              decoration: new InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: isPassValid == "Null"
                                          ? Colors.red
                                          : Colors.white),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: isPassValid == "Null"
                                          ? Colors.red
                                          : Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: isPassValid == "Null"
                                          ? Colors.red
                                          : Colors.white),
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MaterialButton(
                                  minWidth:
                                      MediaQuery.of(context).size.width * 0.85,
                                  height: 50,
                                  onPressed: () async {
                                    if (registration.getEmail?.length == 0 ||
                                        registration.getEmail?.length == null) {
                                      setState(() {
                                        isEmailValid = "Null";
                                      });
                                    } else {
                                      setState(() {
                                        isEmailValid = "_";
                                      });
                                    }
                                    if (registration.getPass?.length == 0 ||
                                        registration.getPass?.length == null) {
                                      setState(() {
                                        isPassValid = "Null";
                                      });
                                    } else {
                                      setState(() {
                                        isPassValid = "_";
                                      });
                                    }
                                    if (isPassValid == "_" &&
                                        isEmailValid == "_") {
                                      registration.formValidate();
                                      if (!registration.getIsEmailValid) {
                                        error.validationAlert(
                                            context, "Email is not valid");
                                        return null;
                                      }
                                      if (!registration.getIsPassValid) {
                                        error.validationAlert(context,
                                            "Password should be at least 6 characters");
                                        return null;
                                      }
                                      await registration.signUpWithEmail();
                                    }
                                    if(registration.getIsRegistered){
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: RegPageThree(),
                                        ),
                                      );
                                    }else{
                                      if(registration.getIsError){
                                        error.validationAlert(context,
                                            "Error in registration");
                                      }
                                    }

                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: Colors.white, width: 2)),
                                  color: Colors.white,
                                  child: Text(
                                    "Create account",
                                    style: TextStyle(
                                      color: Color(0xFF03BFB5),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
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
            ),
          );
  }
}
