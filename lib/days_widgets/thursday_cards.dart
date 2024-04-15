import 'package:flutter/material.dart';

import '../components/lessons_card.dart';
import 'all_days.dart';

class ThursdayCard extends StatelessWidget {
  const ThursdayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      LessonsCard(
        title: 'Topoloji (09:00 - 11:00)',
        icon: Icons.dangerous,
        subtitle:
            'Jamshid, Reyhan, Okan, Buket, Mehmet Efe, Başak, Hakan, Murat\n\nBZ-A04',
      ),
      LessonsCard(
        title: 'Cebir 1 (11:00 - 13:00)',
        icon: Icons.all_inclusive_sharp,
        subtitle:
            'Okan, Reyhan, Jamshid, Eray, Erkan, Hakan\n\nB1-D11(tr), B1-D13',
      ),
      LessonsCard(
        title: 'Riesz Uzayları (11:00 - 13:00)',
        icon: Icons.rocket_launch_outlined,
        subtitle: 'Buket\n\nBZ-D05',
      ),
      LessonsCard(
        title: 'Lineer Cebir 1  (13:00 - 15:00)',
        icon: Icons.accessible_forward,
        subtitle: 'Reyhan, Eray, Peyman\n\nB1-A06(tr), B1-D11',
      ),
      LessonsCard(
        title: 'Sayısal Analiz 1 (13:00-15:00)',
        icon: Icons.nfc,
        subtitle:
            'Jamshid, Eray, Murat, Mehmet Efe, Erkan, Hakan, Alper\n\nBZ-A04',
      ),
      LessonsCard(
        title: 'Fonk. Analiz (15:00 - 17:00)',
        icon: Icons.ac_unit,
        subtitle: 'Okan, Buket, Başak, Dilan, Alper, Liyana\n\nBZ-A04',
      ),
      LessonsCard(
        title: 'Pc Prog. Giriş (15:00 - 17:00)',
        icon: Icons.fast_forward_outlined,
        subtitle: 'Erkan, Hakan\n\nB1-A06',
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
