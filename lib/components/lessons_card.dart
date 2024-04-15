import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nerdesin_ytu/components/background_color.dart';

class LessonsCard extends StatefulWidget {
  String title;
  String subtitle;
  IconData icon;

  LessonsCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.subtitle});

  @override
  State<LessonsCard> createState() => _LessonsCardState();
}

class _LessonsCardState extends State<LessonsCard> {
  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFFFFFF),
      //getRandomColor(),
      margin: EdgeInsets.all(8),
      //elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListTile(
          leading: Icon(
            widget.icon,
            size: 50,
            color: Color(0xFF328777),
          ),
          isThreeLine: true,
          title: RichText(
            text: TextSpan(
              text: widget.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  height: 1.5),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              widget.subtitle,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
