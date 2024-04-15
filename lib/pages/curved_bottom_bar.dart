import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:nerdesin_ytu/pages/map_page.dart';
import 'package:nerdesin_ytu/pages/profile_page.dart';

import 'burdayım_page.dart';
import 'home_page.dart';

class CurvedNavigatorBar extends StatefulWidget {
  const CurvedNavigatorBar({super.key});

  @override
  State<CurvedNavigatorBar> createState() => _CurvedNavigatorBarState();
}

class _CurvedNavigatorBarState extends State<CurvedNavigatorBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        backgroundColor: Colors.grey.shade200,
        //color: Color(0xFF2E1B64),
        color: Color(0xFF231F62),
        //color: Colors.indigo.shade500,
        animationDuration: Duration(milliseconds: 300),
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.map,
            color: Colors.white,
          ),
          Icon(
            Icons.location_on,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
        ],
      ),
      body: getSelectedWidget(index: index),
    );
  }

  Widget? getSelectedWidget({required int index}) {
    Widget? widget;
    switch (index) {
      case 0:
        widget = const HomePage();
        break;
      case 1:
        widget = const MapPage();
        break;
      case 2:
        widget = const BurdayimPage();
        break;
      case 3:
        widget = const ProfilePage();
        break;
    }
    return widget;
  }
}
