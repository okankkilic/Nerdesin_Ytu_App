import 'package:flutter/material.dart';

import '../components/lessons_card.dart';
import 'all_days.dart';

class FridayCard extends StatelessWidget {
  const FridayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      LessonsCard(
        title: 'Fizik 1  (09:00 - 12:00)',
        icon: Icons.cached,
        subtitle: 'Okan , Reyhan\n\nB1-D01(Gr.3), B1-D02',
      ),
      LessonsCard(
        title: 'Analiz 3  (09:00 - 12:00)',
        icon: Icons.wheelchair_pickup,
        subtitle: 'Murat, Peyman\n\nB1-D11(tr) , B2-A08',
      ),
      LessonsCard(
        title: 'Pc Prog. Giriş (14:00 - 17:00)',
        icon: Icons.fast_forward_outlined,
        subtitle: 'Erkan, Hakan\n\nOnline',
      ),
      LessonsCard(
        title: 'Mat. İstatistik (14:00 - 17:00)',
        icon: Icons.medical_information_outlined,
        subtitle: 'Liyana\n\nB1-D03',
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
    ]);
  }
}
