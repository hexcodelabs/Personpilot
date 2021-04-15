import 'package:aiapp/firebase-functions/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:aiapp/firebase-functions/database.dart';

class Registration with ChangeNotifier {
  var checkEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  String _email;
  String _pass;
  String _name;
  FireBaseFunctions fbFunctions = new FireBaseFunctions();
  bool _isLoading = false;
  String _userId;
  bool _isError = false;
  bool _isEmailValid = false;
  bool _isPassValid = false;
  bool _isRegistered = false;
  PickedFile _imageFile;
  Database database = new Database();

  String get getEmail => _email;
  String get getPass => _pass;
  String get getName => _name;
  bool get getIsLoading => _isLoading;
  bool get getIsError => _isError;
  bool get getIsEmailValid => _isEmailValid;
  bool get getIsPassValid => _isPassValid;
  bool get getIsRegistered => _isRegistered;
  PickedFile get getImageFile => _imageFile;

  set setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  set setPass(String value) {
    _pass = value;
    notifyListeners();
  }

  set setName(String value) {
    _name = value;
    notifyListeners();
  }

  bool checkEmailIsValid() {
    return checkEmail.hasMatch(_email);
  }

  bool checkPassIsValid() {
    if (_pass.length >= 6) {
      return true;
    } else {
      return false;
    }
  }

  void formValidate() {
    _isEmailValid = checkEmailIsValid();
    _isPassValid = checkPassIsValid();
    notifyListeners();
  }

  Future<void> signUpWithEmail() async {
    _isLoading = true;
    notifyListeners();
    print(_isPassValid);
    await fbFunctions.signUp(_email, _pass).then((message) async {
      if (message == "Error") {
        _isError = true;
        _isLoading = false;
        _isRegistered = false;
      } else {
        _userId = message;
        _isLoading = false;
        _isError = false;
        _isRegistered = true;
      }
    });

    notifyListeners();
  }

  Future<void> signUpWithGoogle() async{
    _isLoading = true;
    notifyListeners();
    await fbFunctions.signUpWithGoogle().then((message) async{
      if(message=="Error"){
        _isError = true;
        _isLoading = false;
        _isRegistered = false;
      }else{
        _userId = message;
        _isLoading = false;
        _isError = false;
        _isRegistered = true;
      }
    });
    notifyListeners();
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final PickedFile selected = await _picker.getImage(source: source);
    _imageFile = selected;
    notifyListeners();
  }


  Future<void> registerUser() async {
    _isLoading = true;
    notifyListeners();
    String fileName = '$_userId';
    String filePath = 'profilePics/' + fileName;
    try {
      UploadTask _uploadTask = FirebaseStorage.instance
          .ref()
          .child(filePath)
          .putData(await _imageFile.readAsBytes());
      var _downloadUrl = await (await _uploadTask).ref.getDownloadURL();
      Map<String, String> userData = {
        "memberName": _name,
        "memberEmail": _email,
        "profilePicUrl": _downloadUrl
      };

      await _uploadTask.whenComplete(() async {
        await database.addUserDetails(_userId, userData);
      });
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      _isError = true;
    }
    notifyListeners();
  }
}
