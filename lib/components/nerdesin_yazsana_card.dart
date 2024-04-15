import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nerdesin_ytu/components/profil_textformfield.dart';

import '../services/session_manager.dart';

class NerdesinYazsanaCard extends StatefulWidget {
  String title;
  IconData icon;

  NerdesinYazsanaCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  State<NerdesinYazsanaCard> createState() => _NerdesinYazsanaCardState();
}

class _NerdesinYazsanaCardState extends State<NerdesinYazsanaCard> {
  String formattedDate = DateFormat('kk:mm EEE').format(DateTime.now());
  String formattedUpdateDate =
      DateFormat('yyyy/MM/dd HH:mm').format(DateTime.now());

  final locControler = TextEditingController();
  final ref = FirebaseDatabase.instance.ref('Users');

  Future<void> showLocationDialogAlert(BuildContext context, String loc) {
    locControler.text = loc;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Yaz Yaz Yaz'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  ProfilTextFormField(
                    controller: locControler,
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
                    'location': locControler.text.toString(),
                    'lastUpdate': formattedDate,
                    'lastUpdateList': formattedUpdateDate,
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
    return Card(
      shadowColor: Colors.black,
      color: Colors.white,
      //color: const Color(0xFFFFD6D6),
      margin: const EdgeInsets.all(8),
      //elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListTile(
          onTap: () {
            showLocationDialogAlert(context, '');
          },
          leading: Icon(
            widget.icon,
            size: 40,
            color: Color(0xFF328777),
          ),
          title: RichText(
            text: TextSpan(
              text: widget.title,
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
  }
}
