import 'package:cloud_firestore/cloud_firestore.dart';

class Database{
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

}