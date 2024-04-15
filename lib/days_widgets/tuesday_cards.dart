import 'package:flutter/material.dart';

import '../components/lessons_card.dart';
import 'all_days.dart';

class TuesdayCard extends StatelessWidget {
  const TuesdayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      LessonsCard(
        title: 'Soyut Cebir  (09:00 - 12:00)',
        icon: Icons.cloudy_snowing,
        subtitle: 'Jamshid, Eray, Reyhan, Mehmet Efe, Erkan, Liyana\n\nB1-A06',
      ),
      LessonsCard(
        title: 'Analiz 3  (09:00 - 12:00)',
        icon: Icons.wheelchair_pickup,
        subtitle: 'Murat, Peyman\n\nB1-D03(tr) , B1-D04',
      ),
      LessonsCard(
        title: 'Topoloji (12:00 - 14:00)',
        icon: Icons.dangerous,
        subtitle:
            'Jamshid, Reyhan, Okan, Buket, Mehmet Efe, Başak, Hakan, Murat\n\nB1-A06',
      ),
      LessonsCard(
        title: 'Lineer Prog. (14:00 - 17:00)',
        icon: Icons.airline_seat_recline_extra_rounded,
        subtitle: 'Murat, Erkan, Hakan\n\nB1-A06',
      ),
      LessonsCard(
        title: 'KFT (17:00 - 19:00)',
        icon: Icons.airplane_ticket_outlined,
        subtitle: 'Okan, Buket, Başak, Dilan, Liyana\n\nB1-A06 ',
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
