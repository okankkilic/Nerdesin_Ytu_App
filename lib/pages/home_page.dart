import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nerdesin_ytu/days_widgets/friday_cards.dart';
import 'package:nerdesin_ytu/days_widgets/monday_cards.dart';
import 'package:nerdesin_ytu/days_widgets/thursday_cards.dart';
import 'package:nerdesin_ytu/days_widgets/tuesday_cards.dart';
import 'package:nerdesin_ytu/days_widgets/weekend_cards.dart';

import '../days_widgets/wednesday_cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime date = DateTime.now();

  dynamic listPersons(var lesson) {
    lesson.forEach((lesson) => (lesson));
    return lesson;
  }

  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    String day = DateFormat('EEEE').format(date);
    //day = 'Thursday';

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('DERSLER'),
        backgroundColor: Color(0xFF231F62), //daha koyu
        //backgroundColor: Colors.indigo[500],
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 3.0,
                        spreadRadius: 0.0,
                        offset: Offset(1.0, 1.0),
                      )
                    ],
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF282472),
                        Color(0xFF302B8A),
                        Color(0xFF37329F),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        day,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                /*
                color: Color(0xFF43C6AC),
                //color: Colors.pink[200],
                margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),


                child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        day,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                   */
              ),
            ),
            Expanded(flex: 6, child: onDay(day: day) as Widget),
          ],
        ),
      ),
    );
  }

  Widget? onDay({required String day}) {
    Widget? widget;
    switch (day) {
      case 'Monday':
        widget = const MondayCard();
        break;
      case 'Tuesday':
        widget = const TuesdayCard();
        break;
      case 'Wednesday':
        widget = const WednesdayCard();
        break;
      case 'Thursday':
        widget = const ThursdayCard();
        break;
      case 'Friday':
        widget = const FridayCard();
        break;
      case 'Saturday' || 'Sunday':
        widget = const WeekendCard();
      default:
        break;
    }
    return widget;
  }
}
