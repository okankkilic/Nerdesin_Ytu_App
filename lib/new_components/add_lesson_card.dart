import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nerdesin_ytu/components/background_color.dart';

import 'add_lesson_tap.dart';

class AddLessonCard extends StatefulWidget {
  String title;
  String day;
  AddLessonCard({
    super.key,
    required this.title,
    required this.day,
  });

  @override
  State<AddLessonCard> createState() => _AddLessonCardState();
}

class _AddLessonCardState extends State<AddLessonCard> {
  String formattedDate = DateFormat('kk:mm EEE').format(DateTime.now());
  String formattedUpdateDate =
      DateFormat('yyyy/MM/dd HH:mm').format(DateTime.now());

  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  DateTime date = DateTime.now();

  final reff = FirebaseDatabase.instance.ref('Users');
  //snapshot.child('students').value.toString()

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
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
              AddLessonTap(
                title: widget.title,
                day: widget.day,
              );
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
