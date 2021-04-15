import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Error{
  validationAlert(context, String title) {
    var alertStyle = AlertStyle(
        animationType: AnimationType.grow,
        isCloseButton: true,
        isOverlayTapDismiss: false,
        descStyle: TextStyle(fontWeight: FontWeight.bold),
        animationDuration: Duration(milliseconds: 400),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        titleStyle: TextStyle(
          fontFamily: 'OpenSans',
          color: Colors.red,
          fontSize: 20,
        ),
        constraints: BoxConstraints.expand(width: 300),
        //First to chars "55" represents transparency of color
        overlayColor: Color(0xFF03BFB5),
        backgroundColor: Color(0xFFEFF5F9),
        alertElevation: 10,
        alertAlignment: Alignment.center);

    Alert(
      context: context,
      style: alertStyle,
      image: AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.asset(
          'assets/images/error.gif',
        ),
      ),
      title: title,
      buttons: [
        DialogButton(
          child: Text(
            "Got It",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(5.0),
        ),
      ],
    ).show();
  }
}