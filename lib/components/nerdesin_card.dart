import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nerdesin_ytu/components/background_color.dart';
import 'package:nerdesin_ytu/services/session_manager.dart';

class NerdesinCard extends StatefulWidget {
  String title;
  IconData icon;

  NerdesinCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  State<NerdesinCard> createState() => _NerdesinCardState();
}

class _NerdesinCardState extends State<NerdesinCard> {
  String formattedDate = DateFormat('kk:mm EEE').format(DateTime.now());
  String formattedUpdateDate =
      DateFormat('yyyy/MM/dd HH:mm').format(DateTime.now());

  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  DatabaseReference ref = FirebaseDatabase.instance.ref().child('Users');

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      //color: getRandomColor(),
      margin: const EdgeInsets.all(8),
      //elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListTile(
          leading: Icon(
            widget.icon,
            size: 50,
            color: const Color(0xFF328777),
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
          trailing: IconButton(
            onPressed: () {
              ref.child(SessionController().userId.toString()).update({
                'location': widget.title,
                'lastUpdate': formattedDate,
                'lastUpdateList': formattedUpdateDate,
              });
            },
            icon: const Icon(
              Icons.add,
              color: Color(0xFF37329F),
            ),
          ),
        ),
      ),
    );
  }
}
