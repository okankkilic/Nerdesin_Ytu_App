import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nerdesin_ytu/components/background_color.dart';
import 'package:nerdesin_ytu/components/profil_textformfield.dart';
import 'package:nerdesin_ytu/services/session_manager.dart';

class GetProfileCard extends StatefulWidget {
  GetProfileCard({
    super.key,
  });

  @override
  State<GetProfileCard> createState() => _GetProfileCardState();
}

class _GetProfileCardState extends State<GetProfileCard> {
  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  //var user = FirebaseAuth.instance.currentUser;
  final ref = FirebaseDatabase.instance.ref('Users');
  final nameControler = TextEditingController();

  Future<void> showUsernameDialogAlert(BuildContext context, String name) {
    nameControler.text = name;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Yeni Kullanıcı Adı'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  ProfilTextFormField(
                    controller: nameControler,
                    hintText: 'bekliyorum',
                    obscureText: false,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Boşver')),
              TextButton(
                onPressed: () {
                  ref.child(SessionController().userId.toString()).update({
                    'username': nameControler.text.toString(),
                  });
                  Navigator.pop(context);
                },
                child: const Text('Oki'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.child(SessionController().userId.toString()).onValue,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Card(
            shadowColor: Colors.black,
            color: Colors.white,
            //color: const Color(0xFFFFF8E1),
            margin: const EdgeInsets.all(8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListTile(
                onTap: () {
                  showUsernameDialogAlert(context, '');
                },
                leading: const Icon(
                  Icons.person,
                  size: 40,
                  color: Color(0xFF328777),
                ),
                title: RichText(
                  text: const TextSpan(
                    text: '',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        height: 1.5),
                  ),
                ),
              ),
            ),
          );
        } else if (snapshot.hasData) {
          Map<dynamic, dynamic> map = snapshot.data.snapshot.value;

          return Card(
            shadowColor: Colors.black,
            color: Colors.white,
            //color: const Color(0xFFFFF8E1),
            margin: const EdgeInsets.all(8),
            //elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListTile(
                onTap: () {
                  showUsernameDialogAlert(context, '');
                },
                leading: const Icon(
                  Icons.person,
                  size: 40,
                  color: Color(0xFF328777),
                ),
                title: RichText(
                  text: TextSpan(
                    text: map['username'],
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        height: 1.5),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Text("HATA");
        }
      },
    );
  }
}
