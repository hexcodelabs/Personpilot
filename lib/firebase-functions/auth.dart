import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseFunctions {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//  Future getUserID() async {
//    final user = _auth.currentUser;
//    return user.uid;
//  }

  Future fetchName() async {
    print("fetch name");
    final user = _auth.currentUser;
    var userDetails = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .collection("profileData")
        .get();
    String name = userDetails.docs[0]["memberName"];
    return name;
  }

  Future fetchReminders() async {
    List<Map<String,dynamic>> reminders =[];
    await FirebaseFirestore.instance
        .collection("reminders")
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((doc) => reminders.add(doc.data()))
            });
    return reminders;
  }

  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user.uid;
    } catch (e) {
      print(e.message);
      return e.message;
    }
  }

  Future signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user.uid;
    } catch (e) {
      print(e.message);
      return "Error";
    }
  }

  Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future isSignedIn() async {
    // 2 - fully registered  1 - just half  2 - not registered
    var user = _auth.currentUser;
    if (user != null) {
      var userDetails = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .collection("profileData")
          .get();
      print(userDetails.docs.length);
      if (userDetails.docs.length != 0) {
        print(2);
        return 2;
      } else {
        print(1);
        return 1;
      }
    } else {
      print(0);
      return 0;
    }
  }
}
