import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:nerdesin_ytu/models/user.dart';
import 'package:nerdesin_ytu/services/session_manager.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('Users');

  // create user obj based on FirebaseUser
  Users? _userFromFirebaseUser(User? user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<Users?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }
  // sign in with email and password

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential? result = await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        SessionController().userId = value.user?.uid.toString();
      }).onError((error, stackTrace) {});

      User? user = result?.user;
      return _userFromFirebaseUser(user!); // (user!) idi.
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// register in email and password
  Future registerWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      UserCredential? result = await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        SessionController().userId = value.user?.uid.toString();
        ref.child(value.user!.uid.toString()).set({
          'uid': value.user!.uid.toString(),
          'email': value.user!.email.toString(),
          'username': username,
          'location': '',
          'profileImage': '',
          'highScore2048': 0,
        });
      }).onError((error, stackTrace) {});
      User? user = result?.user;
      //create a new document for the user with the uid
      //await DatabaseServices(uid: user!.uid).updateUserData(username, '');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign-out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
