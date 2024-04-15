import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:nerdesin_ytu/services/session_manager.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  final ref = FirebaseDatabase.instance.ref('Users');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.child(SessionController().userId.toString()).onValue,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Text("");
          } else {
            Map<dynamic, dynamic> maps = snapshot.data.snapshot.value;
            return maps['username'];
          }
        });
  }
}
