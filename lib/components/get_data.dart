import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/session_manager.dart';

class GetData extends StatelessWidget {
  String data;
  GetData({super.key, required this.data});

  final ref = FirebaseDatabase.instance.ref('Users');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref
          .child(SessionController().userId.toString())
          .child('Location')
          .onValue,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Text('bulamadım');
        } else if (snapshot.hasData) {
          Map<dynamic, dynamic> map = snapshot.data.snapshot.value;

          return Text(map[data]);
        } else {
          return const Text("HATACIK");
        }
      },
    );
  }
}
