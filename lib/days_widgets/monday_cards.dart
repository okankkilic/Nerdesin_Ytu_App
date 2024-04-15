import 'package:flutter/material.dart';

import '../components/lessons_card.dart';
import 'all_days.dart';

class MondayCard extends StatelessWidget {
  const MondayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        LessonsCard(
          title: 'Fizik 1  (09:00 - 11:00)',
          icon: Icons.cached,
          subtitle: 'Okan, Reyhan\n\nB1-D01(Gr.3), B1-D02',
        ),
        LessonsCard(
          title: 'Analitik Geo 1  (09:00 - 12:00)',
          icon: Icons.analytics,
          subtitle: 'Buket, Murat, Dilan, Erkan, Peyman\n\nB1-A06(tr), B1-D04',
        ),
        LessonsCard(
          title: 'PC Prog. 1  (09:00 - 12:00)',
          icon: Icons.computer,
          subtitle: 'Jamshid, Eray, Başak, Dilan, Hakan, Alper\n\nB1-D05',
        ),
        LessonsCard(
          title: 'Oyunlar Teo. (09:00 - 12:00)',
          icon: Icons.gamepad_outlined,
          subtitle: 'Mehmet Efe\n\nBZ-D05',
        ),
        LessonsCard(
          title: 'Lineer Cebir 1  (13:00 - 15:00)',
          icon: Icons.accessible_forward,
          subtitle: 'Reyhan, Eray, Peyman\n\nB1-A06(tr), B1-D04',
        ),
        LessonsCard(
          title: 'Sayısal Analiz 1 (13:00-15:00)',
          icon: Icons.nfc,
          subtitle:
              'Jamshid, Eray, Murat, Mehmet Efe, Erkan, Hakan, Alper\n\nBZ-A04',
        ),
        LessonsCard(
          title: 'Soyut Mat. (15:00 - 18:00)',
          icon: Icons.cloud_outlined,
          subtitle: 'Murat\n\nB1-A06',
        ),
        LessonsCard(
          title: 'Fonk. Analiz (15:00 - 17:00)',
          icon: Icons.ac_unit,
          subtitle: 'Okan, Buket, Başak, Dilan, Alper, Liyana\n\nBZ-A06',
        ),
        LessonsCard(
          title: 'Dif. Denk. (15:00 - 17:00)',
          icon: Icons.dashboard_outlined,
          subtitle: 'Peyman\n\nBZ-A04',
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
      ],
    );
  }
}
