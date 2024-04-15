import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nerdesin_ytu/components/background_color.dart';
import 'package:nerdesin_ytu/services/session_manager.dart';

class AddLessonTap extends StatefulWidget {
  String title;
  String day;
  AddLessonTap({
    super.key,
    required this.title,
    required this.day,
  });

  @override
  State<AddLessonTap> createState() => _AddLessonTapState();
}

class _AddLessonTapState extends State<AddLessonTap> {
  String formattedDate = DateFormat('kk:mm EEE').format(DateTime.now());
  String formattedUpdateDate =
      DateFormat('yyyy/MM/dd HH:mm').format(DateTime.now());

  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  //DateTime date = DateTime.now();

  final reff = FirebaseDatabase.instance.ref('Users');
  //snapshot.child('students').value.toString()

  @override
  Widget build(BuildContext context) {
    //String day = DateFormat('EEEE').format(date);
    DatabaseReference ref =
        FirebaseDatabase.instance.ref().child('Lessons/Days/${widget.day}');
    final refs = FirebaseDatabase.instance.ref('Lessons/Days/${widget.day}');

    return StreamBuilder(
        stream: reff.child(SessionController().userId.toString()).onValue,
        builder: (context, AsyncSnapshot snapshot2) {
          if (!snapshot2.hasData) {
            return const Text("");
          } else {
            return StreamBuilder(
              stream: refs.child(widget.title).onValue,
              builder: (context, AsyncSnapshot snapshot1) {
                if (!snapshot1.hasData) {
                  return const Text("");
                } else {
                  Map<dynamic, dynamic> map1 = snapshot1.data.snapshot.value;
                  Map<dynamic, dynamic> map2 = snapshot2.data.snapshot.value;

                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
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
                            ref.child(widget.title.toString()).update({
                              'students':
                                  map1['students'] + ' ' + map2['username'],
                            });
                          },
                          icon: const Icon(
                            Icons.cake_outlined,
                            color: Color(0xFF37329F),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            );
          }
        });
  }
}
