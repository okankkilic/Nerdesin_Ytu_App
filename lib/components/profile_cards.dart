import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nerdesin_ytu/components/background_color.dart';

class ProfileCard extends StatefulWidget {
  String title;
  IconData icon;
  Widget widget;

  ProfileCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.widget});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  //var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      color: Colors.white,
      //color: const Color(0xFFE6F9FF),
      margin: const EdgeInsets.all(8),
      //elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => widget.widget,
                ));
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
