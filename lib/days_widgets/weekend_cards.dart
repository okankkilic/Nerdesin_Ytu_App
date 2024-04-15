import 'package:flutter/material.dart';

import '../components/lessons_card.dart';
import 'all_days.dart';

class WeekendCard extends StatelessWidget {
  const WeekendCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.horizontal, children: [
      Expanded(
        child: ListView(shrinkWrap: true, children: [
          LessonsCard(
            title: 'Ders Yok',
            icon: Icons.favorite_border,
            subtitle: 'yok',
          ),
          const SizedBox(
            height: 300,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => const AllDays(),
                  ));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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
                      Color(0xFF328777),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Tüm Günler',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    ]);
  }
}
