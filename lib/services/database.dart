/*
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_info.dart';

class DatabaseServices {
  final String uid;
  DatabaseServices({required this.uid});

  final CollectionReference ytuCollection =
      FirebaseFirestore.instance.collection('ytu');

  Future updateUserData(String username, String buyukev) async {
    return await ytuCollection.doc(uid).set({
      'username': username,
      'buyukev': buyukev,
    });
  }

  //Brew == UserInfo
  List<UserInfo?> _ytuListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UserInfo(
        username: doc.get('username') ?? " ",
        buyukev: doc.get('buyukev') ?? " ",
      );
    }).toList();
  }

  // get snapshots

  Stream<List<UserInfo?>> get ytu {
    return ytuCollection.snapshots().map(_ytuListFromSnapshot);
  }
}


 */
