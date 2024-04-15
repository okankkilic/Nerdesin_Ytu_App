import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../components/lessons_card.dart';
import 'all_days.dart';

class WednesdayCard extends StatelessWidget {
  const WednesdayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      LessonsCard(
        title: 'Dif. Geo. 1  (09:00 - 12:00)',
        icon: Icons.gesture_outlined,
        subtitle:
            'Jamshid, Eray, Reyhan, Buket, Murat, Mehmet Efe, Başak, Hakan, Alper, Liyana\n\nB1-A06(tr) , B1-D12 ',
      ),
      LessonsCard(
        title: 'Veri Madenciliği(09:00-12:00)',
        icon: Ionicons.diamond,
        subtitle: 'Dilan\n\nKMB-224',
      ),
      LessonsCard(
        title: 'KFT (12:00 - 14:00)',
        icon: Icons.airplane_ticket_outlined,
        subtitle: 'Okan, Buket, Başak, Dilan, Liyana\n\nBZ-A02',
      ),
      LessonsCard(
        title: 'Dif. Denk. (12:00 - 14:00)',
        icon: Icons.dashboard_outlined,
        subtitle: 'Peyman\n\nBZ-A06',
      ),
      LessonsCard(
        title: 'Sistem Analizi (15:00 - 18:00)',
        icon: Icons.all_inbox_outlined,
        subtitle: 'Reyhan, Liyana\n\nOnline',
      ),
      LessonsCard(
        title: 'Cebir 1 (16:00 - 18:00)',
        icon: Icons.all_inclusive_sharp,
        subtitle:
            'Okan, Reyhan, Jamshid, Eray, Erkan, Hakan\n\nB1-A06(tr), B1-A08',
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
