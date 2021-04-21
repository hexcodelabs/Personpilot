import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Database {
  addUserDetails(String userId, userData) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("profileData")
        .add(userData)
        .catchError((e) {
      print(e.toString());
    });
  }

  addStateOfMind(String userId, userData) async {
    await FirebaseFirestore.instance
        .collection("me")
        .doc(userId)
        .collection("StateOfMind")
        .doc("data")
        .set(userData)
        .catchError((e) {
      print(e.toString());
    });
  }

  updateStateOfMind(String userId, userData) async {
    var exist = await fetchStateOfMind(userId);
    if (exist != null) {
      await FirebaseFirestore.instance
          .collection("me")
          .doc(userId)
          .collection("StateOfMind")
          .doc("data")
          .update(userData)
          .catchError((e) {
        print(e.toString());
      });
    }
    else{
      await addStateOfMind(userId,userData);
    }
  }

  addReminderData(String userId, index, reminderData) async {
    await FirebaseFirestore.instance
        .collection("me")
        .doc(userId)
        .collection("Reminders")
        .doc(index.toString())
        .set(reminderData)
        .catchError((e) {
      print(e.toString());
    });
  }

  updateReminderData(String userId, index, reminderData) async {
    await FirebaseFirestore.instance
        .collection("me")
        .doc(userId)
        .collection("Reminders")
        .doc(index.toString())
        .update(reminderData)
        .catchError((e) {
      print(e.toString());
    });
  }

  deleteReminder(String userId, index) async {
    await FirebaseFirestore.instance
        .collection("me")
        .doc(userId)
        .collection("Reminders")
        .doc(index.toString())
        .delete()
        .catchError((e) {
      print(e.toString());
    });
  }

  Future fetchStateOfMind(String userId) async {
    var _data;
    await FirebaseFirestore.instance
        .collection("me")
        .doc(userId)
        .collection("StateOfMind")
        .doc("data")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // print('Document exists on the database');
        _data = documentSnapshot.data();
      }
    });
    return _data;
  }

  Future fetchReminders(String userId) async {
    var _data = [];
    await FirebaseFirestore.instance
        .collection("me")
        .doc(userId)
        .collection("Reminders")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        // print(doc.data());
        var dataTemp = doc.data();
        _data.add(dataTemp);
      });
    });
    return _data;
  }

  Future fetchQuotes(String userId) async {
    var _data = [];
    await FirebaseFirestore.instance
        .collection("reflection")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        // print(doc.data());
        var dataTemp = doc.data();
        _data.add(dataTemp);
      });
    });
    return _data;
  }

// Get the token, save it to the database for current user
  Future saveDeviceToken() async {
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;

    var user = _auth.currentUser;
    var uid =  user.uid;
    
    // Get the token for this device
    String fcmToken = await _fcm.getToken();

    // Save it to Firestore
    if (fcmToken != null) {
      var tokens = FirebaseFirestore.instance
          .collection('DeviceID')
          .doc(uid);

      await tokens.set({
        'token': fcmToken,
        'createdAt': FieldValue.serverTimestamp(), // optional
        'platform': Platform.operatingSystem // optional
      });
      return true;
    }
    return false;
  }
}
