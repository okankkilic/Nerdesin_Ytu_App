/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class GetUserName extends StatelessWidget {
  GetUserName({
    super.key,
  });

  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder(
        future: users.doc(user!.uid).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            dynamic data = snapshot.data!.data() as dynamic;
            return Text('Username: ${data['username']}');
          }
          return Text('loading');
        }));
  }
}

 */
